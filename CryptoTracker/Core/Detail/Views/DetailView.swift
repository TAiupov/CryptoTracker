//
//  DetailView.swift
//  CryptoTracker
//
//  Created by Тагир Аюпов on 2021-06-11.
//

import SwiftUI

struct DetailLoadingView: View {
    @Binding var coin: CoinModel?
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
            }
            
        }
    }
}

struct DetailView: View {
    let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        print("Init detail for \(coin.name)")
    }
    
    var body: some View {
        
        Text(coin.name)
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(coin: dev.coin)
    }
}
