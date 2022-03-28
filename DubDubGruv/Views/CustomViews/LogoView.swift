//
//  LogoView.swift
//  DubDubGruv
//
//  Created by Alex Kolsa on 15.01.2022.
//

import SwiftUI

struct LogoView: View {
    var frameWidth: CGFloat
    var body: some View {
        Image("coins")
            .resizable()
            .scaledToFit()
            .frame(width: frameWidth)
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView(frameWidth: 200)
    }
}
