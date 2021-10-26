//
//  ManageDeviceView.swift
//  cloudtech_ios
//
//  Created by Olisa Obiora on 10/16/21.
//

import SwiftUI

struct ManageDeviceView: View {
    
    init(){
        UIToolbar.appearance().barTintColor = UIColor(Color("ct_secondary"))
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("ct_secondary")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Header()
                    DeviceScroll()
                    RegisterButton()
                    Spacer()
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Hi, Sullivan")
                        .font(Font.custom("Maison Neue Mono", size: 15.0))
                        .foregroundColor(Color("ct_primary"))
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                        Image(systemName: "line.3.horizontal.decrease")
                            .foregroundColor(Color("ct_primary"))
                     
                }
                ToolbarItem(placement: .bottomBar){
                    HStack(spacing: 38.0){
                            Image(systemName: "calendar")
                            .padding()
                            Image(systemName: "plus.square.on.square")
                            .padding()
                            Image(systemName: "apps.iphone")
                            .padding()
                            Image(systemName: "gearshape")
                            .padding()
                        }
                    .font(Font.system(size: 25))
                    .foregroundColor(Color("ct_primary"))
                }
            })
        }
    }
}

//MARK: Header
struct Header: View {
    var body: some View {
        HStack {
            Text("Manage your \nregistered \ndevices")
                .foregroundColor(Color("ct_primary"))
                .font(Font.custom("MaisonNeue-Bold", size: 20))
                .tracking(2.3)
                .lineSpacing(6.4)
            Spacer()
            Button(action: {}) {
                Text("")
                ZStack {
                    Text("")
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color("ct_highlight"))
                }
                .padding(.vertical, 50)
                .padding(.horizontal, 30)
                .background(Color("ct_primary"))
                .cornerRadius(30, corners: [.topLeft, .bottomRight])
                .cornerRadius(15, corners: [.topRight, .bottomLeft])

                
            }
        }.padding(.horizontal, 30)
    }
}

//MARK: Device Browse

struct DeviceScroll: View  {
    var body: some View {
        ScrollView (.horizontal) {
            HStack {
                Device()
                Device()
                Device()
            }
        }
    }
}

struct Device: View {
    var body: some View {
        ZStack {
            VStack (alignment: .leading) {
                Image("iphone11_front_green")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 210)
                    .padding(.bottom, 30)
                    .shadow(color: .gray, radius: 10.0, x: 4, y: 4)
                
                Text("Sullivans Iphone X")
                    .font(Font.custom("Maison Neue Mono", size: 14))
                    .foregroundColor(Color("ct_primary"))
                HStack {
                    Image(systemName: "checkmark.seal")
                        .font(Font.system(size: 13))
                        .foregroundColor(Color("ct_accent_green"))
                    Text("register Aug 28")
                        .font(Font.custom("Maison Neue Mono", size: 10))
                        .foregroundColor(Color("ct_primary"))
                    
                }
            }
            .padding(.vertical, 50)
            .padding(.horizontal, 20)
            .background(Color("ct_highlight"))
        .cornerRadius(20.0)
        }
        .padding()
        .shadow(color: Color(hue: 1.0, saturation: 0.0, brightness: 0.822), radius: 7, x: 1.5, y: 1)
    }
}

//MARK: Register Button

struct RegisterButton: View {
    var body: some View {
        HStack{
            Spacer()
            Text("register new device")
                .font(Font.custom("Maison Neue Mono", size: 10))
                .foregroundColor(Color("ct_primary"))
            Button (action: {}) {
                Image(systemName: "arrow.forward")
                    .foregroundColor(Color("ct_highlight"))
            }
            .padding()
            .background(Color("ct_primary"))
            .cornerRadius(100.0)
            
        }
        .padding(.horizontal)
        .padding(.bottom, 20.0)
    }
}

struct ManageDeviceView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ManageDeviceView()
                .previewLayout(.device)
                
                
        }
    }
}
