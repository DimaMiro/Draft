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
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Clear", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(canvas)
        canvas.backgroundColor = .white
        canvas.frame = view.frame
        
        view.addSubview(clearButton)
        
        
        clearButton.topAnchor.constraint(equalTo: canvas.topAnchor, constant: 30).isActive = true
        clearButton.leadingAnchor.constraint(equalTo: canvas.leadingAnchor, constant: 20).isActive = true
        clearButton.widthAnchor.constraint(equalToConstant: 64).isActive = true
        clearButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        clearButton.addTarget(canvas, action: #selector(canvas.clearCanvas), for: .touchUpInside)
//        clearButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(canvas.clearCanvas)))
        
    }
}

