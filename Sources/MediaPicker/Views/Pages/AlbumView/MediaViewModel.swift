//
//  Created by Alex.M on 03.06.2022.
//
import Foundation
import Combine

class MediaViewModel: ObservableObject {
    let media: AssetMediaModel
    
    private var imageCancellable: AnyCancellable?
    
    init(media: AssetMediaModel) {
        self.media = media
    }
    
    
    @Published var preview: UniversalImage? = nil
    
    
    func onStart(size: CGSize) {
        imageCancellable = media.source
            .image(size: size)
            .sink {
                self.preview = $0
            }
    }
    
    func onStop() {
        imageCancellable = nil
    }
}
