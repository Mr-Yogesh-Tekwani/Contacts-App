//
//  ViewController.swift
//  ContactsApp
//
//  Created by Dhiraj on 6/7/23.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel: ViewControllerViewModel

        init(viewModel: ViewControllerViewModel) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    let tableView = UITableView()
    
    let stack : UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    
    let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonClicked))
    let groupsButton = UIBarButtonItem(title: "Groups", style: .plain, target: nil, action: nil)
    let contactsTitle = UIBarButtonItem(title: "Contacts", style: .plain, target: nil, action: nil)
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.viewModel.getAllContacts()

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navItems = UINavigationItem(title: "Contacts")
        navItems.leftBarButtonItem = groupsButton
        navItems.rightBarButtonItem = addButton
        
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 44))
        navigationBar.items = [navItems]
        
        
        stack.addArrangedSubview(navigationBar)
        stack.addArrangedSubview(tableView)
        self.view.addSubview(stack)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        viewModel.getAllContacts()
        tableView.reloadData()
        
        let safeArea = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: safeArea.topAnchor),
            stack.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            stack.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
    
    @objc func addButtonClicked(){
        let svc = SecondViewController()
        navigationController?.pushViewController(svc, animated: true)
    }
}



extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.allData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = viewModel.allData[indexPath.row].name ?? "No Data"
        return cell
    }
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            viewModel.deleteContact(item: viewModel.allData[indexPath.row])
        }
    }
}


