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
        button.setTitle("Clear", for: .normal)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    let undoButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Undo", for: .normal)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    let redoButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Redo", for: .normal)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(canvas)
        canvas.backgroundColor = .white
        canvas.frame = view.frame
        
        view.addSubview(clearButton)
        
        let stepsStackView = UIStackView(arrangedSubviews: [
            undoButton,
            redoButton
            ])
        stepsStackView.distribution = .fillEqually
        
        view.addSubview(stepsStackView)
        stepsStackView.translatesAutoresizingMaskIntoConstraints = false
        stepsStackView.topAnchor.constraint(equalTo: canvas.topAnchor, constant: 30).isActive = true
        stepsStackView.trailingAnchor.constraint(equalTo: canvas.trailingAnchor, constant: -20).isActive = true
        stepsStackView.widthAnchor.constraint(equalToConstant: 128).isActive = true
        stepsStackView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        clearButton.topAnchor.constraint(equalTo: canvas.topAnchor, constant: 30).isActive = true
        clearButton.leadingAnchor.constraint(equalTo: canvas.leadingAnchor, constant: 20).isActive = true
        clearButton.widthAnchor.constraint(equalToConstant: 64).isActive = true
        clearButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        clearButton.addTarget(canvas, action: #selector(canvas.clearCanvas), for: .touchUpInside)
        
        undoButton.addTarget(canvas, action: #selector(canvas.undo), for: .touchUpInside)
        redoButton.addTarget(canvas, action: #selector(canvas.redo), for: .touchUpInside)
    }
}

