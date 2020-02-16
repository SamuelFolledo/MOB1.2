//
//  Category.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 2/11/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

enum BoxCategory: CaseIterable {
    case medication, ointment, supplies, specialBox
    
    var image: UIImage {
        switch self {
        case .medication:
            return kMEDICATIONSIMAGE
        case .ointment:
            return kOINTMENTSIMAGE
        case .supplies:
            return kSUPPLIESIMAGE
        case .specialBox:
            return kSPECIALBOXESIMAGE
        }
    }
}
