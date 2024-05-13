//
//  CircularProfileAsyncCachedImageView.swift
//  MyLibrary
//
//  Created by Tim Bryant on 5/13/24.
//

import SwiftUI

/// Takes a URL in the form of an optional string and a size parameter, and displays
/// a circulr cropped image in one of six sizes. If the string is nil, a placeholder
/// will be provided using the SFSymbols library.
struct CircularProfileAsyncCachedImageView: View {
    let url: String?
    let size: ProfileImageSize
    
    var body: some View {
        if let url {
            ImageView(url: url)
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
