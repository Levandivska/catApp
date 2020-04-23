//
//  ContentView.swift
//  catApp
//
//  Created by оля on 22.04.2020.
//  Copyright © 2020 Olya. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var fetcher = CatFetcher()

    var body: some View {
        VStack {
            NavigationView {
                List(fetcher.cats, id: \.id) { cat in
                    NavigationLink(destination: FullCatInfo(cat: cat)) {
                        CatRowView(cat: cat)
                    }
                }
                .navigationBarTitle(Text("Cat breeds"))
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
