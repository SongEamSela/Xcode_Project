//
//  BookingRequestVC.swift
//  FetchDataAPI
//
//  Created by SongEam Sela on 8/13/20.
//  Copyright © 2020 SongEam Sela. All rights reserved.
//

import UIKit
import CarbonKit

class BookingRequestVC: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.navigationController?.navigationBar.barTintColor = UIColor.purple
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        title = "MY ORDER"
        
        let tabSwipe = CarbonTabSwipeNavigation(items: [ "Order", "Booking", "Status"], delegate: self)
        tabSwipe.setTabExtraWidth(40)
        tabSwipe.insert(intoRootViewController: self)

        // Do any additional setup after loading the view.
    }

}

extension BookingRequestVC : CarbonTabSwipeNavigationDelegate {
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        if index == 0 {
            return OrderVC()
        }
        else if index == 1 {
            return BookingVC()
        }
        else {
            return StatusVC()
        }
    }
}

