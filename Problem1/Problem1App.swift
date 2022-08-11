//
//  Problem1App.swift
//  Problem1
//
//  Created by 和泉田 領一 on 2022/08/08.
//

import SwiftUI

@main
struct Problem1App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
            .onReceive(NotificationCenter.default
                                         .publisher(for: UIApplication.didBecomeActiveNotification)) { notification in
                print(notification.name)
            }
            .onReceive(NotificationCenter.default
                                         .publisher(for: UIApplication.willResignActiveNotification)) { notification in
                print(notification.name)
            }
            .onReceive(NotificationCenter.default
                                         .publisher(for: UIApplication.willEnterForegroundNotification)) { notification in
                print(notification.name)
            }
            .onReceive(NotificationCenter.default
                                         .publisher(for: UIApplication.didEnterBackgroundNotification)) { notification in
                print(notification.name)
            }
            .onReceive(NotificationCenter.default
                                         .publisher(for: UIApplication.willTerminateNotification)) { notification in
                print(notification.name)
            }
        }
        .onChange(of: scenePhase) { phase in
            print(phase)
        }
    }
}
