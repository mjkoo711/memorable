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

extension String {
  func split(by length: Int) -> [String] {
    var startIndex = self.startIndex
    var results = [Substring]()

    while startIndex < self.endIndex {
      let endIndex = self.index(startIndex, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
      results.append(self[startIndex..<endIndex])
      startIndex = endIndex
    }

    return results.map { String($0) }
  }
}
