//
// Created by Alex.M on 07.06.2022.
//

import Foundation
import SwiftUI
import Combine

@MainActor
final class MediaPickerViewModel: ObservableObject {
    
    @Published var showingCamera = false
    @Published var showingCameraSelection = false
    @Published var showingExitCameraConfirmation = false
    @Published var pickedMediaUrl: URL?

    @Published var albums: [AlbumModel] = []
    let defaultAlbumsProvider = DefaultAlbumsProvider()
    private let watcher = PhotoLibraryChangePermissionWatcher()
    private var albumsCancellable: AnyCancellable?
    
    // MARK: Calculated property

    func openCamera() {
        self.showingCamera = true
    }
    
    func onStart() {
        defaultAlbumsProvider.reload()
        albumsCancellable = defaultAlbumsProvider.albums.sink { [weak self] albums in
            self?.albums = albums//.map { Album(title: $0.title, preview: $0.preview) }
        }
    }

    func getAlbumModel(_ album: Album) -> AlbumModel? {
        albums.filter { $0.id == album.id }.first
    }
}
