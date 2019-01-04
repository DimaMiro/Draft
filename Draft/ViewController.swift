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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(canvas)
        canvas.backgroundColor = .white
        canvas.frame = view.frame
        
        
        
        
        
    }


}

