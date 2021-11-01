//
//  Index.swift
//  cloudtech_ios
//
//  Created by Olisa Obiora on 10/26/21.
//

import SwiftUI

struct Index: View {
    @State private var selection: String? = nil
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: AuthenticationView(), tag: "AuthView", selection: $selection){ EmptyView() }
                OnboardView(selection: $selection)
            }
            
        }
    }
}

struct Index_Previews: PreviewProvider {
    static var previews: some View {
        Index()
    }
}
