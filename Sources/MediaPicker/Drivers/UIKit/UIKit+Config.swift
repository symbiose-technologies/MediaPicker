//
//  Created by Alex.M on 06.07.2022.
//
#if os(iOS)
import UIKit

func setupNavigationBarAppearance() {
    let appearance = UINavigationBarAppearance()
    appearance.backgroundColor = .white
    UINavigationBar.appearance().standardAppearance = appearance
}
#else
func setupNavigationBarAppearance() {
    print("[MediaPicker] setupNavigationBarAppearance has no effect on macOS")
}

#endif
