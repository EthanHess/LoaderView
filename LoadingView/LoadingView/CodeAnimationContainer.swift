//
//  CodeAnimationContainer.swift
//  LoadingView
//
//  Created by Ethan Hess on 2/27/23.
//

import UIKit

class CodeAnimationContainer: UIView {
    
    var shapeArray : [UIView] = []
    var subContainer : UIView = { //will contain animating shapes, has clear background and can flip
        let sc = UIView()
        return sc
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .darkGray
    }
    
    func addShapesToScreen() {
        //Place two overlapping circles on the left and right side, these will expand into < and > (tags 0,1 and 3,4)
        
        //Place circle in the middle, this will expand into / (tag 2)
        
        //Place all views inside subcontainer
        
        let fs = self.frame.size
        subContainer.frame = CGRect(x: 0, y: 0, width: fs.width, height: fs.height)
        subContainer.backgroundColor = .clear
        addSubview(subContainer)
        
        let startCircleHeight = 30
        let halfDimension = startCircleHeight / 2
        let yCoord = (Int(fs.height) / 3) - halfDimension
        let third = Int(fs.width / 3)
        
        let leftStartFrame = CGRect(x: third - halfDimension, y: yCoord, width: startCircleHeight, height: startCircleHeight)
        let leftCircleExpandUp = UIView(frame: leftStartFrame)
        let leftCircleExpandDown = UIView(frame: leftStartFrame)
        
        let centerStartFrame = CGRect(x: Int((fs.width / 2) - CGFloat(halfDimension)), y: yCoord, width: startCircleHeight, height: startCircleHeight)
        let centerCircle = UIView(frame: centerStartFrame)
        
        let rightStartFrame = CGRect(x: (third * 3) - halfDimension, y: yCoord, width: startCircleHeight, height: startCircleHeight)
        let rightCircleExpandUp = UIView(frame: rightStartFrame)
        let rightCircleExpandDown = UIView(frame: rightStartFrame)
        
        //Add to view array w / tag (should do in loop)
        leftCircleExpandUp.tag = 0
        leftCircleExpandDown.tag = 1
        centerCircle.tag = 2
        rightCircleExpandUp.tag = 3
        rightCircleExpandDown.tag = 4
        
        shapeArray.append(leftCircleExpandUp)
        shapeArray.append(leftCircleExpandDown)
        shapeArray.append(centerCircle)
        shapeArray.append(rightCircleExpandUp)
        shapeArray.append(rightCircleExpandUp)
        
        for shape in shapeArray {
            shape.layer.cornerRadius = CGFloat(halfDimension)
            shape.backgroundColor = .white
        }
        
        animateShapes()
    }
    
    fileprivate func addGradientToView(_ view: UIView) {
        //TODO imp.
    }
    
    //TODO pulsate dots at beginning the go to </> animation?
    //Can also show them fluttering into place or something cool like that?
    
    fileprivate func animateShapes() {
        for shape in shapeArray {
            switch shape.tag {
            case 0:
                animateLeftSide(false, view: shape)
            case 1:
                animateLeftSide(true, view: shape)
            case 2:
                animateCenter(shape)
            case 3:
                animateRightSide(false, view: shape)
            case 4:
                animateRightSide(true, view: shape)
            default:
                print("WTD here")
            }
        }
    }
    
    fileprivate func animateLeftSide(_ up: Bool, view: UIView) {
        //TODO imp.
    }
    
    fileprivate func animateRightSide(_ up: Bool, view: UIView) {
        //TODO imp.
    }
    
    fileprivate func animateCenter(_ view: UIView) {
        //TODO imp. 
    }
    
    deinit {
        print("CAC deinit")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
