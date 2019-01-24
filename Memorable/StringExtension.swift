//
//  StringExtension.swift
//  Memorable
//
//  Created by MinJun KOO on 24/01/2019.
//  Copyright © 2019 mjkoo. All rights reserved.
//

import Foundation
import UIKit

extension String {
  func widthOfString(usingFont font: UIFont) -> CGFloat {
    let fontAttributes = [NSAttributedString.Key.font: font]
    let size = self.size(withAttributes: fontAttributes)
    return size.width
  }
}
