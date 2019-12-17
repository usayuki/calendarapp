//
//  CalendarCell.swift
//  calendarapp
//
//  Created by アプリ開発 on 2019/10/18.
//  Copyright © 2019 Masato.achiwa. All rights reserved.
//

import UIKit

class CalendarCell: UICollectionViewCell {
    
        
        var textLabel : UILabel!
        
        required init?(coder aDecoder: NSCoder) {
                super.init(coder:aDecoder)!
                
                //UILabelを生成
                textLabel = UILabel(frame: CGRect(x:0, y:0, width:self.frame.width,  height: self.frame.height))
                textLabel.font = UIFont(name: "HiraKakuProN-W3", size: 12)
                textLabel.textAlignment = NSTextAlignment.center
                
                // Cellに追加
                self.addSubview(textLabel!)
        }















}

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        

