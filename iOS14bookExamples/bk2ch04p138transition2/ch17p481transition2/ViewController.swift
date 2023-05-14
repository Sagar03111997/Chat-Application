

import UIKit

class ViewController : UIViewController {
    
    @IBOutlet var lab : UILabel!
    
    @IBAction func doButton(_ sender: Any?) {
        self.animate()
    }
    
    func animate() {
        let lab2 = UILabel(frame:self.lab.frame)
        lab2.text = self.lab.text == "Hello" ? "Howdy" : "Hello"
        lab2.sizeToFit()
        let opts : UIView.AnimationOptions = .transitionFlipFromLeft
        // try .transitionCrossDissolve
        UIView.transition(from:self.lab, to: lab2, duration: 0.8, options: opts) { _ in
            self.lab = lab2
        }
    }
    
}
