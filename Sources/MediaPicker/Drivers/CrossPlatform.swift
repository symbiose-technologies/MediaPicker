//
//  File.swift
//  
//
//  Created by Ryan Mckinney on 1/19/23.
//

#if os(macOS)
import AppKit

/**
 This typealias bridges platform-specific images to simplify
 multi-platform support.
 */
public typealias UniversalImage = NSImage

extension NSImage {
    var cgImage: CGImage? {
        
        var proposedRect = CGRect(origin: .zero, size: size)

        return cgImage(forProposedRect: &proposedRect,
                       context: nil,
                       hints: nil)
    }
}
#endif


#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit

/**
 This typealias bridges platform-specific images to simplify
 multi-platform support.
 */
public typealias UniversalImage = UIImage
#endif


import SwiftUI
extension Image {
    public init(universalImg: UniversalImage) {
        #if os(iOS)
        self.init(uiImage: universalImg)
        #elseif os(macOS)
        self.init(nsImage: universalImg)
        #endif
    }
}




#if os(macOS)
import AppKit
typealias UniversalScreen = NSScreen
extension UniversalScreen {
    static func getScale() -> CGFloat {
        let scale: CGFloat =  NSScreen.main?.backingScaleFactor ?? 2.0
        return scale
    }
}
#endif

#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
typealias UniversalScreen = UIScreen

extension UniversalScreen {
    static func getScale() -> CGFloat {
        let scale = UIScreen.main.scale
        return scale
    }
}
#endif





#if os(macOS)
import AppKit
/**
 This typealias bridges platform-specific colors to simplify
 multi-platform support.
 */
public typealias UniversalColor = NSColor
extension UniversalColor {
    
}
#endif


#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit

/**
 This typealias bridges platform-specific colors to simplify
 multi-platform support.
 */
public typealias UniversalColor = UIColor
#endif
