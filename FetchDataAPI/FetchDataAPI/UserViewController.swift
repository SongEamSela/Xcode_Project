//
//  UserViewController.swift
//  FetchDataAPI
//
//  Created by SongEam Sela on 8/9/20.
//  Copyright © 2020 SongEam Sela. All rights reserved.
//

import UIKit

class UserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let userdata = GetUsers.getUsers()
    

    let userTableView = UITableView()
    
    
    func setUpNavigation() {
     navigationItem.title = "Get User From API" //app bar title
     self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1) //app bar color
     self.navigationController?.navigationBar.isTranslucent = false
     self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)]
    }


    override func viewDidLoad() {
        view.addSubview(userTableView)
        userTableView.dataSource = self
        userTableView.delegate = self
        userTableView.translatesAutoresizingMaskIntoConstraints = false
        userTableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        userTableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        userTableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        
        userTableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        userTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        userTableView.register(UserTableViewCell.self, forCellReuseIdentifier: "userCell")
        
        super.viewDidLoad()
        setUpNavigation()
        
        print (userdata.count)

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userdata.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell
        cell.user = userdata[indexPath.row]
        //        cell.textLabel?.text = contacts[indexPath.row].name
                return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
