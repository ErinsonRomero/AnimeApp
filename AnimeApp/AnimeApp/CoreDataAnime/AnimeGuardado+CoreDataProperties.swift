//
//  AnimeGuardado+CoreDataProperties.swift
//  AnimeApp
//
//  Created by Erinson Andres Romero Terry on 6/01/23.
//
//

import Foundation
import CoreData


extension AnimeGuardado {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AnimeGuardado> {
        return NSFetchRequest<AnimeGuardado>(entityName: "AnimeGuardado")
    }

    @NSManaged public var id: String?
    @NSManaged public var nombre: String?
    @NSManaged public var poster: String?

}

extension AnimeGuardado : Identifiable {

}
