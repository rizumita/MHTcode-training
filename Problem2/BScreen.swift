//
// Created by 和泉田 領一 on 2022/08/20.
//

import SwiftUI

struct BScreen: View {
    @Binding var text: String

    var body: some View {
        NavigationView {
            TextField("Top画面に渡す文字列を入力", text: $text)
            .multilineTextAlignment(.center)
            .padding()
            .navigationBarHidden(true)
            .ignoresSafeArea(.keyboard)
        }
    }
}
