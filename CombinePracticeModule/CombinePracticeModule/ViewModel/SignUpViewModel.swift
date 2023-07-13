//
//  SignUpViewModel.swift
//  CombinePracticeModule
//
//  Created by Muzammal Shahzad on 6/17/23.
//

import SwiftUI
import Combine

class SignupViewModel: ObservableObject{
    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var errorMessage = ""
    
    @Published var isUsernameValid: Bool = true
    @Published var isPasswordValid: Bool = true
    @Published var isConfirmPasswordValid: Bool = true
    
    private var cancellables: Set<AnyCancellable> = []
    
    var isFormValid: Bool {
        return isUsernameValid && isPasswordValid && isConfirmPasswordValid
    }
    
    init() {
        setupValidation()
    }
    
    private func setupValidation(){
        
        $username
            .map { username in
                return username.count >= 6
            }
            .assign(to: \.isUsernameValid, on: self)
            .store(in: &cancellables)
        
        
        $password
            .map { password in
                return password.count >= 8
            }
            .assign(to: \.isPasswordValid, on: self)
            .store(in: &cancellables)
        
        
        $confirmPassword
        
            .map { confirmPassword in
                return confirmPassword.count >= 8
            }
            .assign(to: \.isConfirmPasswordValid, on: self)
            .store(in: &cancellables)
        
        Publishers.CombineLatest($password, $confirmPassword)
        
            .map { password, confirmPassword in
                return password == confirmPassword && password.isEmpty
            }
            .assign(to: \.isConfirmPasswordValid, on: self)
            .store(in: &cancellables)
        
    }
    
    func signup() {
        if isFormValid {
            print("Signup successful")
        } else {
            print("Signup failed. Invalid input.")
        }
    }
    
    func validateFields() -> Bool {
        
        var isValid = true
        
        // Validate username
//        if username.isEmpty {
//            errorMessage = "Please enter a username."
//            isValid = false
//        }
//        
//        // Validate password
//        if password.isEmpty {
//            errorMessage = "Please enter a password."
//            isValid = false
//        } else if password.count < 6 {
//            errorMessage = "Password should be at least 6 characters long."
//            isValid = false
//        }
        
        return isValid
        
    }
    
    
}



