//
//  CustomModifiers.swift
//  DubDubGruv
//
//  Created by Alex Kolsa on 20.09.2021.
//

import SwiftUI

struct ProfileNameText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 28, weight: .bold))
            .lineLimit(1)
            .minimumScaleFactor(0.75)
    }
}
