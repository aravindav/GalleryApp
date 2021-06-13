//
//  BaseViewController.swift
//  Insta
//
//  Created by Aravind on 13/06/21.
//

import UIKit


class BaseViewController: UIViewController {


    let lineSpacing = 10
    let interitemSpacing = 5
    // MARK: - ViewLifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.tabBarController?.tabBar.isHidden = false

    }
    
    // MARK: - Methods

    
    func getItemSize() -> CGSize {
        if UIDevice.current.orientation.isLandscape {
            let width = view.frame.size.width
            return CGSize(width: width * 0.20, height: 120)
            
        } else {
            let width = view.frame.size.width
            return CGSize(width: width * 0.90, height: 120)
            
        }
    }

    func getItemSizeForHorizontal() -> CGSize {
        if UIDevice.current.orientation.isLandscape {
            let width = view.frame.size.width
            return CGSize(width: width * 0.20, height: 320)
            
        } else {
            let width = view.frame.size.width
            return CGSize(width: width * 0.90, height: 320)
            
        }
    }
}
