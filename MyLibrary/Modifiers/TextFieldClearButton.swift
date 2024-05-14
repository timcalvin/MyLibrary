//
//  TextFieldClearButton.swift
//  MyLibrary
//
//  Created by Tim Bryant on 5/13/24.
//
//  Source: https://www.youtube.com/watch?v=-Gc-i8VE9lc

import SwiftUI

struct TextFieldClearButton: ViewModifier {
    @Binding var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            content
            
            if !text.isEmpty {
                Button {
                    text = ""
                } label: {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundStyle(.gray)
                }
                .offset(x: 25)
            }
        }
    }
}

extension View {
    func clearButton(text: Binding<String>) -> some View {
        modifier(TextFieldClearButton(text: text))
            .padding(.leading, 12)
            .padding(.trailing, 30)
            .padding(.vertical, 12)
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 1)
                    .foregroundStyle(.gray)
            }
    }
}
