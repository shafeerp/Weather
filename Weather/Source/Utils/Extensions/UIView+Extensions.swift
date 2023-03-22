//
//  UIView+Extensions.swift
//  Weather
//
//  Created by Shafeer Puthalan on 18.03.23.
//

import UIKit

extension UIView {
    
    /// Extended method to give constraints easily
    func anchors(top: NSLayoutYAxisAnchor? = nil, topConstants: CGFloat = 0.0, leading: NSLayoutXAxisAnchor? = nil, leadingConstants: CGFloat = 0.0, bottom: NSLayoutYAxisAnchor? = nil, bottomConstants: CGFloat = 0.0, trailing: NSLayoutXAxisAnchor? = nil, trailingConstants: CGFloat = 0.0, heightConstants: CGFloat = 0.0, widthConstants: CGFloat = 0.0, centerX: NSLayoutXAxisAnchor? = nil, centerXConstants: CGFloat = 0.0, centerY: NSLayoutYAxisAnchor? = nil, centerYConstants: CGFloat = 0.0 ) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: topConstants).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: leadingConstants).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: bottomConstants).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: trailingConstants).isActive = true
        }
        if heightConstants > 0 {
            heightAnchor.constraint(equalToConstant: heightConstants).isActive = true
        }
        if widthConstants > 0 {
            widthAnchor.constraint(equalToConstant: widthConstants).isActive = true
        }
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX, constant: centerXConstants).isActive = true
        }
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY, constant: centerYConstants).isActive = true
        }
    }
}

