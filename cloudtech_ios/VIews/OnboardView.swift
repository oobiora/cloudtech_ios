//
//  OnboardView.swift
//  cloudtech_ios
//
//  Created by Olisa Obiora on 10/16/21.
//

import SwiftUI

struct OnboardView: View {
    @State var toggleState: Bool = false
    var body: some View {
        NavigationView {
            ZStack {
                Color("ct_primary")
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    Text("focus on you! \n not your devices")
                        .font(Font.custom("Maison Neue Mono", size: 25))
                        .foregroundColor(Color("ct_highlight"))
                        .multilineTextAlignment(.center)
                    Image("ob_logo_1")
                        .resizable()
                        .frame(width: 300, height: 300, alignment: .center)
                    Text("confidence with the support of your cloud technician")
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("ct_highlight"))
                        .font(Font.custom("Maison Neue Mono", size: 15))
                        .padding(.bottom, 8.0)
                    Spacer()
                    FullWidthToggle(toggle: $toggleState)
                        .frame(width: .infinity)
                        .padding()
                    Spacer()
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    Text("CLOUDTECHX")
                        .tracking(8.0)
                        .font(Font.custom("MaisonNeue-Medium", size: 10))
                        .foregroundColor(Color("ct_highlight"))
                }
            })
        }
    }
}


//MARK: Components

//MARK: Button


//MARK: Onboarding Button
struct OnboardingButton: View {
    var body: some View {
        Button (action: {}) {
            HStack {
                Text("get started")
                    .font(Font.custom("Maison Neue Mono", size: 10))
                    .foregroundColor(Color("ct_primary"))
                Image(systemName: "arrow.forward")
                    .foregroundColor(Color("ct_primary"))
            }
        }
        .padding(.vertical, 7.0)
        .padding(.horizontal, 10.0)
        .foregroundColor(Color("ct_highlight"))
        .background(Color("ct_accent_yellow"))
        .cornerRadius(10.0)
    }
}

struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView()
    }
}

//MARK: Full Width Toggle Button
struct FullWidthToggle: View {
    @Binding var toggle: Bool
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("ct_accent_primary"))
                        .cornerRadius(28.0)
                    Rectangle()
                        .foregroundColor(Color("ct_highlight"))
                        .cornerRadius(28.0)
                        .offset(x: self.toggle ? geometry.size.width/4: -geometry.size.width/4)
                        .frame(width: geometry.size.width/2)
                        .animation(Animation.easeInOut(duration: 0.15))
                        
                }
                .frame(width: geometry.size.width)
                
                HStack(alignment: .center) {
                    Button(action: {
                        toggle.toggle()
                    }){
                        Text("sign in")
                            .padding()
                            .foregroundColor(self.toggle ? Color("ct_highlight") : Color("ct_primary"))
                            .frame(width: geometry.size.width/2, alignment: .center)
                    }
                    
                    
                    Button(action: {
                        toggle.toggle()
                    }){
                        Text("register")
                            .padding()
                            .foregroundColor(self.toggle ? Color("ct_primary") : Color("ct_highlight"))
                            .frame(width: geometry.size.width/2, alignment: .center)
                    }
                }
                .frame(width: geometry.size.width)
            }
        }
        .frame(maxHeight: 30.0)
    }
}

//struct Designer: View {
//    @State var toggleState: Bool = false
//    var body: some View {
//        ZStack {
//            Color("ct_primary")
//                .edgesIgnoringSafeArea(.all)
//            VStack {
//                FullWidthToggle(toggle: $toggleState)
//                    .frame(width: .infinity)
//            }
//        }
//    }
//}
//
//struct Designer_Preview: PreviewProvider {
//    static var previews: some View {
//        Designer()
//    }
//}

