//
//  RandomData.swift
//  AnimeApp
//
//  Created by Erinson Andres Romero Terry on 26/04/23.
//

import Foundation
struct RandomData: Decodable {
    let data: RandomDatas
}

struct RandomDatas: Decodable {
    let title: String?
    let images: JpgRandom?
    let synopsis: String?
    let status: String?
    let episodes: Int?
    let genres: [GenresRandom]?
    let score: Float?
    
}

struct JpgRandom: Decodable {
    let jpg: PosterRandom?
}
struct PosterRandom: Decodable {
    let large_image_url: String?
}

struct GenresRandom: Decodable {
    let name: String?
}
