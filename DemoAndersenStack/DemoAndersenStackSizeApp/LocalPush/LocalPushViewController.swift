//
//  LocalPushViewController.swift
//  DemoAndersenStackSizeApp
//
//  Created by admin on 30.10.2019.
//  Copyright © 2019 Viacheslav Savitsky. All rights reserved.
//

import UIKit
import UserNotifications

class LocalPushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapPushNotification(_ sender: Any) {
        
        push()
    }
    
    private func push() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            center.delegate = self
        }
        
        let content = UNMutableNotificationContent()
        content.title = "It's title"
        content.body = "It's body"
        content.sound = UNNotificationSound.default
        content.badge = 7
        
        let date = Date(timeIntervalSinceNow: 3)
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        
        center.add(request) { (error) in
            
        }
        
        let userActions = "User Actions"
        let snoozeAction = UNNotificationAction(identifier: "Snooze", title: "Snooze", options: [])
        let deleteAction = UNNotificationAction(identifier: "Delete", title: "Delete", options: [.destructive])
        let category = UNNotificationCategory(identifier: userActions, actions: [snoozeAction, deleteAction], intentIdentifiers: [], options: [])
        
        center.setNotificationCategories([category])
    }
}

extension LocalPushViewController: UNUserNotificationCenterDelegate {
    
}
