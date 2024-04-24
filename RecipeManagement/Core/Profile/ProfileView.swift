//
//  ProfileView.swift
//  RecipeManagement
//
//  Created by Nagarjun Mallesh on 10/04/24.
//

import SwiftUI

//struct ProfileView: View {
//    @EnvironmentObject var viewModel: AuthViewModel
//    var body: some View {
//        if let user = viewModel.currentUser {
//            List {
//                Section {
//                    HStack {
//                        Text(user.initials)
//                            .font(.title)
//                            .fontWeight(.semibold)
//                            .foregroundColor(.white)
//                            .frame(width:72, height: 72)
//                            .background(Color(.systemGray3))
//                            .clipShape(Circle())
//                        
//                        VStack(alignment: .leading, spacing: 4) {
//                            Text(user.fullName)
//                                .fontWeight(.semibold)
//                                .padding(.top,4)
//                            
//                            Text(user.email)
//                                .font(.subheadline)
//                                .foregroundColor(.gray)
//                        }
//                    }
//                    
//                }
//                
//                Section("General") {
//                    HStack {
//                        SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
//                        Spacer()
//                        
//                        Text("1.0.0")
//                            .font(.subheadline)
//                            .foregroundColor(.gray)
//                    }
//
//                    
//                }
//                Section("Account") {
//                    Button{
//                        viewModel.signOut()
//                    } label : {
//                        SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign out", tintColor: Color(.systemRed))
//                    }
//                    
//                    
//                    Button{
//                        print("Delete Account..")
//                    } label : {
//                        SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: Color(.systemRed))
//                    }
//                }
//            }
//        }
//    }
//}

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            if let user = viewModel.user {
                List {
                    Section {
                        HStack {
                            Text(user.initials)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: 72, height: 72)
                                .background(Color(.systemGray3))
                                .clipShape(Circle())
                            VStack(alignment: .leading, spacing: 4) {
                                Text(user.fullName)
                                    .fontWeight(.semibold)
                                    .padding(.top, 4)
                                Text(user.email)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    Section("General") {
                        HStack {
                            SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                            Spacer()
                            Text("1.0.0")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    Section("Account") {
                        Button {
                            do {
                                   try viewModel.signOut()
                                   dismiss()
                                } catch {
                                   print("Failed to sign out: \(error)")
                                }
                        } label: {
                            SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign out", tintColor: Color(.systemRed))
                        }
                        Button {
                            print("Delete Account..")
                        } label: {
                            SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: Color(.systemRed))
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .navigationBarTitle("Profile")
                .navigationBarItems(trailing: Button(action: {
                    dismiss()
                }) {
                    Text("Done")
                })
            }
        }
    }
}



#Preview {
    ProfileView()
}
