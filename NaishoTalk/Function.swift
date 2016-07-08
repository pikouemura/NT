//
//  Function.swift
//  NaishoTalk
//
//  Created by 上村 宙生 on 2016/07/08.
//  Copyright © 2016年 sectalk. All rights reserved.
//

import Foundation

class Function {
    
    
    static func getLogin(_time:Int) -> String {
        let unixtime:Int = Int(NSDate().timeIntervalSince1970)
        let time:Int = unixtime - _time
        var _return:String = ""
        if(time < 120) {
            _return = "1分前"
        }
        if(time < 360) {
            _return = "3分前";
        }
        else if(time < 1200) {
            _return = "5分前";
        }
        else if(time < 2400) {
            _return = "10分前";
        }
        else if(time < 3600) {
            _return = "30分前";
        }
        else if(time < 7200) {
            _return = "1時間前";
        }
        else if(time < 14400) {
            _return = "2時間前";
        }
        else if(time < 43200) {
            _return = "6時間前";
        }
        else if(time < 86400) {
            _return = "12時間前";
        }
        else if(time < 172800) {
            _return = "1日前";
        }
        else if(time < 520000) {
            _return = "3日前";
        }
        else if(time < 150000) {
            _return = "1週間前";
        }
        else {
            _return = "1週間以上";
        }
        return _return
    }
    
    
    private init() {
    }
}