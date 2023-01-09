//
//  BusquedaApi.swift
//  AnimeApp
//
//  Created by Erinson Andres Romero Terry on 2/01/23.
//

import Foundation
protocol BusquedaApiDelegate {
    func didUpdateAnime(movie: [Datas])
    func didFailWithError(error: Error)
}

struct BusquedaApi {
    let tmdbURL = "https://api.jikan.moe/v4/anime?letter="
    var delegate: BusquedaApiDelegate?
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
            }//aqui el session toma todos los datos de la pagina
            // inicio la sesion
            task.resume()
        }
    }
    
    func parseJSON(animeData: Data) -> [Datas]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(AnimeData.self, from: animeData)
            let resultados = decodedData.data// aqui se descomprime
            return resultados
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
