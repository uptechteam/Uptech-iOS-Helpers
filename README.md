# Uptech-iOS-Helpers 

[![Made in Ukraine](https://img.shields.io/badge/made_in-ukraine-ffd700.svg?labelColor=0057b7)](https://stand-with-ukraine.pp.ua)

iOS helper library that contains commonly used code in **Uptech** iOS projects.

## What's included
<details>

  <summary><strong>🔧 Foundation Helpers</strong></summary>

 
  - Array extensions
    - safe subscript
    - next, previous, remove *Element* methods
    
  - Collection:
     - subscript by indexPath
     
</details>

<details>
 
  <summary><strong>🖼️ UIKit Helpers</strong></summary>

  
  - Protocols
    - **ReusableCell**
        
        Protocol that helps with reusable cells. 
          
        If used on UITableViewCell subclasses provides handy methods for registering and dequeueing cells in UITableView's
        
     - **NibInitializable**
  
        Protocol that helps to initialize view with xib.
  - Table & Collection View helpers
    - *dequeue* and *register* methods for cells that confirm's to **ReusableCell** and optionally **NibInitializable** (for cell's created via xibs)
  - UI-in-code helpers
    - UIView extensions:
      - subview adding, insertions *with* constrains
      - corner radius
    - NSLayoutConstraint:
      - priority changing method
      - constraint activation method for array of constrains
    - UILayoutPriority:
      - frequently used values

</details>

<details>
  
  <summary><strong>🕊️ SwiftUI helpers</strong></summary>

 
  - Layouts
    - ProportionalHStack and ProportionalVStack
      - Layouts that resizes views with given proportions

  - View extensions
    - conditionalModifiers (if, if/else), regular modifier
    - customOnChange
    - size/frame/offset/safeAreaInsets readers

</details>

## Installation

#### Swift Package Manager
*Note: Instructions below are for using SwiftPM without the Xcode UI. It's the easiest to go to your Project Settings -> Swift Packages and add Package from there using link https://github.com/uptechteam/Uptech-iOS-Helpers.git*

Package contains 4 libraries:
- UptechFoundationHelper
- UptechUIKitHelper
- UptechSwiftUIHelper
- Uptech-iOS-Helpers (first 3 combined)

To integrate using Apple's Swift package manager, without Xcode integration, add the following as a dependency to your Package.swift:
```swift
.package(url: "https://github.com/uptechteam/Uptech-iOS-Helpers.git", .upToNextMajor(from: "2.0.0"))
```

#### CocoaPods

> [!CAUTION]
> CocoaPods is deprecated starting with version 2.0.0
