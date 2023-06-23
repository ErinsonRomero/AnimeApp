//
//  ApiRandom.swift
//  AnimeApp
//
//  Created by Erinson Andres Romero Terry on 26/04/23.
//

import Foundation
protocol RandomDelegate {
    func didUpdateAnime(movie: RandomDatas)
    func didFailWithError(error: Error)
}

struct RandomApi {
    let tmdbURL = "https://api.jikan.moe/v4/random/"
    var delegate: RandomDelegate?
    func Tipo(tipo: String) {
        let urlString = "\(tmdbURL)\(tipo)"
        self.performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        // creo un url
        if let url = URL(string: urlString) {
            //creo un urlsession
            let session = URLSession(configuration: .default)
            //doy una tarea a la session
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if  let cartelMostrar = self.parseJSON(animeData: safeData) {
                        self.delegate?.didUpdateAnime(movie: cartelMostrar)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(animeData: Data) -> RandomDatas? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(RandomData.self, from: animeData)
            let resultados = decodedData.data// aqui se descomprime
            return resultados
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
