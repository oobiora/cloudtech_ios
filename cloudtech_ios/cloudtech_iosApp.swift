//
//  cloudtech_iosApp.swift
//  cloudtech_ios
//
//  Created by Olisa Obiora on 10/16/21.
//

import SwiftUI

@main
struct cloudtech_iosApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            OnboardView()
        }
    }
}
