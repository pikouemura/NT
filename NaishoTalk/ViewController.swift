//
//  ViewController.swift
//  NaishoTalk
//
//  Created by 上村 宙生 on 2016/07/05.
//  Copyright © 2016年 sectalk. All rights reserved.
//

import UIKit
import SVProgressHUD
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var talkListAry: [TalkListData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "NozokiListCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "Cell")
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // フッターへ設定するビューを作成
        let uiLableFooter : UILabel = UILabel()
        uiLableFooter.frame = CGRectMake( 0 , 0 , 200 , 30 )
        uiLableFooter.text = "もっと見る"
        // フッターへビューを設定
        tableView.tableFooterView = uiLableFooter
        
        SVProgressHUD.show()
        
        getFirstView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print(talkListAry.count)
        return talkListAry.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        print("cellForRowAtIndexPath")
        
        // セルを取得してデータを設定する
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! NozokiListCell
        cell.talkListData = talkListAry[indexPath.row]
        
        // セル内のボタンのアクションをソースコードで設定する
//        cell.likeButton.addTarget(self, action:"handleButton:event:", forControlEvents:  UIControlEvents.TouchUpInside)
        
        // UILabelの行数が変わっている可能性があるので再描画させる
        cell.layoutIfNeeded()
        
        return cell
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        // Auto Layoutを使ってセルの高さを動的に変更する
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // セルをタップされたら何もせずに選択状態を解除する
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    func getFirstView()  {
        //first 0:通常1:初回
        //order 0:最新1:発言数
        let params =
            ["first":1,
             "order": 2,
             "offset": 3]
        Alamofire.request(.POST, "http://133.242.1.138/chiratalk/ios/firstview.php")
            .responseJSON { response in
                if let value = response.result.value {
                    SVProgressHUD.dismiss()
                    
                    let json = JSON(value)
                    
                    let count: Int = json.count
                    print(count)
                    
                    for index in 0..<count {
                        // タイトルの抜き出し
                        let talkListData = TalkListData(json:json[index])
                        self.talkListAry.append(talkListData)
                        
                    }
                    print(self.tableView)
                    self.tableView.reloadData()
                }else{
                    print("Error with response")
                }
        }
    }
    func goTutorial() {
        
    }


}

