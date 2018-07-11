//
//  ViewController.swift
//  Example
//
//  Created by Joakim Gyllström on 2018-07-08.
//  Copyright © 2018 Joakim Gyllström. All rights reserved.
//

import UIKit
import BSImageView

class ViewController: UIViewController {
    @IBOutlet var bsImageView: BSImageView!
    @IBOutlet var uiImageView: UIImageView!
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiImageView.contentMode = bsImageView.contentMode
        updateButton(contentMode: bsImageView.contentMode)
    }
    
    @IBAction func changeContentModeTapped(_ sender: UIButton) {
        let currentContentMode = bsImageView.contentMode
        let nextContentMode: UIViewContentMode
        if currentContentMode.rawValue == 12 {
            nextContentMode = UIViewContentMode(rawValue: 0)!
        } else {
            nextContentMode = UIViewContentMode(rawValue: currentContentMode.rawValue + 1)!
        }
        
        updateButton(contentMode: nextContentMode)
        button.isUserInteractionEnabled = false
        
        UIView.animate(withDuration: 0.3, animations: {
            self.bsImageView.contentMode = nextContentMode
            self.uiImageView.contentMode = nextContentMode
        }) { (completed) in
            self.button.isUserInteractionEnabled = true
        }
    }
    
    private func updateButton(contentMode: UIViewContentMode) {
        button.setTitle("Content mode: \(contentMode)", for: .normal)
    }
}

extension UIViewContentMode: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .scaleToFill:
            return "scaleToFill"
        case .scaleAspectFit:
            return "scaleAspectFit"
        case .scaleAspectFill:
            return "scaleAspectFill"
        case .redraw:
            return "redraw"
        case .center:
            return "center"
        case .top:
            return "top"
        case .bottom:
            return "bottom"
        case .left:
            return "left"
        case .right:
            return "right"
        case .topLeft:
            return "topLeft"
        case .topRight:
            return "topRight"
        case .bottomLeft:
            return "bottomLeft"
        case .bottomRight:
            return "bottomRight"
        }
    }
}
