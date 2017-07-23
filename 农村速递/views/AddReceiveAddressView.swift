//
//  AddReceiveAddressView.swift
//  农村速递
//
//  Created by 郭有超 on 2017/7/8.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AddReceiveAddressView: BaseTableViewController {
    var cells : Array<FieldTableViewCell> = []
    var editmsg : ReceiveAddressData? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "添加收件地址"
        if editmsg != nil{
           self.title = "更新地址信息"
        }
        self.navigationItem.rightBarButtonItem =  UIBarButtonItem(title: UserData.appshowtexts[4], style: UIBarButtonItemStyle.done, target: self, action:#selector(addReceiveDatas))
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func callback(data: JSON) -> Bool {
        UserData.getUD().receiveaddress.clearReceiveAddress()
        for (_,subJson):(String, JSON) in JSON(parseJSON:data.rawString()!) {
            let data = ReceiveAddressData(id: subJson["id"].stringValue, mailid: subJson["mailid"].stringValue, mainid: subJson["mainid"].stringValue, province: subJson["province"].stringValue, city: subJson["city"].stringValue, controy: subJson["controy"].stringValue, detail: subJson["detail"].stringValue, addtime: subJson["addtime"].stringValue)
            UserData.getUD().receiveaddress.addAddress(address: data)
        }
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:UserData.appshowtexts[16], style: UIBarButtonItemStyle.plain, target: self, action: nil)
        self.navigationController?.popViewController(animated: true)
        return true
    }
    @objc func addReceiveDatas(sender: UIBarButtonItem) {
        var per = Parameters()
        per["mainid"]     = UserData.getUD().personmsg.phone
       
        per["province"]   = cells[0].textfield.text as! String
        per["city"]       = cells[1].textfield.text as! String
        per["controy"]    = cells[2].textfield.text as! String
        per["detail"]     = cells[3].textfield.text as! String
        per["mailid"]     = cells[4].textfield.text as! String
        Http.Post(url: Http.addreceiveaddress, data: per, call: callback)
        print(per)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return UserData.addreceiveaddressshows.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FieldTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.placeholder =  String(UserData.addreceiveaddressshows[indexPath.row])
        cell.flushShow()
        if editmsg != nil{
           cell.textfield.text = editmsg?.getEditData()[indexPath.row]
        }
        cell.showid = UserData.addreceiveaddresssshowids[indexPath.row]
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.textLabel?.text = String(UserData.addreceiveaddressshows[indexPath.row])
        cell.textLabel?.textAlignment = NSTextAlignment.left
        cell.textLabel?.font = UIFont(name: "Arial", size: 18)
        cells.append(cell)
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

