//
//  FooterMenu.swift
//  SampleRVC
//
//  Created by Walicki, Pawel (Cognizant) on 6/22/17.
//  Copyright © 2017 es.pael. All rights reserved.
//

import UIKit

protocol FooterMenuDelegate: class {
    func buttonTapped(arg: String)
}

class FooterMenu: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    weak var delegate: FooterMenuDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    /// setup the view
    private func commonInit() {
        Bundle.main.loadNibNamed("FooterMenu", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        delegate?.buttonTapped(arg: "Hello")
    }
}
