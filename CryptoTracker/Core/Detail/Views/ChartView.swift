//
//  ChartView.swift
//  CryptoTracker
//
//  Created by Tagir Aiupov on 2021-06-14.
//

import SwiftUI

struct ChartView: View {
    private let data: [Double]
    private let maxY: Double
    private let minY: Double
    private let lineColor: Color
    private let startDate: Date
    private let endDate: Date
    
    @State private var percentage: CGFloat = 0
    
    init(coin: CoinModel) {
        data = coin.sparklineIn7D?.price ?? []
        maxY = data.max() ?? 0
        minY = data.min() ?? 0
        
        let priceChange = (data.last ?? 0) - (data.first ?? 0)
        lineColor = priceChange > 0 ? Color.theme.green : Color.theme.red
        
        endDate = Date(coinGeckoString: coin.lastUpdated ?? "")
        startDate = endDate.addingTimeInterval(-7*24*60*60)
    }
    
    var body: some View {
        VStack {
            chartView
                .frame(height: 200)
                .background(chartBackground)
                .overlay(chartYAxis
                            .padding(.horizontal, 4),
                         alignment: .leading)
            shortDateLabels
                .padding(.horizontal, 4)
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation {
                    percentage = 1.0
                }
            }
        }
        
        
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(coin: dev.coin)
    }
}


extension ChartView {
    private var chartView: some View {
        GeometryReader { geo in
            Path { path in
                for index in data.indices {
                    let xPosition = geo.size.width / CGFloat(data.count) * CGFloat(index + 1)
                    
                    let yAxis = maxY - minY
                    let yPosition = ( 1 - CGFloat((data[index] - minY) / yAxis)) * geo.size.height
                    if index == 0 {
                        path.move(to: CGPoint(x: xPosition, y: yPosition))
                    }
                    path.addLine(to: CGPoint(x: xPosition, y: yPosition))
                }
            }
            .trim(from: 0, to: percentage)
            .stroke(lineColor,
                    style: StrokeStyle(lineWidth: 2,
                                       lineCap: .round,
                                       lineJoin: .round))
            .shadow(color: lineColor, radius: 10, x: 0.0, y: 0.0)
            .shadow(color: lineColor.opacity(0.5), radius: 10, x: 0.0, y: 20)
            .shadow(color: lineColor.opacity(0.2), radius: 10, x: 0.0, y: 30)
            .shadow(color: lineColor.opacity(0.1), radius: 10, x: 0.0, y: 40)
            .shadow(color: lineColor.opacity(0.02), radius: 10, x: 0.0, y: 50)
            
            
        }
    }
    
    private var chartBackground: some View {
        VStack {
            Divider()
            Spacer()
            Divider()
            Spacer()
            Divider()
        }
    }
    
    private var chartYAxis: some View {
        VStack {
            Text(maxY.formattedWithAbbreviations())
            Spacer()
            
            Text(((maxY + minY) / 2).formattedWithAbbreviations())
            Spacer()
            Text(minY.formattedWithAbbreviations())
            
        }
    }
    
    private var shortDateLabels: some View {
        HStack {
            Text(startDate.asShortDateString())
            Spacer()
            Text(endDate.asShortDateString())
        }
    }
}
