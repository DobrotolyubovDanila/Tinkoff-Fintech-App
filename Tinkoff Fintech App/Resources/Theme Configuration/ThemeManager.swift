//
//  ThemeManager.swift
//  Tinkoff Fintech App
//
//  Created by Данила on 07.10.2020.
//  Copyright © 2020 Dobrotolyubov Danila. All rights reserved.
//

import UIKit

class ThemeManager {
    
    static var shared = ThemeManager()
    
    private let themeRepository = DefaultThemeRepository()
    var current: ThemeProtocol = ClassicTheme()
    
    private init() {
        current = themeRepository.load()
    }
    
    func apply(theme: ThemeProtocol) {
        themeRepository.save(theme)
        
        ThemeManager.shared.current = theme
    }
}
