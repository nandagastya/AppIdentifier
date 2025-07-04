//
//  MobileAppsViewModel.swift
//  AppIdentifier
//
//  Created by Agastya Nand on 03/07/25.
//

import Foundation
import SwiftUI

class MobileAppsViewModel: ObservableObject {
    @Published var mobileApps: [AppInfo] = []
    
    init() {
        checkApps()
    }
    
    func checkApps() {
        var predefinedApps: [AppInfo] = [
            .init(name: "WhatsApp", scheme: "whatsapp://", category: "Social", iconURL: "https://upload.wikimedia.org/wikipedia/commons/1/13/WhatsApp.png"),
            
            .init(name: "Instagram", scheme: "instagram://", category: "Social", iconURL: "https://upload.wikimedia.org/wikipedia/commons/a/a3/Instagram_anooshe.png"),
            
            .init(name: "Facebook", scheme: "fb://", category: "Social", iconURL: "https://upload.wikimedia.org/wikipedia/commons/0/05/Facebook_Logo_%282019%29.png"),
            
            .init(name: "Snapchat", scheme: "snapchat://", category: "Social", iconURL: "https://upload.wikimedia.org/wikipedia/commons/d/d1/Red-ghost-transparent.png"),
            
            .init(name: "Twitter", scheme: "twitter://", category: "Social", iconURL: "https://upload.wikimedia.org/wikipedia/commons/7/79/Pictofigo-Twitter-icon.png"),
            
            .init(name: "Telegram", scheme: "tg://", category: "Messaging", iconURL: "https://upload.wikimedia.org/wikipedia/commons/f/fd/Telegram_blue_icon.png"),
            
            .init(name: "Zoom", scheme: "zoomus://", category: "Productivity", iconURL: "https://upload.wikimedia.org/wikipedia/commons/2/24/Zoom-Logo.png"),
            
            .init(name: "YouTube", scheme: "youtube://", category: "Entertainment", iconURL: "https://upload.wikimedia.org/wikipedia/commons/4/4a/Youtube-.png"),
            
            .init(name: "Spotify", scheme: "spotify://", category: "Music", iconURL: "https://upload.wikimedia.org/wikipedia/commons/7/78/Spotify_2.png"),
            
            .init(name: "Google Maps", scheme: "comgooglemaps://", category: "Navigation", iconURL: "https://upload.wikimedia.org/wikipedia/commons/a/ac/Google_Maps_Pin_Wall_Sculpture_01.png"),
            
            .init(name: "Gmail", scheme: "googlegmail://", category: "Productivity", iconURL: "https://upload.wikimedia.org/wikipedia/commons/6/6d/Gmail-highres_2.png"),
            
            .init(name: "LinkedIn", scheme: "linkedin://", category: "Professional", iconURL: "https://upload.wikimedia.org/wikipedia/commons/7/7e/LinkedIn_PNG16.png"),
            
            .init(name: "Pinterest", scheme: "pinterest://", category: "Social", iconURL: "https://upload.wikimedia.org/wikipedia/commons/0/08/Pinterest-logo.png"),
            
            .init(name: "Reddit", scheme: "reddit://", category: "Social", iconURL: "https://upload.wikimedia.org/wikipedia/commons/b/b5/Reddit_logo.png"),
            
            .init(name: "Amazon", scheme: "amazon://", category: "Shopping", iconURL: "https://upload.wikimedia.org/wikipedia/commons/2/27/Amazon_Prime_logo.png"),
            
            .init(name: "Flipkart", scheme: "flipkart://", category: "Shopping", iconURL: "https://upload.wikimedia.org/wikipedia/commons/6/69/Flipkart_Logo_as_of_2025.png"),
            
            .init(name: "Netflix", scheme: "nflx://", category: "Entertainment", iconURL: "https://upload.wikimedia.org/wikipedia/commons/1/1e/Netflix_logogo.png"),
                        
            .init(name: "Paytm", scheme: "paytm://", category: "Finance", iconURL: "https://upload.wikimedia.org/wikipedia/commons/5/5c/Paytm_Logo.png"),
                       
            .init(name: "PhonePe", scheme: "phonepe://", category: "Finance", iconURL: "https://upload.wikimedia.org/wikipedia/commons/c/cc/Simsv.png"),
                        
            .init(name: "Swiggy", scheme: "swiggy://", category: "Food", iconURL: "https://upload.wikimedia.org/wikipedia/commons/1/13/Swiggy_logo.png"),
                        
            .init(name: "Zomato", scheme: "zomato://", category: "Food", iconURL: "https://upload.wikimedia.org/wikipedia/commons/7/75/Zomato_logo.png"),
                       
            .init(name: "Uber", scheme: "uber://", category: "Travel", iconURL: "https://upload.wikimedia.org/wikipedia/commons/c/cc/Uber_logo_2018.png"),
                       
            .init(name: "Ola", scheme: "olacabs://", category: "Travel", iconURL: "https://upload.wikimedia.org/wikipedia/commons/b/b5/Ol%C3%A1%21_logo.png"),
        ]
        
        for i in 0..<predefinedApps.count {
            guard let url = URL(string: predefinedApps[i].scheme) else {return}
            if UIApplication.shared.canOpenURL(url){
                predefinedApps[i].isPresent = true
            }
            else {
                predefinedApps[i].isPresent = false
            }
        }
        
        for app in predefinedApps {
            if app.isPresent {
                mobileApps.append(app)
            }
        }
        mobileApps = predefinedApps
    }
}


