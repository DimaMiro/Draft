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
    
    let clearButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Clear", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(clearButton)
        
        clearButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        clearButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        clearButton.widthAnchor.constraint(equalToConstant: 64).isActive = true
        clearButton.heightAnchor.constraint(equalToConstant: 44).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setStrokeColor(UIColor.red.cgColor)
        context.setLineWidth(8)
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
}
