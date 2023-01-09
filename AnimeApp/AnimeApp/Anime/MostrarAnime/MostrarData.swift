//
//  MostrarData.swift
//  AnimeApp
//
//  Created by Erinson Andres Romero Terry on 2/01/23.
//

import Foundation

struct MostrarData: Decodable {
    let data: MostrarDatas
}

struct MostrarDatas: Decodable {
    let title: String
    let images: JpgBusqueda?
    let synopsis: String?
    let status: String
    let episodes: Int?
    let genres: [Genres]
    let score: Float?
    
}

struct JpgBusqueda: Decodable {
    let jpg: PosterBusqueda?
}
struct PosterBusqueda: Decodable {
    let large_image_url: String?
}

struct Genres: Decodable {
    let name: String
}
