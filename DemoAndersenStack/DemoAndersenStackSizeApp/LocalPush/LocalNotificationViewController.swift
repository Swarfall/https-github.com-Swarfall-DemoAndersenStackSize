//
//  LocalNotificationViewController.swift
//  DemoAndersenStackSizeApp
//
//  Created by admin on 30.10.2019.
//  Copyright © 2019 Viacheslav Savitsky. All rights reserved.
//

import UIKit
import UserNotifications

class LocalNotificationViewController: UIViewController, UNUserNotificationCenterDelegate {

    let center = UNUserNotificationCenter.current()
    let content = UNMutableNotificationContent()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapLocalNotification(_ sender: Any) {
        //localNotification()
        
        scheduleNotification(notificationType: "jopa")
    }
    func scheduleNotification(notificationType: String) {
        
        let userActions = "User Actions"
        
        content.title = notificationType
        content.body = "This is example how to create " + notificationType
        content.sound = UNNotificationSound.default
        content.badge = 1
        content.categoryIdentifier = userActions
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let identifier = "Local Notification"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        center.add(request) { (error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
        
        let snoozeAction = UNNotificationAction(identifier: "Snooze", title: "Snooze", options: [])
        let deleteAction = UNNotificationAction(identifier: "Delete", title: "Delete", options: [.destructive])
        let category = UNNotificationCategory(identifier: userActions, actions: [snoozeAction, deleteAction], intentIdentifiers: [], options: [])
        
        center.setNotificationCategories([category])
    }
    //  private func localNotification() {
//        content.title = "It's title"
//        content.subtitle = "It's subtitle"
//        content.body = "It's body"
//        content.sound = UNNotificationSound.default
//        content.badge = 47
//
//        let repeatAction = UNNotificationAction(identifier:"repeat",
//            title:"Repeat",options:[])
//        let changeAction = UNTextInputNotificationAction(identifier:
//            "change", title: "Change Message", options: [])
//
//        let category = UNNotificationCategory(identifier: "actionCategory",
//             actions: [repeatAction, changeAction],
//            intentIdentifiers: [], options: [])
//
//        content.categoryIdentifier = "actionCategory"
//
//        UNUserNotificationCenter.current().setNotificationCategories([category])
//
//        let date = Date(timeIntervalSinceNow: 5)
//
//        let dateConponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute , .second], from: date)
//
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateConponents, repeats: false)
//
//        let request = UNNotificationRequest(identifier: "content", content: content, trigger: trigger)
//
//        center.add(request) { (error) in
//            if error != nil {
//                print(error)
//            }
//        }
//        center.delegate = self
//        let snoozeAction = UNNotificationAction(identifier: "Snooze", title: "Snooze", options: [])
//        let deleteAction = UNNotificationAction(identifier: "Delete", title: "Delete", options: [.destructive])
//        let notificationCategory = UNNotificationCategory(identifier: "content", actions: [snoozeAction, deleteAction], intentIdentifiers: [], options: [])
//
//        UNUserNotificationCenter.current().setNotificationCategories([notificationCategory])
//
//    }
}
