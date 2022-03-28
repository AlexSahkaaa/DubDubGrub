//
//  ProfileView.swift
//  DubDubGruv
//
//  Created by Alex Kolsa on 07.09.2021.
//

import SwiftUI
import CloudKit

struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 16) {
                HStack {
                    ZStack {
                        AvatarView(image: viewModel.avatar, size: 80)
                        EditImage()
                    }
                    .onTapGesture { viewModel.isShowingPhotoPicker = true }
                    
                    VStack(alignment: .leading, spacing: 1) {
                        TextField("First Name", text: $viewModel.firstName).profileNameStyle()
                        TextField("Last Name", text: $viewModel.lastName).profileNameStyle()
                        TextField("Company Name", text: $viewModel.companyName)
                    }
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(15)
                
                VStack(spacing: 12) {
                    HStack {
                        CharactersRemainView(currentCount: viewModel.bio.count)
                        Spacer()
                        HStack {
                            Image(systemName: "mappin.and.ellipse")
                            Text("Check Out")
                                .font(.system(size: 14, weight: .bold))
                        }
                        .padding(6)
                        .background(Color.red)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    }
                    TextEditor(text: $viewModel.bio)
                        .frame(height: 100)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.secondary, lineWidth: 1))
                }
                
                Spacer()
                
                Button(action: {
                    viewModel.createProfile()
                }, label: {
                    DDGButton(title: "Create Profile")
                })
                .padding(.bottom)
            }
            
            if viewModel.isLoading { LoadingView()  }
            
        }
        .padding(.horizontal)
        .navigationTitle("Profile")
        .toolbar {
            Button {
                dismissKeyboard()
            } label: {
                Image(systemName: "keyboard.chevron.compact.down")
            }

        }
        .onAppear(perform: {
            viewModel.getProfile()
        })
        .alert(item: $viewModel.alertItem, content: { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        })
        .sheet(isPresented: $viewModel.isShowingPhotoPicker) {
            PhotoPicker(image: $viewModel.avatar)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView()
        }
    }
}

struct EditImage: View {
    var body: some View {
        Image(systemName: "square.and.pencil")
            .font(.system(size: 14))
            .foregroundColor(.white)
            .offset(y: 30)
    }
}

struct CharactersRemainView: View {
    
    var currentCount: Int
    
    var body: some View {
        Text("Bio: ")
            .font(.callout)
            .foregroundColor(.secondary)
        +
            Text("\(100 - currentCount)")
            .bold()
            .font(.callout)
            .foregroundColor(currentCount <= 100 ? .brandPrimary : Color(.systemPink))
        +
        Text(" Characters remain")
            .font(.callout)
            .foregroundColor(.secondary)
    }
}
