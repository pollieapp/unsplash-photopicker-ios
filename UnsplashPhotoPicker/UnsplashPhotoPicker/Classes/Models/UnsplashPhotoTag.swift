//
//  UnsplashPhotoTag.swift
//  Unsplash
//
//  Created by Jetse Koopmans on 16/10/2020.
//  Copyright © 2020 Pollie. All rights reserved.
//

import Foundation

/// A struct representing tags of a photo from the Unsplash API.
public struct UnsplashPhotoTag: Codable {
    public let title: String

    private enum CodingKeys: String, CodingKey {
        case title
    }
}
