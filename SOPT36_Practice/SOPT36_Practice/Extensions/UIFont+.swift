//
//  UIFont+.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 4/9/25.
//

import UIKit

enum FontName: String {
    case pretendardBold = "Pretendard-Bold"
    case pretendardMedium = "Pretendard-Medium"
    case pretendaradRegular = "Pretendard-Regular"
}

extension UIFont {
    static func font(_ style: FontName, ofSize size: CGFloat) -> UIFont {
            guard let customFont = UIFont(name: style.rawValue, size: size) else {
                return UIFont.systemFont(ofSize: size)
            }
            return customFont
        }
        
        @nonobjc class var regular: UIFont {
            return UIFont.font(.pretendaradRegular, ofSize: 14)
        }
        
        @nonobjc class var bold: UIFont {
            return UIFont.font(.pretendardBold, ofSize: 20)
        }
    
    
        @nonobjc class var medium: UIFont {
            return UIFont.font(.pretendardMedium, ofSize: 16)
        }
}
