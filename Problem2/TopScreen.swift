//
//  ContentView.swift
//  Problem2
//
//  Created by 和泉田 領一 on 2022/08/20.
//

import SwiftUI

struct TopScreen: View {
    @State private var text: String = ""

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AScreen(text: text)) {
                    Text("画面Aを表示")
                }
                TextField("画面Aに渡す文字列を入力", text: $text)
                .padding()
            }
            .navigationBarHidden(true)
            .ignoresSafeArea(.keyboard)
        }
    }
}

struct TopScreen_Previews: PreviewProvider {
    static var previews: some View {
        TopScreen()
    }
}
