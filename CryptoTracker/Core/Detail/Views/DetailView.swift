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
    @StateObject var vm: DetailViewModel
    private let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    private let spacing: CGFloat = 30
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
        print("Init detail for \(coin.name)")
    }
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 20) {
                Text("Hello")
                    .frame(height: 150)
                
                overviewTitle
                Divider()
                
                overviewGrid
                
                additionalTitle
                Divider()
                
                additionalGrid
            }
        }
        .navigationTitle(vm.coin.name)
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(coin: dev.coin)
        }
    }
}

extension DetailView {
    
    private var overviewTitle: some View {
        Text("Overview")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var additionalTitle: some View {
        Text("Additional Details")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var overviewGrid: some View {
        LazyVGrid(columns: columns,
                  alignment: .center,
                  spacing: spacing,
                  pinnedViews: [],
                  content: {
                    ForEach(vm.overviewStatistics) { stat in
                        StatisticView(stat: stat)
                        
                    }
        })
    }
    
    private var additionalGrid: some View {
        LazyVGrid(columns: columns,
                  alignment: .center,
                  spacing: spacing,
                  pinnedViews: [],
                  content: {
                    ForEach(vm.additionalStatistics) { stat in
                        StatisticView(stat: stat)
                        
                    }
        })
    }
}
