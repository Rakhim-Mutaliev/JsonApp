//
//  ContentView.swift
//  Shared
//
//  Created by Rakhim  on 01.01.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var items: [ConfigurationModel] = loadConfiguration()
    @AppStorage("devValue") var devValue: String = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.key) { item in
                    VStack(spacing: 5.0) {
                        VStack {
                            Text("Ключ:")
                                .fontWeight(.semibold)
                            Text("\(item.key)")
                                .lineLimit(nil)
                                .font(Font.system(size: 16, weight: .bold, design: .serif))
                        }
                        VStack {
                            Text("DevValue:")
                                .fontWeight(.semibold)
                            //                                TextField("\(user.devValue)", text: Binding(
                            //                                    get: { user.devValue },
                            //                                    set: { value in
                            //                                        items[index].devValue = value
                            //                                        UserDefaults.standard.set(value, forKey: "devValue")
                            //                                        print(user.devValue)
                            //                                    }
                            //                                ))
                            TextField(devValue, text: $devValue)
                                .lineLimit(nil)
                                .font(Font.system(size: 16, weight: .bold, design: .monospaced))
                        }
                        VStack {
                            Text("ProdValue:")
                                .fontWeight(.semibold)
                            Text("\(item.prodValue ?? "")")
                                .lineLimit(nil)
                                .font(Font.system(size: 16, weight: .bold, design: .serif))
                        }
                        VStack {
                            Text("Теги:")
                                .fontWeight(.semibold)
                            Text("\(item.tags ?? "")")
                                .lineLimit(nil)
                                .font(Font.system(size: 16, weight: .bold, design: .serif))
                        }
                    }
                    .multilineTextAlignment(.center)
                }
            }
            .navigationTitle("Персона")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

