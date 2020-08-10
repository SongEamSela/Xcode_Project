//
//  UserViewController.swift
//  FetchDataAPI
//
//  Created by SongEam Sela on 8/9/20.
//  Copyright © 2020 SongEam Sela. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    //MARK: - Variable
    var users : [UserModel] = [UserModel] ()
    var page = 0
    var limit = 5
    var isLastPage = false
    //    private var results = [UserModel]()
    let userTableView = UITableView()

    //MARK: - UI
    let button : UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        button.setTitle("Loading More...", for: .normal)
        button.addTarget(self, action: #selector(onButtonClick), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        userTableView.dataSource = self
        userTableView.delegate = self
        userTableView.register(UserTableViewCell.self, forCellReuseIdentifier: "UserTableViewCell")
        
        
        view.addSubview(userTableView)
        userTableView.translatesAutoresizingMaskIntoConstraints = false
        userTableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        userTableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        userTableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        userTableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        userTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        //        view.addSubview(button)
        //        button.translatesAutoresizingMaskIntoConstraints = false
        //        button.topAnchor.constraint(equalTo: userTableView.bottomAnchor).isActive = true
        //        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        //        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        //        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        
        
        
        setUpNavigation()
        
        getData { user in }
        //       getProduct()
        
    }
    
}


//MARK: - Table Delegate
extension UserViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        
        let items = users[indexPath.row]
        cell.user = items
        //        cell.textLabel?.text = "\(items.first_name ?? "") \(items.last_name ?? "") "
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == (users.count-1) && !isLastPage {
            getData { user in }
        }
        print (indexPath.row)
        print (users.count)
    }
    
}

//MARK: - Functions

extension UserViewController {
    
    func  getData(completion: @escaping ([UserModel]) -> Void) {
        self.page = self.page + 1
        
        print("fetch page: \(page)")
        
        guard let url = URL(string: "https://reqres.in/api/users?page=\(page)&per_page=\(limit)") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(ResponseModel.self, from: data) {
                    // we have good data – go back to the main thread
                    DispatchQueue.main.async {
                        // update our UI
                        if decodedResponse.data?.count ?? 0 < self.limit {
                            self.isLastPage = true
                        }
                        self.users.append ( contentsOf: decodedResponse.data ?? [] )
                        self.userTableView.reloadData()
                        completion(self.users)
                    }
                    
                    // everything is good, so we can exit
                    return
                }
            }
            
            // if we're still here it means there was a problem
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
    
    @objc func onButtonClick(_ sender: Any) {
        getData { user in
            
        }
        
    }
    
    //    func getProduct() {
    //           users.append(UserModel(id: 01, email: "songeamsela2590@gmail.com", first_name: "Sela", last_name: "Songeam" , avatar: "https://m.media-amazon.com/images/M/MV5BN2Q0OTU3NzItZmZiNi00NzMzLWI4YWItNTExMWU1Zjc3MGE0XkEyXkFqcGdeQXVyODkzNTgxMDg@._V1_SY351_CR0,0,624,351_AL_.jpg"))
    //
    //           users.append(UserModel(id: 02, email: "songeamsela@gmail.com", first_name: "Sela", last_name: "Songeam" , avatar: "https://m.media-amazon.com/images/M/MV5BN2Q0OTU3NzItZmZiNi00NzMzLWI4YWItNTExMWU1Zjc3MGE0XkEyXkFqcGdeQXVyODkzNTgxMDg@._V1_SY351_CR0,0,624,351_AL_.jpg"))
    //
    //       }
}


//MARK: - Constraint
extension UserViewController {
    func setUpNavigation() {
        navigationItem.title = "Get User From API" //app bar title
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1) //app bar color
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)]
    }
    
    
}
