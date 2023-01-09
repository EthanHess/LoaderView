//
//  LoadingView.swift
//  LoadingView
//
//  Created by Ethan Hess on 6/28/22.
//

import UIKit

//Should import FontAwesome for these ? (Yes!)
//Eventually move to different file but can keep here for now
enum LoadingLabelFont {
    
}

enum LoadingLabelBackgroundColor {
    
}

enum LoadingLabelTextColor {
    
}

enum LoadingAnimationStyle {
    
}

enum PinwheelAnimationStyle {
    
}

class LoadingView: UIView {

    //MARK: Subviews
    var loadingLabel : UILabel = {
        let ll = UILabel()
        ll.textAlignment = .center
        return ll
    }()
    
    var pinWheel : Pinwheel = {
        let pinwheel = Pinwheel()
        return pinwheel
    }()
    
    var isAnimating = false
    
    //MARK: UI Properties (settable)
    var loadingLabelColor : UIColor = .lightGray {
        didSet {
            
        }
    }
    
    var loadingBackgroundColor : UIColor = .darkGray {
        didSet {
            
        }
    }
    
    var loadingLabelFont : UIFont = .systemFont(ofSize: 14) {
        didSet {
            
        }
    }
    
    var loadingLabelText : String = "Loading" {
        didSet {
            
        }
    }
    
    var shouldPulsateWheel : Bool = false {
        didSet {
            
        }
    }
    
    var shouldPulsateLabel : Bool = false {
        didSet {
            
        }
    }
    
    //MARK: Life begins
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //TODO assert frame limits
        //assert(frame === something, "")
        
        self.perform(#selector(configureViews), with: nil, afterDelay: 0.25)
    }
    
    //MARK: View configure
    @objc fileprivate func configureViews() {
        pinWheel.frame = pinwheelStartFrame()
        addSubview(pinWheel)
        
        loadingLabel.frame = loadingLabelFrame()
        addSubview(loadingLabel)
        
        //All tests, eventually remove / be able to customize
        loadingLabel.textColor = .white
        loadingLabel.text = loadingLabelText
        
        pinWheel.animationColor = .white
        pinWheel.animatedCircleConfiguration(countIndex: 0, totalCount: 10)
        
        //First param should be how long loader stays on screen so it disappears right as circle finishes animation (when whatever data is loaded)
        pinWheel.animateCircle(3, toAmount: 0.8)
        
        self.backgroundColor = .darkGray //TODO customize, have option to do so
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true //Also can customize these
        
        self.layer.insertSublayer(gradientForBackground(), at: 0)
    }
    
    fileprivate func gradientForBackground() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.lightGray, UIColor.darkGray]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
        return gradientLayer
    }
    
    fileprivate func pinwheelStartFrame() -> CGRect {
        let viewWidth = self.frame.size.width
        let viewHeight = self.frame.size.height
        let pwWH = viewHeight / 4
        return CGRect(x: (viewWidth / 2) - (pwWH / 2), y: (viewHeight / 2) - (pwWH * 1.5), width: pwWH, height: pwWH)
    }
    
    fileprivate func loadingLabelFrame() -> CGRect {
        let viewWidth = self.frame.size.width
        let viewHeight = self.frame.size.height
        return CGRect(x: 10, y: viewHeight / 2, width: viewWidth - 20, height: viewHeight / 2)
    }
    
    //MARK: Functionality
    func startAnimation() {
        
    }
    
    func stopAnimation() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
