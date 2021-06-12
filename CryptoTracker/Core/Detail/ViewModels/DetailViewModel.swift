//
//  DetailViewModel.swift
//  CryptoTracker
//
//  Created by Тагир Аюпов on 2021-06-12.
//

import Foundation
import Combine


class DetailViewModel: ObservableObject {
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    
    private func addSubscribers() {
        coinDetailService.$coinDetails
            .sink { returnedCoinDetails in
                print("received")
                print(returnedCoinDetails)
            }
            .store(in: &cancellables)
    }
}
