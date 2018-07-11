//
//  BSImageView.swift
//  BSImageView
//
//  Created by Joakim Gyllström on 2018-07-08.
//  Copyright © 2018 Joakim Gyllström. All rights reserved.
//

import UIKit

@IBDesignable
public class BSImageView: UIView {
    private let imageView: UIImageView = UIImageView(frame: .zero)
    
    override public var isUserInteractionEnabled: Bool {
        didSet { imageView.isUserInteractionEnabled = isUserInteractionEnabled }
    }
    
    override public var tintColor: UIColor! {
        didSet { imageView.tintColor = tintColor }
    }
    
    override public var contentMode: UIViewContentMode {
        didSet {
            setNeedsLayout()
            layoutIfNeeded()
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubview(imageView)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        if let image = imageView.image {
            imageView.frame = ImageViewLayout.frameForImageWithSize(image.size, previousFrame: imageView.frame, inContainerWithSize: bounds.size, usingContentMode: contentMode)
        } else {
            imageView.frame = .zero
        }
    }
}

// MARK: UIImageView API
extension BSImageView {
    /// See UIImageView documentation
    public convenience init(image: UIImage?) {
        self.init(frame: .zero)
        imageView.image = image
    }
    
    /// See UIImageView documentation
    public convenience init(image: UIImage?, highlightedImage: UIImage?) {
        self.init(frame: .zero)
        imageView.image = image
        imageView.highlightedImage = highlightedImage
    }
    
    /// See UIImageView documentation
    @IBInspectable
    open var image: UIImage? {
        get { return imageView.image }
        set {
            imageView.image = newValue
            setNeedsLayout()
            layoutIfNeeded()
        }
    }
    
    /// See UIImageView documentation
    @IBInspectable
    open var highlightedImage: UIImage? {
        get { return imageView.highlightedImage }
        set {
            imageView.highlightedImage = newValue
        }
    }
    
    /// See UIImageView documentation
    @IBInspectable
    open var isHighlighted: Bool {
        get { return imageView.isHighlighted }
        set { imageView.isHighlighted = newValue }
    }
    
    /// See UIImageView documentation
    open var animationImages: [UIImage]? {
        get { return imageView.animationImages }
        set { imageView.animationImages = newValue }
    }
    
    /// See UIImageView documentation
    open var highlightedAnimationImages: [UIImage]? {
        get { return imageView.highlightedAnimationImages }
        set { imageView.highlightedAnimationImages = newValue }
    }
    
    /// See UIImageView documentation
    open var animationDuration: TimeInterval {
        get { return imageView.animationDuration }
        set { imageView.animationDuration = newValue }
    }
    
    /// See UIImageView documentation
    open var animationRepeatCount: Int {
        get { return imageView.animationRepeatCount }
        set { imageView.animationRepeatCount = newValue }
    }
    
    /// See UIImageView documentation
    open func startAnimating() {
        imageView.startAnimating()
    }
    
    /// See UIImageView documentation
    open func stopAnimating() {
        imageView.stopAnimating()
    }
    
    /// See UIImageView documentation
    open var isAnimating: Bool {
        get { return imageView.isAnimating }
    }
}
