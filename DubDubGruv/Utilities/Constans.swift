//
//  Constans.swift
//  DubDubGruv
//
//  Created by Alex Kolsa on 13.01.2022.
//

import UIKit

enum RecordType {
    static let location = "DDGLocation"
    static let profile = "DDGProfile"
}

enum PlaceholderImage {
    static let avatar = UIImage(named: "default-avatar")!
    static let square = UIImage(named: "default-square-asset")!
    static let banner = UIImage(named: "default-banner-asset")!
}

enum ImageDimension {
    case square, banner
    
    static func getPlaceholder(for dimension: ImageDimension) -> UIImage {
        switch dimension {
        case .square:
            return PlaceholderImage.square
        case .banner:
            return PlaceholderImage.banner
        }
    }
}
