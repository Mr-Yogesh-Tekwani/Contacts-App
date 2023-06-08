//
//  SecondViewController.swift
//  ContactsApp
//
//  Created by Dhiraj on 6/8/23.
//

import UIKit

class SecondViewController: UIViewController {

    var viewModel = ViewControllerViewModel()
    
    let nametf : UITextField = {
    let tf = UITextField()
    tf.backgroundColor = .white
    tf.textColor = .systemBlue
    tf.placeholder = "Enter Name"
    return tf
    }()
    
    let addresstf : UITextField = {
    let tf = UITextField()
    tf.backgroundColor = .white
    tf.textColor = .systemBlue
    tf.placeholder = "Enter Address"
    return tf
    }()
    
    let emailtf : UITextField = {
    let tf = UITextField()
    tf.backgroundColor = .white
    tf.textColor = .systemBlue
    tf.placeholder = "Enter Email Id"
    return tf
    }()
    
    let emailtf2 : UITextField = {
    let tf = UITextField()
    tf.backgroundColor = .white
    tf.textColor = .systemBlue
    tf.placeholder = "Enter Email Id"
    return tf
    }()
    
    let phonetf : UITextField = {
    let tf = UITextField()
    tf.backgroundColor = .white
    tf.textColor = .systemBlue
    tf.placeholder = "Enter Phone Number"
    return tf
    }()
    
    let phonetf2 : UITextField = {
    let tf = UITextField()
    tf.backgroundColor = .white
    tf.textColor = .systemBlue
    tf.placeholder = "Enter Phone Number"
    return tf
    }()
    
    let addNumberButton : UIButton = {
        let b = UIButton()
        b.setTitle("Add Number", for: .normal)
        b.tintColor = .systemBlue
        b.addTarget(self, action: #selector(addNumberClicked), for: .touchUpInside)
        return b
    }()
    
    let addEmailButton : UIButton = {
        let b = UIButton()
        b.setTitle("Add Email", for: .normal)
        b.tintColor = .systemBlue
        b.addTarget(self, action: #selector(addEmailClicked), for: .touchUpInside)
        return b
    }()
    
    let stack : UIStackView = {
        let sv = UIStackView()
        sv.distribution = .fillEqually
        sv.axis = .vertical
        sv.alignment = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navbar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 44))
        let navitem = UINavigationItem(title: "New Contact")
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveContact))
        navitem.rightBarButtonItem = saveButton
        navitem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: nil)
        navbar.items = [navitem]
        
        stack.addArrangedSubview(navbar)
        stack.addArrangedSubview(nametf)
        stack.addArrangedSubview(addresstf)
        stack.addArrangedSubview(emailtf)
        stack.addArrangedSubview(phonetf)
        stack.addArrangedSubview(addNumberButton)
        stack.addArrangedSubview(phonetf2)
        phonetf2.isHidden = true
        stack.addArrangedSubview(addEmailButton)
        emailtf2.isHidden = true
        stack.addArrangedSubview(emailtf2)
        
        self.view.addSubview(stack)
        
        let safeArea = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: safeArea.topAnchor),
            stack.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            stack.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            stack.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor)
        ])
  
    }
    
    @objc func saveContact(){
        DispatchQueue.main.async { [self] in
            viewModel.createNewContact(name: nametf.text, address: addresstf.text ,phoneNumber: Int64(phonetf.text!) ?? 0, email: emailtf.text)
        }
        viewModel.getAllContacts()
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func addNumberClicked(){
        addNumberButton.isHidden = true
        phonetf2.isHidden = false
        
    }
    
    @objc func addEmailClicked(){
        addEmailButton.isHidden = true
        emailtf2.isHidden = false
    }
    

}
