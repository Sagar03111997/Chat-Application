import UIKit

class MyTextContainer : NSTextContainer {
    
    // NB new in iOS 9, if we override this...
    // we should override simpleRectangularTextContainer
    
    override var isSimpleRectangularTextContainer : Bool { return false } // *
    
    override func lineFragmentRect(forProposedRect proposedRect: CGRect, at characterIndex: Int, writingDirection baseWritingDirection: NSWritingDirection, remaining remainingRect: UnsafeMutablePointer<CGRect>?) -> CGRect {
        
        var result = super.lineFragmentRect(forProposedRect:proposedRect, at:characterIndex, writingDirection:baseWritingDirection, remaining:remainingRect)
        
        /*
        let r = CGRect(0,0,self.size.width,self.size.height)
        let circle = UIBezierPath(ovalInRect:r)
        
        while !circle.containsPoint(result.origin) {
            result.origin.x += 0.1
        }
        
        while !circle.containsPoint(CGPoint(result.maxX, result.origin.y)) {
            result.size.width -= 0.1
        }
*/
        
        let r = self.size.height / 2.0
        // convert initial y so that circle is centered at origin
        let y = r - result.origin.y
        let theta = asin(y/r)
        let x = r * cos(theta)
        // convert resulting x from circle centered at origin
        let offset = self.size.width / 2.0 - r
        result.origin.x = r-x+offset
        result.size.width = 2*x

        
        return result

    }
    
}
