//
//  Created by Alex.M on 31.05.2022.
//

import SwiftUI

struct ThumbnailView: View {

    let preview: UniversalImage?
    
    var body: some View {
        if let preview = preview {
            GeometryReader { proxy in
                Image(universalImg: preview)
                    .resizable()
                    .scaledToFill()
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .clipped()
            }
        } else {
            ThumbnailPlaceholder()
        }
    }
}
