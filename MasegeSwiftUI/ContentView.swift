//
//  ContentView.swift
//  MasegeSwiftUI
//
//  Created by Ramazan Gasratov on 23.08.2023.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @State var isLoginMode = false
    @State var email = ""
    @State var paswword = ""
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack(spacing: 16) {
                    Picker(selection: $isLoginMode) {
                        Text("Login")
                            .tag(true)
                        Text("Create Account")
                            .tag(false)
                    } label: {
                        Text("Picker here")
                    }.pickerStyle(SegmentedPickerStyle())
                        .padding()

                    if !isLoginMode {
                        Button {
                            
                        } label: {
                            Image(systemName: "person.fill")
                                .font(.system(size: 64))
                                .padding()
                        }
                    }
                    
                    Group {
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        
                        SecureField("Password", text: $paswword)
                        
                    }.padding(12)
                        .background(Color.white)
                    
                    
                    Button {
                        
                    } label: {
                        HStack {
                            Spacer()
                            Text(isLoginMode ? "Login In" : "Create")
                                .foregroundColor(Color.white)
                                .padding(.vertical, 10)
                                .font(.system(size: 14, weight: .semibold))
                            Spacer()
                        }.background(Color.blue)
                    }

                }
                }.padding()
                .background(Color(.init(white: 0, alpha: 0.05)).ignoresSafeArea())
            
                .navigationTitle(isLoginMode ? "Login In" : "Create")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
