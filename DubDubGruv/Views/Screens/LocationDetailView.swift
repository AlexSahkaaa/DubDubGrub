//
//  LocationDetailView.swift
//  DubDubGruv
//
//  Created by Alex Kolsa on 08.09.2021.
//

import SwiftUI

struct LocationDetailView: View {
    
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible())]
    
    var location: DDGLocation
    
    var body: some View {
        VStack(spacing: 16) {
            BannerImageView(imageName: location.createBannerImage())
            
            HStack {
                Label(location.address, systemImage: "mappin.and.ellipse")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Spacer()
            }.padding(.top, 12)
            .padding(.horizontal)
            
            DescriptionView(text: location.description)
            
            ZStack {
                Capsule()
                    .frame(height: 80)
                    .foregroundColor(Color(.secondarySystemBackground))
                
                HStack(spacing: 20) {
                    Button(action: {  }, label: {
                        LocationActionButton(color: .brandPrimary, imageName: "location.fill")
                    })
                    
                    Link(destination: URL(string: location.websiteURL)!, label: {
                        LocationActionButton(color: .brandPrimary, imageName: "network")
                    })
                    
                    Button(action: {  }, label: {
                        LocationActionButton(color: .brandPrimary, imageName: "phone.fill")
                    })
                    
                    Button(action: {  }, label: {
                        LocationActionButton(color: .brandPrimary, imageName: "person.fill.checkmark")
                    })
                }
            }
            .padding(.horizontal)
            
            Text("Who's Here?")
                .bold()
                .font(.title)
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    FirstNameAvatarView(image: PlaceholderImage.avatar, firstName: "Alex")
                    FirstNameAvatarView(image: PlaceholderImage.avatar, firstName: "Vanya")
                    FirstNameAvatarView(image: PlaceholderImage.avatar, firstName: "Oleg")
                    
                })
            }
            Spacer()
        }
        .navigationBarTitle(location.name, displayMode: .inline)
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LocationDetailView(location: DDGLocation(record: MockData.location))
        }
    }
}

struct LocationActionButton: View {
    
    var color: Color
    var imageName: String
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(color)
                .frame(width: 60, height: 60)
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 22, height: 22)
                .foregroundColor(.white)
        }
    }
}

struct FirstNameAvatarView: View {
    
    var image: UIImage
    var firstName: String
    
    var body: some View {
        VStack {
            AvatarView(image: image, size: 70)
            Text(firstName)
                .bold()
                .lineLimit(1)
                .minimumScaleFactor(0.75)
        }
    }
}

struct BannerImageView: View {
    
    var imageName: UIImage
    
    var body: some View {
        Image(uiImage: imageName)
            .resizable()
            .scaledToFill()
            .frame(height: 120)
            .padding(.top)
    }
}

struct DescriptionView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .lineLimit(3)
            .minimumScaleFactor(0.75)
            .padding(.horizontal)
            .frame(width: UIScreen.main.bounds.width , alignment: .topLeading)
    }
}
