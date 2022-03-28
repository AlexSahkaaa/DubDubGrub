//
//  AlertItem.swift
//  DubDubGruv
//
//  Created by Alex Kolsa on 13.01.2022.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    //MARK: - MapView Errors
    static let unableToGetLocations = AlertItem(title: Text("Locations error"),
                                                message: Text("Unable to retrieve locations at this time.\nPlease try again."),
                                                dismissButton: .default(Text("Ok")))
    static let locationRestricted   = AlertItem(title: Text("Locations Restricted"),
                                                message: Text("You location is restricted. This may be due to parental control."),
                                                dismissButton: .default(Text("Ok")))
    static let locationDenied       = AlertItem(title: Text("Locations Denied"),
                                                message: Text("Dub Dub Grub does not have permission to access your location. To change that go your phone's Settings > Dub Dub Grub > Location"),
                                                dismissButton: .default(Text("Ok")))
    static let locationDisabled     = AlertItem(title: Text("Locations Service Disabled"),
                                                message: Text("Your phone's location services are disabled. To change that go your phone's Settings > Privacy > Location Services"),
                                                dismissButton: .default(Text("Ok")))
    //MARK: - Profile View Errors
    static let invalidProfile       = AlertItem(title: Text("Invalid Profile"),
                                                message: Text("All fields are required as well as a profile photo. Your bio must be < 100 characters.\nPlease try again."),
                                                dismissButton: .default(Text("Ok")))
    static let noUserRecord         = AlertItem(title: Text("No User Record"),
                                                message: Text("You must log into iCloud on your phone in order to utilize Dub Dub Grub's Profile. Please log in on your phone's settings screen."),
                                                dismissButton: .default(Text("Ok")))
    static let createProfileSuccess = AlertItem(title: Text("Profile Created Successfully."),
                                                message: Text("Your profile has successufully been created."),
                                                dismissButton: .default(Text("Ok")))
    static let createProfileFailure = AlertItem(title: Text("Failed to create profile"),
                                                message: Text("We were unable to create your profile at this time.\n Please try again later contact customer support if this persits."),
                                                dismissButton: .default(Text("Ok")))
    static let unableToGetProfile   = AlertItem(title: Text("Unable To Retrieve Profile"),
                                                message: Text("We were unable to create your profile at this time. Please check your internet connection and try again later or contact customer support if this persist."),
                                                dismissButton: .default(Text("Ok")))
}
