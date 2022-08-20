//
//  ContentView.swift
//  Problem2
//
//  Created by 和泉田 領一 on 2022/08/20.
//

import SwiftUI

struct TopScreen: View {
    @State private var text: String = ""
    @State private var textFromBScreen: String = ""

    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                NavigationLink(destination: AScreen(text: text)) {
                    Text("画面Aを表示")
                }

                TextField("画面Aに渡す文字列を入力", text: $text)
                .multilineTextAlignment(.center)
                .padding()

                Spacer()

                NavigationLink(destination: BScreen(text: $textFromBScreen)) {
                    Text("画面Bを表示")
                }

                Text("画面Bで入力した文字列")
                .foregroundColor(Color.gray)
                .padding()

                Text(textFromBScreen)
                .padding()

                Spacer()
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
