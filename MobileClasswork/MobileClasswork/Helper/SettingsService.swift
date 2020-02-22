//
//  SettingsService.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 2/16/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class SettingsService {
    static var isDarkMode: Bool = false
    static var mainColor: UIColor = kMAINCOLOR
    static var blackColor: UIColor { //get only property
        return isDarkMode ? kOFFWHITECOLOR : kOFFBLACKCOLOR
    }
    static var whiteColor: UIColor  {
        return isDarkMode ? kOFFBLACKCOLOR : kOFFWHITECOLOR
    }
///whites that will turn gray on dark mode
    static var grayColor: UIColor {
        return isDarkMode ? .lightGray : kOFFWHITECOLOR
    }
/// black that will turn gray on darkmode
    static var darkGrayColor: UIColor {
        return isDarkMode ? .lightGray : kOFFBLACKCOLOR
    }
    static func saveIsDarkMode() {
        UserDefaults.standard.set(isDarkMode, forKey: "isDarkMode")
        UserDefaults.standard.synchronize()
    }
}
