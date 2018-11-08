//
//  DesignableTextField.swift
//  PocSearchBar
//
//  Created by Md. Mahadhi Hassan Chowdhury on 11/7/18.
//  Copyright © 2018 Md. Mahadhi Hassan Chowdhury. All rights reserved.
//

import UIKit
@IBDesignable
class DesignableTextField: UITextField {

    @IBInspectable var cornerRadius : CGFloat = 0{
        didSet{
            layer.cornerRadius = cornerRadius
            //updateView()
        }
    }
    
    @IBInspectable var leftImage: UIImage?{
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var leftPadding : CGFloat = 0 {
        didSet{
            updateView()
        }
    }
    
    func updateView() {
        
        if let image = leftImage{
            leftViewMode = .always
            let imageView =  UIImageView(frame:CGRect(x: leftPadding, y: 0, width: 20, height: 20))
            imageView.image = image
            imageView.tintColor = tintColor
            
            var width = leftPadding + 20
            
            if borderStyle == UITextBorderStyle.none || borderStyle == UITextBorderStyle.line {
                width = width + 8
            }
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
            view.addSubview(imageView)
            leftView = view
            
        }else{
            leftViewMode = .never
        }
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ? placeholder! : "Search Your Products", attributes: [NSAttributedStringKey.foregroundColor: tintColor])
    }
    
    
}
