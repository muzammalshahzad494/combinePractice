//
//  SignUpView.swift
//  CombinePracticeModule
//
//  Created by Muzammal Shahzad on 6/17/23.
//

import SwiftUI



struct SignupView: View {
    
    @ObservedObject private var viewModel : SignupViewModel
    @State private var showErrorAlert = false
    @State private var showHomeView = false
    
    init(viewModel: SignupViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                Text("Sign Up")
                    .font(.largeTitle)
                    .padding()
                
                TextField("Username", text: $viewModel.username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Confirm Password", text: $viewModel.confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    
                    if viewModel.validateFields() {
                        viewModel.signup()
                        showHomeView = true
                    } else {
                        showErrorAlert = true
                    }
                    
                }) {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                .alert(isPresented: $showErrorAlert) {
                    Alert(title: Text("Error"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("OK")))
                }
            }
            
            .navigationBarTitle("Sign Up")
            .background(
                NavigationLink(destination: HomeView(), isActive: $showHomeView) {
                    EmptyView()
                }
                    .hidden()
            )
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(viewModel: SignupViewModel())
    }
}

