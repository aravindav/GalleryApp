//
//  PhotoList.swift
//  Insta
//
//  Created by Aravind on 13/06/21.
//

import Foundation

struct ImageList: Codable {
    var data:[ImageMeta]
}
struct ImageMeta: Codable {
    var title: String?
    var id: String?
    var ups:Int?
    var downs:Int?
    var score:Int?
    var in_most_viral : Bool
    var images:[Image]?
    
}
struct Image:Codable {
    var id:String?
    var link:String?
    var description:String?

}
