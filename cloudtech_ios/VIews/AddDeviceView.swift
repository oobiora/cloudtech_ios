//
//  AddDeviceView.swift
//  cloudtech_ios
//
//  Created by Olisa Obiora on 10/17/21.
//

import SwiftUI

struct AddDeviceView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("ct_secondary")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    DeviceInfo()
                        .padding()
                        .background(Color("ct_highlight"))
                        .cornerRadius(14.0)
                        .shadow(color: Color(hue: 1.0, saturation: 0.0, brightness: 0.02, opacity: 0.069), radius: 10.0, x: 1.0, y: 1.2)
                        .padding(30.0)
                    RegistrationReceipt(total: 1.39)
                        .padding()
                        .background(Color("ct_highlight"))
                        .cornerRadius(14.0)
                        .shadow(color: Color(hue: 1.0, saturation: 0.0, brightness: 0.02, opacity: 0.069), radius: 10.0, x: 1.0, y: 1.2)
                        .padding(30)
                    
                    RegisterButtonLong()
                    Spacer()
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .principal){
                    Text("register device")
                        .font(Font.custom("MaisonNeue-Bold", size: 20.0))
                }
                ToolbarItem(placement: .navigation){
                    Image(systemName: "chevron.left")
                }
            })
        }
    }
}

//MARK: Register Button
struct RegisterButtonLong: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("ct_primary"))
                .cornerRadius(15.0)
            Text("register")
                .foregroundColor(Color("ct_highlight"))
                .font(Font.custom("MaisonNeue-Medium", size: 18.0))
        }
        .padding()
    }
}

//MARK: Registration Receipt Form
struct RegistrationReceipt: View {
    @State var deviceSpots: Int = 2
    @State var fee: Float = 1.39
    var total: Float
    
    
    
    var body: some View {
        VStack (spacing: 15.0){
            Text("registration confirmation")
                .padding(.vertical)
            HStack {
                Text("available device spots")
                    .font(Font.custom("Maison Neue Mono", size: 15.0))
                Spacer()
                Text("\(deviceSpots)/3")
                    .font(Font.custom("MaisonNeue-Bold", size: 13.0))
                
            }
            HStack {
                Text("additional device registration fee")
                    .font(Font.custom("Maison Neue Mono", size: 15.0))
                Spacer()
                Text(String(fee))
                    .font(Font.custom("MaisonNeue-Bold", size: 13.0))
            }
            HStack {
                Text("total")
                    .font(Font.custom("Maison Neue Mono", size: 15.0))
                Spacer()
                Text(String(fee))
                    .font(Font.custom("MaisonNeue-Bold", size: 13.0))
            }
        }
        .padding(.bottom)
    }
}

//MARK: Device Information

struct DeviceInfo: View {
    var deviceType: String = "laptop"
    @State var selection: Int = 1
    @State var cardSelect: Int = 1
    @State var deviceName: String = "My Device"
    @State var isbnCode: String = "978-3-16-148410-0"
    var options: [String] = ["smartphone", "laptop", "desktop", "tablet"]
    var cardOptions: [String] = ["visa *8623", "venmo", "visa *3028", "mastercard *8750"]
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("device information")
                .padding(.leading, 16.0)
                .font(Font.custom("MaisonNeue-Bold", size: 15.0))
            DropdownPicker(title: "device type", selection: $selection, options: options, imageStyle: "display")
            CustomTextField(symbol: "textformat.abc", title: "device name", textField: TextField("My Device", text: $deviceName))
            CustomTextField(symbol: "textformat.abc", title: "isbn number", textField: TextField("My Device", text: $isbnCode))
            DropdownPicker(title: "card information", selection: $cardSelect, options: cardOptions, imageStyle: "creditcard")
            
        }
    }
}


//MARK: Custom Text Field
struct CustomTextField: View {
    
    var symbol: String
    var title: String
    var textField: TextField<Text>
    @State private var edited: Bool = false
    
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Image(systemName: symbol)
                VStack (alignment: .leading){
                    Text(title)
                        .font(Font.custom("Maison Neue Mono", size: 15.0))
                    textField
                        .font(Font.custom("MaisonNeue-Bold", size: 14.0))
                }
                Spacer()
                Image(systemName: "square.and.pencil")
            }.padding(.horizontal, 12.0)
                .padding(.vertical, 3.0)
        }
    }
}


//MARK: Dropdown Picker
struct DropdownPicker: View {
    
    var title: String
    @Binding var selection: Int
    var options: [String]
    var imageStyle: String
    
    
    @State private var showOptions: Bool = false
    
    var body: some View {
        VStack (alignment: .leading){
            
            HStack {
                Image(systemName: imageStyle)
                    .padding(.trailing, 2.0)
                VStack (alignment: .leading) {
                    Text(title)
                        .font(Font.custom("Maison Neue Mono", size: 15.0))
                    Text(options[selection])
                        .font(Font.custom("MaisonNeue-Bold", size: 14.0))
                }
                Spacer()
                Image(systemName: "chevron.down")
            }
            .padding(.horizontal)
            .padding(.top)
            .onTapGesture {
                withAnimation(Animation.spring().speed(2)) {
                    showOptions.toggle()
                }
            }
            
            if showOptions {
                VStack (alignment: .leading) {
                    ForEach(options.indices, id: \.self) { i in
                        if i == selection {
                            Text(options[i])
                                .padding(.vertical, 3.0)
                                .padding(.leading, 10.0)
                                .font(Font.custom("MaisonNeue-Bold", size: 15.0))
                        } else {
                            Text(options[i])
                                .onTapGesture {
                                    withAnimation(Animation.spring().speed(2)) {
                                        selection = i
                                        showOptions.toggle()
                                    }
                                }
                                .padding(.vertical, 2.0)
                                .font(Font.custom("MaisonNeue-Medium", size: 14.0))
                        }
                        
                    }
                }
                .padding()
            }
            
        }
    }
}

struct AddDeviceView_Previews: PreviewProvider {
    static var previews: some View {
        AddDeviceView()
    }
}
