//
//  BookingVC.swift
//  FetchDataAPI
//
//  Created by SongEam Sela on 8/13/20.
//  Copyright © 2020 SongEam Sela. All rights reserved.
//

import UIKit

class BookingVC: UIViewController {
    
    let imgIcon : UIImageView = {
        let img = UIImageView()
        let profile = UIImage(named: "filterIcon")
        img.image = profile
        img.contentMode = .scaleAspectFill
//        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        
        return img
    }()
    
    let filterText : UITextView = {
        let textView = UITextView()
        textView.text = "Booking Request"
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
//        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        filtterView()

        // Do any additional setup after loading the view.
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

extension BookingVC {
    func filtterView() {
        let filter = UIView()
        filter.translatesAutoresizingMaskIntoConstraints = false
        filter.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        filter.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        filter.widthAnchor.constraint(equalToConstant: 150).isActive = true
        filter.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        filter.addSubview(imgIcon)
        imgIcon.translatesAutoresizingMaskIntoConstraints = false
        imgIcon.topAnchor.constraint(equalTo: filter.topAnchor).isActive = true
        imgIcon.leftAnchor.constraint(equalTo: filter.leftAnchor).isActive = true
        imgIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imgIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        filter.addSubview(filterText)
        filterText.translatesAutoresizingMaskIntoConstraints = false
        filterText.topAnchor.constraint(equalTo: filter.topAnchor).isActive = true
        filterText.leftAnchor.constraint(equalTo: imgIcon.rightAnchor).isActive = true
        filterText.rightAnchor.constraint(equalTo: filter.rightAnchor).isActive = true
        filterText.bottomAnchor.constraint(equalTo: filter.bottomAnchor).isActive = true
        
        
    }
}

