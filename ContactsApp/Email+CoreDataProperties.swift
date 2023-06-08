//
//  Email+CoreDataProperties.swift
//  ContactsApp
//
//  Created by Dhiraj on 6/7/23.
//
//

import Foundation
import CoreData


extension Email {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Email> {
        return NSFetchRequest<Email>(entityName: "Email")
    }

    @NSManaged public var emailAddress: String?
    @NSManaged public var emailRelation: Person?

}

extension Email : Identifiable {

}
