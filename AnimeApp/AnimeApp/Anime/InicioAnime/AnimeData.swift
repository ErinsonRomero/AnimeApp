//
//  AnimeData.swift
//  AnimeApp
//
//  Created by Erinson Andres Romero Terry on 2/01/23.
//

import Foundation

struct AnimeData: Decodable {
    let data: [Datas]
}

struct Datas: Decodable {
    let mal_id: Int
    let title: String
    let images: Jpg?
}

struct Jpg: Decodable {
    let jpg: Poster?
}
struct Poster: Decodable {
    let large_image_url: String?
}
