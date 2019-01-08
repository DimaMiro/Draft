//
//  ViewController.swift
//  Draft
//
//  Created by Dima Miro on 04/01/2019.
//  Copyright © 2019 Dima Miro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let canvas = Canvas()
    
    let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Clear All", for: .normal)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    let undoButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "undo-icon"), for: .normal)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    let redoButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "redo-icon"), for: .normal)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    let redColorButton = ColorButton(color: .Red)
    let blueColorButton = ColorButton(color: .Blue)
    let greenColorButton = ColorButton(color: .Green)
    let yellowColorButton = ColorButton(color: .Yellow)
    let blackColorButton = ColorButton(color: .Black)
    
    var selectedColorButton: ColorButton?
    
    let strokeWidthButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Stroke:", for: .normal)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    let slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 10
        return slider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupActions()
        strokeWidthButton.setTitle("Line width: \(Int(canvas.strokeWidth)) pt", for: .normal)
        
        selectedColorButton = blackColorButton
        selectedColorButton?.setSelected()
    }
    
    fileprivate func setupLayout() {
        view.addSubview(canvas)
        canvas.frame = view.frame
        if let image = UIImage(named: "backgroundImage") {
            canvas.backgroundColor = UIColor(patternImage: image)
        }
        canvas.addSubview(clearButton)
        clearButton.topAnchor.constraint(equalTo: canvas.topAnchor, constant: 30).isActive = true
        clearButton.leadingAnchor.constraint(equalTo: canvas.leadingAnchor, constant: 20).isActive = true
        clearButton.widthAnchor.constraint(equalToConstant: 64).isActive = true
        clearButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        let stepsStackView = UIStackView(arrangedSubviews: [
            undoButton,
            redoButton
            ])
        stepsStackView.distribution = .fillEqually
        stepsStackView.spacing = 12
        canvas.addSubview(stepsStackView)
        stepsStackView.translatesAutoresizingMaskIntoConstraints = false
        stepsStackView.topAnchor.constraint(equalTo: canvas.topAnchor, constant: 30).isActive = true
        stepsStackView.trailingAnchor.constraint(equalTo: canvas.trailingAnchor, constant: -20).isActive = true
        stepsStackView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        
        let colorsStackView = UIStackView(arrangedSubviews: [
            blackColorButton,
            redColorButton,
            blueColorButton,
            greenColorButton,
            yellowColorButton
            ])
        colorsStackView.distribution = .equalCentering
        
        canvas.addSubview(colorsStackView)
        colorsStackView.translatesAutoresizingMaskIntoConstraints = false
        colorsStackView.leadingAnchor.constraint(equalTo: canvas.leadingAnchor, constant: 20).isActive = true
        colorsStackView.bottomAnchor.constraint(equalTo: canvas.bottomAnchor, constant: -20).isActive = true
        colorsStackView.widthAnchor.constraint(equalToConstant: 280).isActive = true
        
        blackColorButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        blackColorButton.heightAnchor.constraint(equalToConstant: 44).isActive = true

        redColorButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        redColorButton.heightAnchor.constraint(equalToConstant: 44).isActive = true

        blueColorButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        blueColorButton.heightAnchor.constraint(equalToConstant: 44).isActive = true

        greenColorButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        greenColorButton.heightAnchor.constraint(equalToConstant: 44).isActive = true

        yellowColorButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        yellowColorButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        canvas.addSubview(strokeWidthButton)
        strokeWidthButton.trailingAnchor.constraint(equalTo: canvas.trailingAnchor, constant: -20).isActive = true
        strokeWidthButton.bottomAnchor.constraint(equalTo: canvas.bottomAnchor, constant: -20).isActive = true
    }
    
    fileprivate func setupActions() {
        clearButton.addTarget(canvas, action: #selector(canvas.clearCanvas), for: .touchUpInside)
        
        undoButton.addTarget(canvas, action: #selector(canvas.undo), for: .touchUpInside)
        redoButton.addTarget(canvas, action: #selector(canvas.redo), for: .touchUpInside)
        
        redColorButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        blueColorButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        greenColorButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        yellowColorButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        blackColorButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
    }
    
    @objc func changeColor(sender: ColorButton) {
        canvas.changeColor(sender: sender)
        colorButtonTapped(sender: sender)
    }
    
    func colorButtonTapped(sender: ColorButton) {
        guard selectedColorButton != sender else { return }
        sender.setSelected()
        selectedColorButton?.setUnselected()
        selectedColorButton = sender
    }
}

