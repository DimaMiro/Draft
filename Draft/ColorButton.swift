//
//  ColorButton.swift
//  Draft
//
//  Created by Dima Miro on 06/01/2019.
//  Copyright © 2019 Dima Miro. All rights reserved.
//

import UIKit

enum Colors {
    case Red
    case Blue
    case Green
    case Yellow
    case Black
}

class ColorButton: UIButton {

    var colorOfButton: Colors?
    
    init(color: Colors?) {
        self.colorOfButton = color
        super.init(frame: .zero)
        self.layer.borderColor = UIColor.CustomColor.lightGrey.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 22
        checkForColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate func checkForColor() {
        switch colorOfButton {
        case .Red?:
            self.layer.backgroundColor = UIColor.CustomColor.red.cgColor
        case .Blue?:
            self.layer.backgroundColor = UIColor.CustomColor.blue.cgColor
        case .Green?:
            self.layer.backgroundColor = UIColor.CustomColor.green.cgColor
        case .Yellow?:
            self.layer.backgroundColor = UIColor.CustomColor.yellow.cgColor
        case .Black?:
            self.layer.backgroundColor = UIColor.black.cgColor
        case .none:
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    func setSelected() {
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.CustomColor.blue.cgColor
    }
    func setUnselected() {
        self.layer.borderColor = UIColor.CustomColor.lightGrey.cgColor
    }
}
