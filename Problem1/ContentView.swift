//
//  ContentView.swift
//  Problem1
//
//  Created by 和泉田 領一 on 2022/08/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let _ = Self._printChanges()

        NavigationView {
            NavigationLink {
                SecondView().onAppear {
                                print("View.onAppear")
                            }
                            .onDisappear {
                                print("View.onDisappear")
                            }
            } label: {
                Text("View for logging")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
