//
//  Created by Alex.M on 03.06.2022.
//

import Foundation
import Combine

class AlbumCellViewModel: ObservableObject {
    let album: AlbumModel
    private var previewCancellable: AnyCancellable?
    
    init(album: AlbumModel) {
        self.album = album
    }
    
    @Published var preview: UniversalImage? = nil
//#if os(iOS)
//    @Published var preview: UniversalImage? = nil
//#else
//    // FIXME: Create preview for image/video for other platforms
//#endif
    
    func fetchPreview(size: CGSize) {
        guard preview == nil else { return }
        
        previewCancellable = album.preview?.source
            .image(size: size)
            .sink(receiveValue: { [weak self] in
                self?.preview = $0
            })
    }
}
