//
//  CurrenciesView.swift
//  Project1 WatchKit Extension
//
//  Created by Paul Hudson on 18/02/2020.
//  Copyright © 2020 Paul Hudson. All rights reserved.
//

import SwiftUI

struct CurrenciesView: View {
    @State private var selectedCurrencies = UserDefaults.standard.array(forKey: ContentView.selectedCurrenciesKey) as? [String] ?? ContentView.defaultCurrencies

    let selectedColor = Color(red: 0, green: 0.55, blue: 0.25)
    let deselectedColor = Color(red: 0.3, green: 0, blue: 0)

    var body: some View {
        List {
            ForEach(ContentView.currencies, id: \.self) { currency in
                Button(currency) {
                    self.toggle(currency)
                }
                .listRowPlatterColor(self.selectedCurrencies.contains(currency) ? self.selectedColor : self.deselectedColor)
            }
        }
        .navigationBarTitle("Currencies")
        .listStyle(CarouselListStyle())
    }

    func toggle(_ currency: String) {
        if let index = selectedCurrencies.firstIndex(of: currency) {
            // if the currency was found in our selected currencies, remove it
            selectedCurrencies.remove(at: index)
        } else {
            // otherwise add it
            selectedCurrencies.append(currency)
        }

        // save the new selected currencies
        UserDefaults.standard.set(selectedCurrencies, forKey: ContentView.selectedCurrenciesKey)
    }
}

struct CurrenciesView_Previews: PreviewProvider {
    static var previews: some View {
        CurrenciesView()
    }
}
