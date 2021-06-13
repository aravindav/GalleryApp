//
//  HotViewModel.swift
//  Insta
//
//  Created by Aravind on 13/06/21.
//

import Foundation


final class HotViewModel {
    
    var getPhotoListDidSucess : (([ImageMeta]) -> Void)?
    var getPhotoListDidFailed : ((String) -> Void)?
 

    func getHotPhotos()  {
        
        APIManager.shared.getHotPhotos { (result) in
            
            switch result {
            case .success(let imageList) :
                
                self.getPhotoListDidSucess?(imageList.data)
                break
            case .failure(_) :
                
                self.getPhotoListDidFailed?("Failed")

                break
            
            }
            
        }

    }
}
