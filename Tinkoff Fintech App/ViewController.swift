//
//  ViewController.swift
//  Tinkoff Fintech App
//
//  Created by Данила on 10.09.2020.
//  Copyright © 2020 Dobrotolyubov Danila. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let callBy = #function
        printFuncVC(controller: "FirstVC", callByFunc: callBy)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let callBy = #function
        printFuncVC(controller: "FirstVC", callByFunc: callBy)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        let callBy = #function
        printFuncVC(controller: "FirstVC", callByFunc: callBy)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let callBy = #function
        printFuncVC(controller: "FirstVC", callByFunc: callBy)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let callBy = #function
        printFuncVC(controller: "FirstVC", callByFunc: callBy)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        let callBy = #function
        printFuncVC(controller: "FirstVC", callByFunc: callBy)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        let callBy = #function
        printFuncVC(controller: "FirstVC", callByFunc: callBy)
    }
    
}

