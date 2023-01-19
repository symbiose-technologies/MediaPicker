//
//  View+NotificationCenter.swift
//  
//
//  Created by Alexandra Afonasova on 17.10.2022.
//
import SwiftUI
#if os(iOS)
extension View {

    func onEnteredBackground(perform: @escaping () -> Void) -> some View {
        let publisher = NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)
        return onReceive(publisher) { _ in perform() }
    }

    func onEnteredForeground(perform: @escaping () -> Void) -> some View {
        let publisher = NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)
        return onReceive(publisher) { _ in perform() }
    }

    func onRotate(perform: @escaping (UIDeviceOrientation) -> Void) -> some View {
        let publisher = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
        return onReceive(publisher) { _ in perform(UIDevice.current.orientation) }
    }
}
#elseif os(macOS)
extension View {

    func onEnteredBackground(perform: @escaping () -> Void) -> some View {
        self
    }

    func onEnteredForeground(perform: @escaping () -> Void) -> some View {
        self
    }

}



#endif
