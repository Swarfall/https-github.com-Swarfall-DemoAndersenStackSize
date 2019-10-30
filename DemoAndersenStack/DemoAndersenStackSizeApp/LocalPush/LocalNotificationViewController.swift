//
//  LocalNotificationViewController.swift
//  DemoAndersenStackSizeApp
//
//  Created by admin on 30.10.2019.
//  Copyright © 2019 Viacheslav Savitsky. All rights reserved.
//

import UIKit
import UserNotifications

class LocalNotificationViewController: UIViewController {

    let center = UNUserNotificationCenter.current()
    let content = UNMutableNotificationContent()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapLocalNotification(_ sender: Any) {
        localNotification()
    }
    
    private func localNotification() {
        content.title = "It's title"
        content.subtitle = "It's subtitle"
        content.body = "It's body"
        content.sound = UNNotificationSound.default
        content.badge = 47
        
        let date = Date(timeIntervalSinceNow: 5)
        
        let dateConponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute , .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateConponents, repeats: false)
        
        let request = UNNotificationRequest(identifier: "content", content: content, trigger: trigger)
        
        center.add(request) { (error) in
            if error != nil {
                print(error)
            }
        }
        let snoozeAction = UNNotificationAction(identifier: "Snooze", title: "Snooze", options: [])
        let deleteAction = UNNotificationAction(identifier: "Delete", title: "Delete", options: [.destructive])
        let category = UNNotificationCategory(identifier: "content", actions: [snoozeAction, deleteAction], intentIdentifiers: [], options: [])
        
        center.setNotificationCategories([category])
        
    }
}
