//
//  OSLActivityIndicator.swift
//  test
//
//  Created by Laurent Favard on 06/01/2018.
//  Copyright © 2018 Laurent68k. All rights reserved.
//

import UIKit

/**
 Represent an advanced UIActivityIndicatorView embedded in an UIView subclassed.
 */
class OSLActivityIndicatorView: UIView {

    //  -------------------------------------------------------------------------------------------------------------------------------------------
    private var activityIndicator : UIActivityIndicatorView?
    //  -------------------------------------------------------------------------------------------------------------------------------------------
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = .clear

        self.addActivityIndicator()
    }
    
    convenience init() {
        
        self.init(frame: CGRect.zero)
        
        self.addActivityIndicator()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
     
        super.draw(rect)
        
        // Size of rounded rectangle
        let rectWidth = rect.width
        let rectHeight = rect.height

        // Find center of actual frame to set rectangle in middle
        let xf:CGFloat = (self.frame.width  - rectWidth)  / 2
        let yf:CGFloat = (self.frame.height - rectHeight) / 2

        let ctx: CGContext = UIGraphicsGetCurrentContext()!
        ctx.saveGState()

        let rect = CGRect(x: xf, y: yf, width: rectWidth, height: rectHeight)
        let clipPath: CGPath = UIBezierPath(roundedRect: rect, cornerRadius: 6).cgPath

        ctx.addPath(clipPath)
        
        if let activity = self.activityIndicator {
        
            if activity.isAnimating {
                ctx.setFillColor(UIColor.darkGray.cgColor)
            }
            else {
                ctx.setFillColor(UIColor.clear.cgColor)
            }
        }
        
        ctx.closePath()
        ctx.fillPath()
        ctx.restoreGState()
    }

    //  -------------------------------------------------------------------------------------------------------------------------------------------
    //  -------------------------------------------------------------------------------------------------------------------------------------------

    func startAnimating() {
        
        self.activityIndicator?.startAnimating()
        self.setNeedsDisplay()
    }
    
    func stopAnimating() {
        
        self.activityIndicator?.stopAnimating()
        self.setNeedsDisplay()
    }

    var isAnimating : Bool {
    
        return self.activityIndicator?.isAnimating ?? false
    }
    
    var activityIndicatorViewStyle : UIActivityIndicatorViewStyle {
        
        get {
            return self.activityIndicator?.activityIndicatorViewStyle ?? UIActivityIndicatorViewStyle.whiteLarge
        }
        set {
            self.activityIndicator?.activityIndicatorViewStyle = newValue
        }
    }
    
    var hidesWhenStopped : Bool {
    
        get {
            return self.activityIndicator?.hidesWhenStopped ?? true
        }
        set {
            self.activityIndicator?.hidesWhenStopped  = newValue
        }
    }
    //  -------------------------------------------------------------------------------------------------------------------------------------------
    //  -------------------------------------------------------------------------------------------------------------------------------------------

    /**
     Add programmaticaly an UIActivityIndicatorView
     */
    private func addActivityIndicator() {
        
        //  If not already created
        if self.activityIndicator == nil {
            
            self.activityIndicator = UIActivityIndicatorView()
            
            //  Unwrap to manipulate easily
            if let activityIndicator = self.activityIndicator {
                
                //  Set my preferrences
                activityIndicator.activityIndicatorViewStyle = .whiteLarge
                activityIndicator.hidesWhenStopped = true
                activityIndicator.translatesAutoresizingMaskIntoConstraints = false
                
                self.addSubview(activityIndicator)
                
                //  finally add the constraints for the UI
                let horizontalConstraint = NSLayoutConstraint(item: activityIndicator, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0)
                
                let verticalConstraint = NSLayoutConstraint(item: activityIndicator, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0)

                let leftConstraint = NSLayoutConstraint(item: activityIndicator, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 0)

                let rightConstraint = NSLayoutConstraint(item: activityIndicator, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.right, multiplier: 1, constant: 0)

                self.addConstraint(horizontalConstraint)
                self.addConstraint(verticalConstraint)
                self.addConstraint(leftConstraint)
                self.addConstraint(rightConstraint)
            }
        }
    }

}
