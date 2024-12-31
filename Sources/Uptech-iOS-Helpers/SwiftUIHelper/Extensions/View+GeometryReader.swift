//
//  View+GeometryReader.swift
//
//
//  Created by Sergey Kletsov on 02.08.2024.
//

import SwiftUI

private struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero

    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

private struct GlobalFramePreferenceKey: PreferenceKey {
    static var defaultValue: CGRect = .zero

    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {}
}

public extension View {
    /// Modifier to read view size. Uses GeometryReader
    /// - Parameter onChange: A closure to run when size changes
    /// - Returns: A view that calls onChange closure when the view size changes.
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
    
    /// Modifier to read view frame. Uses GeometryReader
    /// - Parameters:
    ///   - coordinateSpace: Coordinate space to get frame
    ///   - onChange: A closure to run when frame changes
    /// - Returns: A view that calls onChange closure when the view frame changes in given coordinate space.
    func readFrame(coordinateSpace: CoordinateSpace, onChange: @escaping (CGRect) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: GlobalFramePreferenceKey.self, value: geometryProxy.frame(in: coordinateSpace))
            }
        )
        .onPreferenceChange(GlobalFramePreferenceKey.self, perform: onChange)
    }
    
    /// Modifier to read view frame in global coordinate space. Uses GeometryReader
    ///   - onChange: A closure to run when frame changes
    /// - Returns: A view that calls onChange closure when the view frame changes in global coordinate space.
    func readGlobalFrame(onChange: @escaping (CGRect) -> Void) -> some View {
        readFrame(coordinateSpace: .global, onChange: onChange)
    }
    
    /// Modifier to read view origin in global coordinate space. Uses GeometryReader
    ///   - onChange: A closure to run when frame's origin changes
    /// - Returns: A view that calls onChange closure when the view frame's origin changes in global coordinate space.
    func readOffset(onChange: @escaping (CGPoint) -> Void) -> some View {
        readFrame(coordinateSpace: .global) { frame in
            onChange(frame.origin)
        }
    }
    
    /// Modifier to read view safeAreaInsets. Embeds view inside GeometryReader
    /// - Parameter closure: A closure to run when view safeAreaInsets are configured (after view appeared)
    /// - Returns: GeometryReader that contains view and calls closure after view is appeared with calculated safeAreaInsets
    func readInsets(_ closure: @escaping (EdgeInsets) -> Void) -> some View {
        GeometryReader { geometryProxy in
            self.onAppear {
                DispatchQueue.main.async {
                    closure(geometryProxy.safeAreaInsets)
                }
            }
        }
    }
}
