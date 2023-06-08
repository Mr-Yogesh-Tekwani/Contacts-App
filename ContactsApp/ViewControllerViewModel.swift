//
//  ViewControllerViewModel.swift
//  ContactsApp
//
//  Created by Dhiraj on 6/7/23.
//

import Foundation
import UIKit

class ViewControllerViewModel {
    
    weak var vc: ViewController?
    func makeView() -> ViewController {
        let viewController = ViewController(viewModel: self)
        vc = viewController
        return viewController
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var allData : [Person] = []
    
    
    func createNewContact(name: String?, address: String?, phoneNumber: Int64? , email: String?) {
        let newContact = Person(context: context)
        newContact.name = name
        newContact.address = address
        newContact.primaryKey = UUID()
        addPhoneNumber(person: newContact, phoneNumber: phoneNumber ?? 0)
        addEmail(person: newContact, email: email ?? "")
        
        do{
            try context.save()
            print("Name: ", newContact.name)
            print("Address: ", newContact.address)
            print("Data Saved !!!")
            getAllContacts()
        }catch{
            print("Save Error", error.localizedDescription)
        }
        
    }
    
    func addPhoneNumber(person: Person, phoneNumber: Int64) {
        let phoneClass = Phone(context: context)
        phoneClass.phoneNumber = phoneNumber
        phoneClass.phoneRelation = person
        do{
            try context.save()
            print("Phone: ", phoneClass.phoneNumber)
        }catch{
            print("Save Error", error.localizedDescription)
        }
    }
    
    func addEmail(person: Person, email: String) {
        let emailClass = Email(context: context)
        emailClass.emailAddress = email
        emailClass.emailRelation = person
        do{
            try context.save()
            print("Email:",emailClass.emailAddress)
        }catch{
            print("Save Error", error.localizedDescription)
        }
    }
    
    func deleteContact(item: Person){
        context.delete(item)
        do{
            try context.save()
            getAllContacts()
        }catch{
            print("Save Error", error.localizedDescription)
        }
        
    }
    
    func updateContact(item: Person) {
        
    }
    
    func getAllContacts() {
        do{
            let items = try context.fetch(Person.fetchRequest())
            allData = items
            DispatchQueue.main.async {
                self.vc?.tableView.reloadData()
            }
            
        }catch{
            print(error)
        }
    }
    
    
    
    
}
