//
//  Canvas.swift
//  Draft
//
//  Created by Dima Miro on 04/01/2019.
//  Copyright © 2019 Dima Miro. All rights reserved.
//

import UIKit

class Canvas: UIView {
    
    var lines = [Line]()
    var removedLines = [Line]()
    
    var strokeColor: CGColor = UIColor.black.cgColor
    var strokeWidth: CGFloat = 1
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setLineCap(.round)
        
        lines.forEach { (line) in
            context.setStrokeColor(line.color)
            context.setLineWidth(line.strokeWidth)
            for (i, p) in line.points.enumerated() {
                if i == 0 {
                    context.move(to: p)
                } else {
                    context.addLine(to: p)
                }
            }
            context.strokePath()
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append(Line.init(strokeWidth: strokeWidth, color: strokeColor, points: [] ))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else { return }
        guard var lastLine = lines.popLast() else { return }
        lastLine.points.append(point)
        
        lines.append(lastLine)
        
        setNeedsDisplay() // Redraw UIView if needed
    }
    
    @objc func changeColor(sender: ColorButton) {
        switch sender.colorOfButton {
        case .Red?:
            self.strokeColor = UIColor.CustomColor.red.cgColor
        case .Blue?:
            self.strokeColor = UIColor.CustomColor.blue.cgColor
        case .Green?:
            self.strokeColor = UIColor.CustomColor.green.cgColor
        case .Yellow?:
            self.strokeColor = UIColor.CustomColor.yellow.cgColor
        case .Black?:
            self.strokeColor = UIColor.black.cgColor
        case .none:
            self.strokeColor = UIColor.black.cgColor
        }
    }
    
    func setStrokeWidth(width: CGFloat) {
        strokeWidth = width
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
