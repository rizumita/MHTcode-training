//
//  ContentView.swift
//  Problem1
//
//  Created by 和泉田 領一 on 2022/08/08.
//

import SwiftUI
import PopupView

struct ContentView: View {
    @State private var isPopupShownOnAppear = false
    @State private var isPopupShownOnDisappear = false
    private var isPopupShownOnDidBecomeActive: Binding<Bool>

    init(isPopupShownOnDidBecomeActive: Binding<Bool>) {
        self.isPopupShownOnDidBecomeActive = isPopupShownOnDidBecomeActive
    }

    var body: some View {
        let _ = Self._printChanges()

        NavigationView {
            NavigationLink {
                SecondView()
                .onAppear {
                    print("SecondView.onAppear")
                    (isPopupShownOnDidBecomeActive.wrappedValue,
                     isPopupShownOnAppear,
                     isPopupShownOnDisappear) = (false, true, false)
                }
                .onDisappear {
                    print("SecondView.onDisappear")
                    (isPopupShownOnDidBecomeActive.wrappedValue,
                     isPopupShownOnAppear,
                     isPopupShownOnDisappear) = (false, false, true)
                }
            } label: {
                Text("View for logging")
            }
        }
        .popup(isPresented: isPopupShownOnDidBecomeActive,
               type: .floater(),
               position: .bottom,
               autohideIn: 2,
               dragToDismiss: true) {
            popupContent(message: "On did become active")
        }
        .popup(isPresented: $isPopupShownOnAppear,
               type: .floater(),
               position: .bottom,
               autohideIn: 2,
               dragToDismiss: true) {
            popupContent(message: "SecondView: On appear")
        }
        .popup(isPresented: $isPopupShownOnDisappear,
               type: .floater(),
               position: .bottom,
               autohideIn: 2,
               dragToDismiss: true) {
            popupContent(message: "SecondView: On disappear")
        }
    }

    func popupContent(message: String) -> some View {
        Text(message)
        .foregroundColor(.white)
        .frame(height: 40)
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        .background(.gray)
        .cornerRadius(20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(isPopupShownOnDidBecomeActive: Binding(get: { false }, set: { _ in }))
    }
}
