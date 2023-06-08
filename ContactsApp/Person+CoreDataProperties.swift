//
//  Person+CoreDataProperties.swift
//  ContactsApp
//
//  Created by Dhiraj on 6/7/23.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var primaryKey: UUID?
    @NSManaged public var address: String?
    @NSManaged public var emailDetails: NSSet?
    @NSManaged public var phoneDetails: NSSet?

}

// MARK: Generated accessors for emailDetails
extension Person {

    @objc(addEmailDetailsObject:)
    @NSManaged public func addToEmailDetails(_ value: Email)

    @objc(removeEmailDetailsObject:)
    @NSManaged public func removeFromEmailDetails(_ value: Email)

    @objc(addEmailDetails:)
    @NSManaged public func addToEmailDetails(_ values: NSSet)

    @objc(removeEmailDetails:)
    @NSManaged public func removeFromEmailDetails(_ values: NSSet)

}

// MARK: Generated accessors for phoneDetails
extension Person {

    @objc(addPhoneDetailsObject:)
    @NSManaged public func addToPhoneDetails(_ value: Phone)

    @objc(removePhoneDetailsObject:)
    @NSManaged public func removeFromPhoneDetails(_ value: Phone)

    @objc(addPhoneDetails:)
    @NSManaged public func addToPhoneDetails(_ values: NSSet)

    @objc(removePhoneDetails:)
    @NSManaged public func removeFromPhoneDetails(_ values: NSSet)

}

extension Person : Identifiable {

}
