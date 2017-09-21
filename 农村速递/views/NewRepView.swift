//
//  NewRepView.swift
//  农村速递
//
//  Created by 郭有超 on 2017/8/12.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NewRepView: BaseTableViewController {
  
    var selecttabcell : UITableViewCell?
    var RepClassTable = UITableView()
    var RepClassMsgTable = UITableView()
    // 界面逻辑数据
    var sectionTitle: Array<String> = []
    var height = (FirstNavigationView().navigationBar.bounds.height + TabBarScene().tabBar.frame.height)
    var cellheight = 55
    var scroll = UIScrollView()
    var showdata: ShopThingClasss?
    var timer:Timer?
    var isAutoScrolling: Bool = true
    var currentIndex: Int = 1
    var curscrolltotal: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        let tframe = self.view.frame
        RepClassTable.tag = 10
        RepClassMsgTable.tag = 11
        self.tableView.tag = 9
        cellheight = Int((tframe.height - height) / 9.8)
        self.view.addSubview(RepClassTable)
        self.view.addSubview(RepClassMsgTable)
        self.tableView.isScrollEnabled = false
        self.tableView.backgroundColor = UIColor.groupTableViewBackground
        self.view.backgroundColor = UIColor.groupTableViewBackground
        // Do any additional setup after loading the view.
        
        print("dddsdsdstframetframed",tframe)
        RepClassTable.frame = CGRect(x: 1, y: 0, width: 80, height: tframe.height - height)
        
        RepClassMsgTable.frame = CGRect(x: 91, y:0, width:Paramters.ScreenSize.width - 91, height: tframe.height - height)
        RepClassTable.delegate = self
        RepClassMsgTable.delegate = self
        
        RepClassTable.dataSource  = self
        RepClassMsgTable.dataSource = self
        RepClassMsgTable.backgroundColor = UIColor.groupTableViewBackground
        RepClassTable.backgroundColor = UIColor.groupTableViewBackground
  
        RepClassMsgTable.tableFooterView = UIView()
        RepClassTable.tableFooterView    = UIView()
        RepClassTable.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        RepClassMsgTable.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
