//
//  MemoViewController.swift
//  Memorable
//
//  Created by 구민준 on 04/01/2019.
//  Copyright © 2019 mjkoo. All rights reserved.
//  https://github.com/mischa-hildebrand/AlignedCollectionViewFlowLayout
//

import UIKit
import AlignedCollectionViewFlowLayout

class MemoViewController: UIViewController {
  @IBOutlet var collectionView: UICollectionView!
  let contents: [String] = ["aaaa", "bbbbbb", "cccccccc", "ddddddddd", "eeeeeeeeeeee", "ffff", "GGggggㅎㅎㄷㅎㅇㄹㅁㅇㄴㄹㄴㅁㅇㄹㅁㄴㅇㄹg"]

  override func viewDidLoad() {
    super.viewDidLoad()

    let flowLayout = collectionView.collectionViewLayout as? AlignedCollectionViewFlowLayout
    flowLayout?.horizontalAlignment = .left

  }
}

extension MemoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return contents.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TextCell", for: indexPath) as! TextCollectionViewCell
    cell.textLabel.text = contents[indexPath.row]


    return cell
  }
}

extension MemoViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    print(contents[indexPath.row].widthOfString(usingFont: UIFont(name:"verdana", size: 13.0)!))
    return CGSize(width: contents[indexPath.row].widthOfString(usingFont: UIFont(name:"verdana", size: 13.0)!) + 20, height:35)
  }
}
