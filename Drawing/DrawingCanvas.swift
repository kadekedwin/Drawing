//
//  DrawingCanvas.swift
//  Drawing
//
//  Created by Kadek Edwin on 12/11/23.
//

import SwiftUI

struct DrawingCanvas: View {
    @State private var drawings: [Drawing] = []
    @State private var currentDrawing: Drawing = Drawing()

    var body: some View {
        VStack {
            // Drawing Canvas
            Canvas { context, size in
                // Drawings
                for drawing in drawings {
                    context.stroke(drawing.path, with: .color(drawing.color), lineWidth: drawing.lineWidth)
                }

                // Current Drawing
                context.stroke(currentDrawing.path, with: .color(currentDrawing.color), lineWidth: currentDrawing.lineWidth)
            }
            .frame(height: 600)
            .background(.red)
            .gesture(
                DragGesture(minimumDistance: 0.1)
                    .onChanged { value in
                        let point = value.location
                        currentDrawing.path.addLine(to: point)
                        currentDrawing.points.append(point)
                        print(value.location)
                    }
                    .onEnded { _ in
                        drawings.append(currentDrawing)
                        currentDrawing = Drawing()
                    }
            )
            
            // Clear Button
            Button("Clear") {
                drawings = []
            }
            .padding()
        }
    }
}

struct DrawingCanvas_Previews: PreviewProvider {
    static var previews: some View {
        DrawingCanvas()
    }
}

struct Drawing: Identifiable {
    var id = UUID()
    var path = Path()
    var points: [CGPoint] = []
    var color: Color = .black
    var lineWidth: CGFloat = 5.0
}
