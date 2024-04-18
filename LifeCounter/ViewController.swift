//
//  ViewController.swift
//  LifeCounter
//
//  Created by Jasper Wang on 4/17/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label2view: UIView!
    @IBOutlet weak var p2life: UILabel!
    
    @IBAction func p2minus5(_ sender: UIButton) {
        if let text = p2life.text, let value = Int(text) {
            p2life.text = String(value-5)
        }
        if Int(p2life.text!)! <= 0 {
            msglabel.text = "Player 2 LOSES!"
            msglabel.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.msglabel.isHidden = true
            }
            p1life.text = "20"
            p2life.text = "20"
        }
    }
    
    @IBAction func p2minus1(_ sender: UIButton) {
        if let text = p2life.text, let value = Int(text) {
            p2life.text = String(value-1)
        }
        if Int(p2life.text!)! <= 0 {
            msglabel.text = "Player 2 LOSES!"
            msglabel.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.msglabel.isHidden = true
            }
            p1life.text = "20"
            p2life.text = "20"
        }
    }
    
    @IBAction func p2plus1(_ sender: Any) {
        if let text = p2life.text, let value = Int(text) {
            p2life.text = String(value+1)
        }
    }
    
    @IBAction func p2plus5(_ sender: UIButton) {
        if let text = p2life.text, let value = Int(text) {
            p2life.text = String(value+5)
        }
    }
    
    @IBOutlet weak var p1life: UILabel!
    
    
    @IBAction func p1minus5(_ sender: UIButton) {
        if let text = p1life.text, let value = Int(text) {
            p1life.text = String(value-5)
        }
        if Int(p1life.text!)! <= 0 {
            msglabel.text = "Player 1 LOSES!"
            msglabel.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.msglabel.isHidden = true
            }
            p1life.text = "20"
            p2life.text = "20"
        }
    }
    
    @IBAction func p1minus1(_ sender: Any) {
        if let text = p1life.text, let value = Int(text) {
            p1life.text = String(value-1)
        }
        if Int(p1life.text!)! <= 0 {
            msglabel.text = "Player 1 LOSES!"
            msglabel.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.msglabel.isHidden = true
            }
            p1life.text = "20"
            p2life.text = "20"
        }
    }
    
    @IBAction func p1plus1(_ sender: UIButton) {
        if let text = p1life.text, let value = Int(text) {
            p1life.text = String(value+1)
        }
    }
    
    @IBAction func p1plus5(_ sender: UIButton) {
        if let text = p1life.text, let value = Int(text) {
            p1life.text = String(value+5)
        }
    }
    
    @IBOutlet weak var msglabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label2view.transform = CGAffineTransformMakeRotation(3.14)
        msglabel.isHidden = true
                
        // Do any additional setup after loading the view.
    }
    
    @objc func hideMessageLabel() {
        msglabel.isHidden = false
    }

    
    
}

