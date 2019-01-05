//
//  Canvas.swift
//  Draft
//
//  Created by Dima Miro on 04/01/2019.
//  Copyright © 2019 Dima Miro. All rights reserved.
//

import UIKit

class Canvas: UIView {
    
    var lines = [[CGPoint]]()
    var removedLines = [[CGPoint]]()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setStrokeColor(UIColor.darkGray.cgColor)
        context.setLineWidth(3)
        context.setLineCap(.round)
        
        lines.forEach { (line) in
            for (i, p) in line.enumerated() {
                if i == 0 {
                    context.move(to: p)
                } else {
                    context.addLine(to: p)
                }
            }
        }
        
        context.strokePath()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]())
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else { return }
        guard var lastLine = lines.popLast() else { return }
        lastLine.append(point)
        
        lines.append(lastLine)
        
        setNeedsDisplay() // Redraw UIView if needed
    }
    
    @objc func clearCanvas() {
        lines.removeAll()
        setNeedsDisplay()
    }
    
    @objc func undo() {
        guard let lastLine = lines.last else { return }
        removedLines.append(lastLine)
        lines.removeLast()
        setNeedsDisplay()
    }
    @objc func redo() {
        guard let lastRemovedLine = removedLines.last else { return }
        lines.append(lastRemovedLine)
        removedLines.removeLast()
        setNeedsDisplay()
    }
}
