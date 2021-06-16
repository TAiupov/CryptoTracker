//
//  SettingsView.swift
//  CryptoTracker
//
//  Created by Tagir Aiupov on 2021-06-16.
//

import SwiftUI

struct SettingsView: View {
    
    let defaultURL = URL(string: "https://www.google.com")!
    let linkedInURL = URL(string: "https://www.linkedin.com/in/tagir-aiupov")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    
    
    var body: some View {
        NavigationView {
            List {
                topSection
                coinGeckoSection
                applicationSection
            }
            .font(.headline)
            .accentColor(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
                }
            }
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    
    private var topSection: some View {
        Section(header: Text("INFO")) {
            VStack(alignment: .leading) {
                HStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    Image("avatar")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(CGSize(width: 2.5, height: 2.5))
                        .offset(x: 0.0, y: 45.0)
                        .frame(width: 100, height: 100)
                        .overlay(RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.theme.secondaryText))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        
                        
                }
                Text("This app uses MVVM Architechture, Combine and CoreData.")
                    .font(.callout)
                    .bold()
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("LinkedIn", destination: linkedInURL)
            
            
        }
    }
    
    private var coinGeckoSection: some View {
        Section(header: Text("Coingecko")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The cryptocurrency data is used in this app from a free API form Coingecko! Prices are slightly delayed.")
                    .font(.callout)
                    .bold()
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit Coingecko 🥳", destination: coingeckoURL)
            
            
        }
    }
    
    private var applicationSection: some View {
        Section(header: Text("Application")) {
            Link("Terms of Service", destination: defaultURL)
            Link("Privacy Policy", destination: defaultURL)
            Link("Company Website", destination: linkedInURL)
            Link("Learn More", destination: linkedInURL)
            
            
        }
    }
    
}