//
        // 默认请求101的数据
       
        self.getShopListData(showid: 101)
    }
    
    func flushHeaderView(){
        scroll = UIScrollView(frame: CGRect(x: 0, y: 0, width: Int(Paramters.ScreenSize.width - 91), height: cellheight * 2 - 10))
        scroll.backgroundColor = UIColor.lightGray
        scroll.flashScrollIndicators()
        scroll.contentSize = CGSize(width: CGFloat(Paramters.ScreenSize.width - 91) * CGFloat((showdata?.headerimagedata)!.count), height: CGFloat(cellheight * 2 - 10))
        
        
        scroll.delegate = self
        var index = 0.0
        for imagedata in (showdata?.headerimagedata)! {
            let newImage = UIImage(data: imagedata)
            let imageview = UIImageView(image: newImage)
            imageview.contentMode = UIViewContentMode.scaleAspectFit
            imageview.frame = CGRect(x: Int(CGFloat(index) * (Paramters.ScreenSize.width - 91.0)), y: 0, width: Int(Paramters.ScreenSize.width - 91), height: cellheight * 2 - 10)
            
            scroll.addSubview(imageview)
            index = index + 1
        }
        curscrolltotal = (showdata?.headerimagedata)!.count
        scroll.delegate = self
        
        scroll.isPagingEnabled = true
        addTimer()
        RepClassMsgTable.tableHeaderView = scroll
        
    }
    
    func getShopListData(showid: Int) {
        var per           = Parameters()
        per["uid"]        = UserData.getUD().personmsg.phone
        per["shoptypeid"] = showid
        print(per)
        Http.Post(url: Http.getshoplistdata, data: per, call: callback)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        if tableView.tag == 11{
            let view   = UIView(frame: CGRect(x: 0, y: 0, width: Int(Paramters.ScreenSize.width - 91), height: 40))
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: Int(Paramters.ScreenSize.width - 91), height: 35))
            label.font = UIFont(name: "Arial", size: 14)
            view.backgroundColor = UIColor.groupTableViewBackground
            view.addSubview(label)
            label.textAlignment = NSTextAlignment.center
            label.text = sectionTitle[section]
           
            return view
        }else{
             let view   = UIView(frame: CGRect(x: 0, y: 0, width:0, height: 0))
            return view
        }
        
        
    }
 
    
   func callback(data: JSON) -> Bool {
        sectionTitle = UserData.converJSONTOStringArray(jsonData: JSON(parseJSON:data[0]["sectiontitle"].stringValue))
         print("sectionTitle = ",sectionTitle.count)
    if  UserData.getUD().exitType(key:data[0]["id"].stringValue) == false{
        let headerviewmsg:Array<String> = UserData.converJSONTOStringArray(jsonData: data[0]["headerviewmsg"])
        let everyshoptype:Array<Array<Int>> = UserData.converJSONTOIntArray(jsonData: data[0]["everyshoptype"])
        let everyimage:Array<Array<String>> = UserData.converJSONTOStringArray(jsonData: data[0]["everyimage"])
        let everytitle:Array<Array<String>> = UserData.converJSONTOStringArray(jsonData: data[0]["everytitle"])
        let sectionids:Array<Array<Int>> = UserData.converJSONTOIntArray(jsonData: data[0]["sectionids"])
        let spdata = ShopThingClasss(id: data[0]["id"].stringValue, name: data[0]["name"].stringValue, headerviewmsg: headerviewmsg, everyshoptype: everyshoptype, sectiontitle: sectionTitle, everyimage: everyimage, everytitle: everytitle, sectionids: sectionids)
        
        UserData.getUD().addNewShopClasssData(key: spdata.id, shopclasssdata: spdata)
        showdata = spdata
    
    }else{
        showdata = UserData.getUD().getShopThingClasss(key: data[0]["id"].stringValue)
    }
        flushHeaderView()
        RepClassMsgTable.reloadData()
        let index = NSIndexPath(row: 0, section: 0)
        RepClassMsgTable.scrollToRow(at: index as IndexPath, at: UITableViewScrollPosition.none, animated: true)
        // 处理当前的数据逻辑
        return true
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView.tag == 10{
            return 0
        }
        return 35
    }
    
    func addTimer(){
        removeTimer()
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(NewRepView.cuttime(timer:)), userInfo: nil, repeats: true)
        
        self.isAutoScrolling = true
        
    }
    
    func removeTimer(){
        
        timer?.invalidate()
        timer = nil
        self.isAutoScrolling = false
        
    }
    @objc func cuttime(timer: Timer) {
        // 计时开始时，逐秒减少remainingSeconds的值
      
        self.scroll.setContentOffset(CGPoint(x:  CGFloat(self.currentIndex) * Paramters.ScreenSize.width - 91, y: 0), animated:true)
        self.currentIndex = self.currentIndex + 1
        if self.currentIndex >= curscrolltotal {
            self.currentIndex = curscrolltotal
        }
    }
    func nextPage(){
        
       
        
    }
    let SCROLL_WIDTH = UIScreen.main.bounds.width
    let SCROLL_HEIGHT = UIScreen.main.bounds.height
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        if scroll.contentOffset.x == 0 {
//            //就变到倒数第二张的位置上
//            (SCROLL_HEIGHT,
//         scroll.scrollRectToVisible(CGRect(x: 0, y: 0, width: scroll.contentSize.width - 2 * SCROLL_WIDTH,0,SCROLL_WIDTH, height: cellheight), animated: false)
//            //如果图片是倒数第一张的位置
//        } else if scroll.contentOffset.x == scroll.contentSize.width - SCROLL_WIDTH {
//            //就变到第二张的位置
//            scroll.scrollRectToVisible(CGRect(SCROLL_WIDTH, 0, SCROLL_WIDTH, SCROLL_HEIGHT), animated: false)
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView.tag == 10 {
           return CGFloat(cellheight)
        }else if tableView.tag == 11{
           return CGFloat(cellheight * 4)
        }
        return 0
    }
    
   override func numberOfSections(in tableView: UITableView) -> Int {
        if tableView.tag == 10{
            return 1
        }else if tableView.tag == 11{
            return sectionTitle.count
        }
        return 0//sectionTitle.count
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if tableView.tag == 10{
            return 0
        }
        print("ddsdsd")
        return 0
    }
    
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 10{
            return UserData.newrepids.count
        }else if tableView.tag == 11{
             return 1
        }
         return 0
    }
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scroll.flashScrollIndicators()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if tableView.tag == 10{
            var label = UILabel(frame: CGRect(x: 0, y: 10, width: 80, height: 40))
            label.tag = 32
            
            label.text = UserData.newreptexts[indexPath.row]
            
            label.textAlignment = NSTextAlignment.center
            cell.addSubview(label)
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            if indexPath.row == 0 && selecttabcell == nil {
                cell.isSelected = true
                selecttabcell = cell
                label.textColor = UIColor.red
                selecttabcell?.backgroundColor = UIColor.groupTableViewBackground
            }
        }else if tableView.tag == 11{
            print("ddsssss")
            cell.backgroundColor = UIColor.groupTableViewBackground
            if indexPath.row == 0{
               
               
            }
//            cell.selectionStyle = UITableViewCellSelectionStyle.none
//            let vi = ShopIndexView()
//            vi.frame = CGRect(x: 0, y: 0, width: 100, height: 110)
//            cell.addSubview(vi)
        }
        cell.selectionStyle =  UITableViewCellSelectionStyle.none
        return cell
    }
    
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.tag == 10{
            if selecttabcell != nil{
                selecttabcell?.backgroundColor = UIColor.white
                 let label = selecttabcell?.viewWithTag(32) as! UILabel
                label.textColor = UIColor.black
            }
            
            self.getShopListData(showid: UserData.newrepids[indexPath.row])
            selecttabcell = tableView.cellForRow(at: indexPath)
            selecttabcell?.backgroundColor = UIColor.groupTableViewBackground
            let label = selecttabcell?.viewWithTag(32) as! UILabel
            label.textColor = UIColor.red
            tableView.scrollToRow(at: indexPath, at: UITableViewScrollPosition.middle, animated: true)
        }
    }
 

}
