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
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }

    func readFrame(coordinateSpace: CoordinateSpace, onChange: @escaping (CGRect) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: GlobalFramePreferenceKey.self, value: geometryProxy.frame(in: coordinateSpace))
            }
        )
        .onPreferenceChange(GlobalFramePreferenceKey.self, perform: onChange)
    }

    func readGlobalFrame(onChange: @escaping (CGRect) -> Void) -> some View {
        readFrame(coordinateSpace: .global, onChange: onChange)
    }

    func readOffset(onChange: @escaping (CGPoint) -> Void) -> some View {
        readFrame(coordinateSpace: .global) { frame in
            onChange(frame.origin)
        }
    }

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
