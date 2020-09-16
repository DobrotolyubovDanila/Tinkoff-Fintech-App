//
//  AppDelegate.swift
//  Tinkoff Fintech App
//
//  Created by Данила on 10.09.2020.
//  Copyright © 2020 Dobrotolyubov Danila. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let callBy = #function
        printApplicationState(from: "Not running", to: "Foreground", callByFunc: callBy)
        
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        let callBy = #function
        printApplicationState(from: "Inactive", to: "Active", callByFunc: callBy)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        let callBy = #function
        printApplicationState(from: "Active", to: "Inactive", callByFunc: callBy)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        let callBy = #function
        printApplicationState(from: "Background", to: "Foreground", callByFunc: callBy)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        let callBy = #function
        printApplicationState(from: "Inactive", to: "Background", callByFunc: callBy)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        let callBy = #function
        printApplicationState(from: "Suspended", to: "Not running", callByFunc: callBy)
    }
    
    
    
}

