//
//  UICollectionViewCell+Extension.swift
//  Insta
//
//  Created by Aravind on 13/06/21.
//

import UIKit

extension UICollectionView {
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to Dequeue Reusable Collection View Cell")
        }
        
        return cell
    }
}

extension UICollectionViewCell {
    
    static var reuseIdentifier : String {
        return String(describing: self)
    }
    
}

