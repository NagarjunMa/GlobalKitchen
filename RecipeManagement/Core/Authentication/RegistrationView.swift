//
//  RegistrationView.swift
//  RecipeManagement
//
//  Created by Nagarjun Mallesh on 10/04/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var fullname = ""
    @State private var password = ""
    @State private var email = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            // image
            Image("recipe-logo")
                .resizable()
                .scaledToFill()
                .frame(width: 160, height: 180)
                .padding(.vertical, 32)
            
            VStack(spacing: 24) {
                InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                InputView(text: $fullname, title: "Full Name", placeholder: "test name")
                    .autocapitalization(.none)
                InputView(text: $password, title: "Password", placeholder: "Enter your password",
                          isSecureField: true)
                ZStack(alignment: .trailing) {
                    InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your password",
                              isSecureField: true)
                    if !password.isEmpty && !confirmPassword.isEmpty {
                        if password == confirmPassword {
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemGreen))
                        } else {
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemRed))
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            Button {
                Task {
                    do {
                        try await viewModel.createUser(withEmail: email, password: password, fullname: fullname)
                    } catch {
                        // Handle user creation error
                        print("User creation error: \(error.localizedDescription)")
                    }
                }
            } label: {
                HStack {
                    Text("Sign Up")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(Color(.systemBlue))
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.5)
            .cornerRadius(10)
            .padding(.top, 24)
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            }
        }
    }
    
    var formIsValid: Bool {
        !email.isEmpty && email.contains("@") && !password.isEmpty && password.count > 5 && confirmPassword == password && !fullname.isEmpty
    }
}



#Preview {
    RegistrationView()
}
