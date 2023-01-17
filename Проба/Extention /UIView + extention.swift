//
//  UIView + extention.swift
//  Проба
//
//  Created by Карина on 10.01.2023.
//

import UIKit


extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
          get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
