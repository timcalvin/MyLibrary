//
//  CircularProfileImageView.swift
//  rememberri
//
//  Created by Timothy Bryant on 5/3/24.
//

import SwiftUI

/// Takes an optional string size parameter, and displays a circulr cropped image in
/// one of six sizes. If the string is nil, a placeholder will be provided using the
/// SFSymbols library.
struct CircularProfileImageView: View {
    let image: String?
    let size: ProfileImageSize
    
    var body: some View {
        if let image {
            Image(image)
                .scaledToFit()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
                .foregroundStyle(.gray)
        }
    }
}
