//
//  Presenter.swift
//  probandoViper
//
//  Created by Erinson Andres Romero Terry on 30/01/23.
//

import Foundation

protocol PresenterProtocol {
    func getName()
    func setName(_ nombre: String)
}
class Presenter {
    var view: ViewControllerProtocol?
    var interactor: InteractorProtocol?
}

extension Presenter: PresenterProtocol {
    func getName() {
        print("Pidio")
        interactor?.getName()
    }
    
    func setName(_ nombre: String) {
        print("nombre")
        self.view?.setName(nombre)
    }
    
    
}
