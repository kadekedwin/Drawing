//
//  PixelArtCanvas.swift
//  Drawing
//
//  Created by Kadek Edwin on 12/11/23.
//

import SwiftUI

struct PixelArtCanvas: View {
    @State private var pixels: [[Color]] = Array(repeating: Array(repeating: .yellow, count: 16), count: 16)

    var body: some View {
        VStack {
            // Pixel Art Canvas
            VStack(spacing: 0) {
                ForEach(0...15, id: \.self) { row in
                    HStack(spacing: 0) {
                        ForEach(0...15, id: \.self) { col in
                            Rectangle()
                                .fill(pixels[row][col])
                                .frame(width: 20, height: 20)
                                .onTapGesture { location in
                                    pixels[row][col] = .black
                                }
                                .gesture(
                                    DragGesture()
                                        .onChanged { value in
//                                            let x = value.location.x < 0 ? Int(value.location.x / 20) - 1 : Int(value.location.x / 20)
//                                            let y = value.location.y < 0 ? Int(value.location.y / 20) - 1 : Int(value.location.y / 20)
                                            
                                            let x = Int(value.location.x / 20)
                                            let y = Int(value.location.y / 20)
                                            
                                            print(x)
                                            print(y)
                                            
                                            if(row + y <= 15 && col + x <= 15 && row + y >= 0 && col + x >= 0) {
                                                pixels[row + y][col + x] = .black
                                            }
                                        }
                                )
                        }
                    }
                }
            }

            // Clear Button
            Button("Clear") {
                pixels = Array(repeating: Array(repeating: .yellow, count: 16), count: 16)
            }
            .padding()
        }
    }
}

struct PixelArtCanvas_Previews: PreviewProvider {
    static var previews: some View {
        PixelArtCanvas()
    }
}
