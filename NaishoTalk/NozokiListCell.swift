//
//  nozokiListCell.swift
//  NaishoTalk
//
//  Created by 上村 宙生 on 2016/07/07.
//  Copyright © 2016年 sectalk. All rights reserved.
//

import UIKit
import AlamofireImage

class NozokiListCell: UITableViewCell {
    @IBOutlet weak var msgNumLabel: UILabel!
    @IBOutlet weak var manSayingLabel: UILabel!
    @IBOutlet weak var womanSayingLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var womanImageView: UIImageView!
    @IBOutlet weak var manImageView: UIImageView!
    
    var talkListData: TalkListData!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    // 表示されるときに呼ばれるメソッドをオーバーライドしてデータをUIに反映する
    override func layoutSubviews() {
        print(talkListData.msgTime)
        msgNumLabel.text = talkListData.msgNum!+"メッセージ"
        manSayingLabel.text = "♂ " + talkListData.manSaying!
        womanSayingLabel.text = "♀ " + talkListData.womanSaying!
        timeLabel.text = talkListData.msgTime
        
        let womanImg = NSURL(string: talkListData.womanImg!)!
        womanImageView!.af_setImageWithURL(
            womanImg,
            placeholderImage: UIImage(named: "noimage")
        )
        
        let manImg = NSURL(string: talkListData.manImg!)!
        manImageView!.af_setImageWithURL(
            manImg,
            placeholderImage: UIImage(named: "noimage")
        )
        
        super.layoutSubviews()
    }

    
}
