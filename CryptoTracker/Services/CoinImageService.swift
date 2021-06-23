//
//  CoinImageService.swift
//  CryptoTracker
//
//  Created by Tagir Aiupov on 2021-06-01.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    @Published var image: UIImage? = nil
    private var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    private let filemanager = LocalFilemanager.instance
    private let folderName = "coin_images"
    private let imageName: String
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let savedImage = filemanager.getImage(imageName: coin.id, folderName: folderName) {
            image = savedImage
            print("Retrieved from filemanager")
        } else {
            downloadCoinImage()
            print("Downloading")
        }
    }
    
    private func downloadCoinImage() {
        
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscription = NetworkManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkManager.handleCompletion(completion:),
                  receiveValue: { [weak self] (returnedImage) in
                    guard let self = self, let downloadedImage = returnedImage else { return }
                    self.image = downloadedImage
                    self.imageSubscription?.cancel()
                    self.filemanager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
                  })
    }
}
