//
//  NotificationViewModel.swift
//  AppIdentifier
//
//  Created by Agastya Nand on 04/07/25.
//
import SwiftUI
import Foundation
import CoreLocation

class NotificationManager {
    static let instance = NotificationManager()
    
    func requestDeleteNotification() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("Error occured \(error)")
            } else if success {
                print("Success")
            } else {
                print("permission not granted")
            }
            
        }
        
    }
    
    func scheduleNotification(){
        let contents = UNMutableNotificationContent()
        contents.title = "NO YOU CAN Not!"
        contents.subtitle = "These Applications can't be deleted from this platform."
        contents.sound = .default
        contents.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1.0, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: contents, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Failed to schedule a Notification: \(error)")
            } else {
                print("The notification was schduled")
            }
        }
        
    }
    
    func CancelNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}
