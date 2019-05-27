//
//  Utils.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import UIKit

class Utils: NSObject {

    static func formatToCurrency(value: Double?) -> String {
        
        guard let valueU = value else { return "0,00" }
        let number: NSNumber = NSNumber(value: valueU)
        
        let formater = NumberFormatter()
        formater.groupingSeparator = "."
        formater.decimalSeparator = ","
        formater.numberStyle = .decimal
        formater.minimumFractionDigits = 2
        formater.maximumFractionDigits = 2
        
        guard let formattedValue = formater.string(from: number) else { return "0,00" }
        return formattedValue
        
    }
}
