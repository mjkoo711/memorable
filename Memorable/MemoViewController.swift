//
//  MemoViewController.swift
//  Memorable
//
//  Created by 구민준 on 04/01/2019.
//  Copyright © 2019 mjkoo. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController {
  let contents: [String] = ["aaaa", "bbbbb", "ccccccc", "dddddddd", "eeeeeeeeee", "fffffffffff", "ggggggggggggggg"]
  @IBOutlet var collectionView: UICollectionView!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
}

extension MemoViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return contents.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TextCell", for: indexPath) as! TextCollectionViewCell

    cell.textLabel.text = contents[indexPath.row]
    cell.textLabel.sizeToFit()
    return cell
  }
}

extension MemoViewController {
  func getTetWidthFromString(text: String, width: CGFloat, pading: CGFloat, fontName: String, fontSize: CGFloat) -> CGFloat {
    let attributes: Dictionary = [NSAttributedString.Key.font: UIFont(name: fontName, size: fontSize)]
    let rect: CGRect = NSString(string: text).boundingRect(with: CGSize(width: width, height: .greatestFiniteMagnitude), options: .usesLineFragmentOrigin, attributes: attributes as [NSAttributedString.Key : Any], context: nil)
    return rect.size.width + pading
  }
}

extension MemoViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TextCell", for: indexPath) as! TextCollectionViewCell

    let sizeFromString = self.getTetWidthFromString(text: contents[indexPath.row], width: cell.textLabel.frame.width, pading: CGFloat(contents[indexPath.row].count * 5), fontName: "HelveticaNeue-Light", fontSize: 13)
    return CGSize(width: sizeFromString, height:30)
  }
}


