//
//  ViewController.swift
//  UIResponderHitTest
//
//  Created by Mayur Kothawade on 21/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redButton: RedButton!
    @IBOutlet weak var redView: RedView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redButton.tag = 4456
    }

    @IBAction func redButtonTapped(_ sender: Any) {
        print("Red Button tapped")
        let vc = UIAlertController(title: "Congratulations!", message: "RedButton tapped", preferredStyle: .alert)
        vc.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            vc.dismiss(animated: true, completion: nil)
        }))
        self.present(vc, animated: true, completion: nil)
    }
}

class RedView: UIView {
    
    open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        if let redButton = self.superview?.viewWithTag(4456) {
            let convertedPoint = redButton.convert(point, from: self)
            if redButton.point(inside: convertedPoint, with: event) {
                return redButton
            }
        }
        
        return super.hitTest(point, with: event)
    }
    
}


class RedButton: UIButton {
}
