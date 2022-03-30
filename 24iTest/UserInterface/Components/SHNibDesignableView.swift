//
//  SHNibDesignableView.swift
//  24iTest
//
//  Created by Bojan Angjeleski on 29.3.22.
//

import Foundation

import UIKit

class SHNibDesignableView: UIView {
    
    private(set) var contentView: UIView?
    var nibName: String? {
        return NSStringFromClass(self.classForCoder).substringAfterFirstOccurence(of: ".")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadViewFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadViewFromNib()
    }
    
    override var backgroundColor: UIColor? {
        didSet {
            contentView?.backgroundColor = backgroundColor
        }
    }
    
    // Subclasses should override - and call the superclass' viewDidLoadFromNib for any additional setup. It is guaranteed that at this point the outlets have all been initialized
    func viewDidLoadFromNib() {
        
    }

    private func loadViewFromNib() {
        guard let nibName = self.nibName else { return }
        let nib: UINib = UINib(nibName: nibName, bundle: Bundle(for: self.classForCoder))
        let views = nib.instantiate(withOwner: self, options: nil)
        
        guard let firstView = views.first as? UIView else { return }
        contentView = firstView
        constrainViewIntoSelf(firstView)
        viewDidLoadFromNib()
        backgroundColor = .clear
    }
}

fileprivate extension String {
    func substringAfterFirstOccurence(of string: String) -> String {
        guard let occurence = self.range(of: string) else { return self }
        return String(self[occurence.upperBound...])
    }
}

@objc extension UIView {
    
    @objc func constrainViewIntoSelf(_ view: UIView) {
        view.removeFromSuperview()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        
        let commonVFM: String = "|[view]|"
        let viewsDict: [String: Any] = ["view": view]
        let vfmVertical: String = "V:" + commonVFM
        let vfmHorizontal: String = "H:" + commonVFM
        let verticalConstraints: [NSLayoutConstraint] = NSLayoutConstraint.constraints(withVisualFormat: vfmVertical, options: [], metrics: nil, views: viewsDict)
        let horizontalConstraints: [NSLayoutConstraint] = NSLayoutConstraint.constraints(withVisualFormat: vfmHorizontal, options: [], metrics: nil, views: viewsDict)
        
        addConstraints(verticalConstraints)
        addConstraints(horizontalConstraints)
        setNeedsLayout()
    }
}



