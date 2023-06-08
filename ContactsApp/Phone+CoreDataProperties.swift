//
//  Phone+CoreDataProperties.swift
//  ContactsApp
//
//  Created by Dhiraj on 6/7/23.
//
//

import Foundation
import CoreData


extension Phone {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Phone> {
        return NSFetchRequest<Phone>(entityName: "Phone")
    }

    @NSManaged public var phoneNumber: Int64
    @NSManaged public var phoneRelation: Person?

}

extension Phone : Identifiable {

}
