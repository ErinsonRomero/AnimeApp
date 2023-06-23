//
//  Interactor.swift
//  probandoViper
//
//  Created by Erinson Andres Romero Terry on 30/01/23.
//

import Foundation


protocol InteractorProtocol {
    func getName()
    func setName()
}
class Interactor {
    var presenter: PresenterProtocol?
}

extension Interactor: InteractorProtocol {
    func getName() {
        print("pidio2")
        self.setName()
    }
    
    func setName() {
        self.presenter?.setName("hajime")
        print("mando")
    }
}
