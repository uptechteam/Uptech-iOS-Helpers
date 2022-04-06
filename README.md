# Uptech iOS Helpers 

iOS helper library that contains commonly used code in **Uptech** iOS projects.

## What's included
- Protocols
  - **ReusableCell**
      
      Protocol that helps with reusable cells. 
        
      If used on UITableViewCell subclasses provides handy methods for registering and dequeueing cells in UITableView's
      
   - **NibInitializable**

      Protocol that helps to initialize view with xib.
- Table & Collection View helpers
  - *dequeue* and *register* methods for cells that confirm's to **ReusableCell** and optionaly **NibInitializable** (for cell's created via xibs)
- UI-in-code helpers
  - UIView extensions:
    - subview adding, insertions *with* constrains
    - corner radius
  - NSLayoutConstraint:
    - priority changing method
    - constraint activation method for array of constrains
  - UILayoutPriority:
    - frequently used values
- Array extensions
  - safe subscript
  - next, previous, remove *Element* methods
- Collection:
  - subscript by indexPath

## Installation

#### Swift Package Manager
*Note: Instructions below are for using SwiftPM without the Xcode UI. It's the easiest to go to your Project Settings -> Swift Packages and add Package from there using link https://github.com/uptechteam/Uptech-iOS-Helpers.git*

To integrate using Apple's Swift package manager, without Xcode integration, add the following as a dependency to your Package.swift:
```swift
.package(url: "https://github.com/uptechteam/Uptech-iOS-Helpers.git", .upToNextMajor(from: "1.0.0"))
```

#### CocoaPods

```rb
pod 'Uptech_iOS_Helpers'
```
