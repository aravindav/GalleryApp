//
//  HotViewController.swift
//  Insta
//
//  Created by Aravind on 13/06/21.
//

import UIKit

import MBProgressHUD

class HotViewController: BaseViewController {

    // MARK: - IBOutlets

   @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var topCollectionViewHeightConstraint: NSLayoutConstraint!

    // MARK: - Properties

    let hotViewModel = HotViewModel()
    var hotPhotos = [ImageMeta]()

    // MARK: - ViewLifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewModel()
        topCollectionView.dataSource = self
        topCollectionView.delegate = self
        
    }
    
    // MARK: - Methods

    func setupViewModel()  {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        hotViewModel.getHotPhotos()

        hotViewModel.getPhotoListDidSucess = { [weak self] list in
            
           guard let strongSelf = self else {return}
            strongSelf.hotPhotos = list

            DispatchQueue.main.async {
                MBProgressHUD.hide(for: strongSelf.view, animated: true)
                strongSelf.collectionView.reloadData()
                strongSelf.topCollectionView.reloadData()

            }
            
        }
        
        hotViewModel.getPhotoListDidFailed = { [weak self] message in
            print("message \(message)")
            guard let strongSelf = self else {return}
            DispatchQueue.main.async {
                MBProgressHUD.hide(for: strongSelf.view, animated: true)
            }
        }
        
    }

 
}

// MARK: - CollectionViewDataSource


extension HotViewController: UICollectionViewDataSource,UICollectionViewDelegate {

     func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {


        return  hotPhotos.count
    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let photo = hotPhotos[indexPath.row]

        if collectionView == topCollectionView {
            let cell : CarouselCell  = collectionView.dequeueReusableCell(for: indexPath)
            cell.configureCell(with: photo)
            return cell

        }
        else{
            let cell : PhotoListCell  = collectionView.dequeueReusableCell(for: indexPath)
            cell.configureCell(with: photo)
            return cell

        }
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HotViewController: UICollectionViewDelegateFlowLayout {

        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return CGFloat(interitemSpacing)
        }

        func collectionView(_ collectionView: UICollectionView, layout
            collectionViewLayout: UICollectionViewLayout,
                            minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return CGFloat(lineSpacing)
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if  collectionView == topCollectionView{
            return  getItemSizeForHorizontal()
        }
        else{
            return getItemSize()

        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HotViewController {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

        if(velocity.y>0) {
            UIView.animate(withDuration: 0.3, delay: 0, options: UIView.AnimationOptions(), animations: {
                self.topCollectionView.isHidden = true
                self.topCollectionViewHeightConstraint.constant = 0
                self.topCollectionView.layoutIfNeeded()
            }, completion: nil)

        } else {
            UIView.animate(withDuration: 0.3, delay: 0, options: UIView.AnimationOptions(), animations: {
                self.topCollectionView.isHidden = false
                self.topCollectionViewHeightConstraint.constant = CGFloat(topCollectionViewHeight)
                self.topCollectionView.layoutIfNeeded()
            }, completion: nil)
          }
       }
}
