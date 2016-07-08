//
//  talkListData.swift
//  NaishoTalk
//
//  Created by 上村 宙生 on 2016/07/07.
//  Copyright © 2016年 sectalk. All rights reserved.
//

import UIKit
import SwiftyJSON

class TalkListData: NSObject {
    var talkId: String?
    var manID: String?
    var womanID: String?
    var manImg: String?
    var womanImg: String?
    var manSaying: String?
    var womanSaying: String?
    var msgNum: String?
    var msgTime: String?
    var ad: String?
    
    init(json:JSON) {
        let time:String = Function.getLogin(json["msg_recent_time"].intValue)
        talkId = json["id"].string
        manID = json["man_id"].string
        womanID = json["woman_id"].string
        manImg = json["man_path"].string
        womanImg = json["woman_path"].string
        manSaying = json["man_saying"].string
        womanSaying = json["woman_saying"].string
        msgNum = json["msg_num"].string
        msgTime = time
        ad = json["ad"].string
    }
}