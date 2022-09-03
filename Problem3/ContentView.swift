//
//  ContentView.swift
//  Problem3
//
//  Created by 和泉田 領一 on 2022/09/03.
//

import SwiftUI

struct ContentView: View {
    @State private var indexedNumbers = Array(AnyIterator { Int.random(in: 1...1000) }.prefix(1000).enumerated())

    var body: some View {
        List(indexedNumbers, id: \.0) {
            Text("\($1)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
