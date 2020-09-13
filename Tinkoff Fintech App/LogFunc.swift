//
//  LogFunc.swift
//  Tinkoff Fintech App
//
//  Created by Данила on 13.09.2020.
//  Copyright © 2020 Dobrotolyubov Danila. All rights reserved.
//

import Foundation

var printLogsIndicator = true // Переведите в состояние false, если требуется отключить логи.

func printLogs(from status1: String, to status2: String, callByFunc: String) {
    if printLogsIndicator {
        print("Application moved from \(status1) to \(status2): \(callByFunc)")
    }
}

