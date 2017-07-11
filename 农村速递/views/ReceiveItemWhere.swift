//
//  ReceiveItemWhere.swift
//  农村速递
//
//  Created by 郭有超 on 2017/6/18.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ReceiveItemWhere: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem =  UIBarButtonItem(title: UserData.appshowtexts[5], style: UIBarButtonItemStyle.done, target: self, action:#selector(addReceiveDatas))
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        getallData()
    }
    
    func getallData(){
        var para = Parameters()
        para["mainid"] = UserData.getUD().personmsg.phone
        para["tbid"]   = "104"
        Http.Post(url: Http.sendalldataaction, data: para, call: callback)
    }
    
    func callback(data: JSON)-> Bool{
        UserData.getUD().receiveaddress.clearReceiveAddress()
        for (_,subJson):(String, JSON) in JSON(parseJSON:data.rawString()!) {
            let data = ReceiveAddressData(id: subJson["id"].stringValue, mailid: subJson["mailid"].stringValue, mainid: subJson["mainid"].stringValue, province: subJson["province"].stringValue, city: subJson["city"].stringValue, controy: subJson["controy"].stringValue, detail: subJson["detail"].stringValue, addtime: subJson["addtime"].stringValue)
            UserData.getUD().receiveaddress.addAddress(address: data)
        }
        self.tableView.reloadData()
        return true
    }
    @objc func addReceiveDatas(sender: UIBarButtonItem) {
//        UserData.getUD().receiveaddress.addAddress(address: "什么时间啊")
//        self.tableView.reloadData()
         self.navigationController?.pushViewController(AddReceiveAddressView(), animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
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
        print("地址数量= ",UserData.getUD().receiveaddress.addresss.count)
        return UserData.getUD().receiveaddress.addresss.count
    }
    
    func deletecallback(data: JSON)-> Bool{
        print("datadatadatadata = ",data)
//        UserData.getUD().receiveaddress.removeIndex(index: indexPath.row)
//        self.tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
//
        getallData()
        return true
    }
    
    
    func deleteRow(action: UITableViewRowAction, indexPath: IndexPath) -> Void{
        
        var para = Parameters()
        para["mainid"] = UserData.getUD().personmsg.phone
        para["tbid"]   = "104"
        para["id"]     = UserData.getUD().receiveaddress.addresss[indexPath.row].id
        
        Http.Post(url: Http.deleteactionaction, data: para, call: deletecallback)
        
    }
    
    func editRow(action: UITableViewRowAction, indexPath: IndexPath) -> Void{
        print("设置按钮",indexPath.section, indexPath.row)
        
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteRowAction:UITableViewRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "删除", handler: deleteRow)
        deleteRowAction.backgroundColor = UIColor.darkGray
        let editRowAction:UITableViewRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "编辑", handler: editRow)
        editRowAction.backgroundColor = UIColor.gray
        return [deleteRowAction, editRowAction];
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        if indexPath.row == UserData.getUD().receiveaddress.addresss.count{
            
        }else{
           cell.textLabel?.text = UserData.getUD().receiveaddress.addresss[indexPath.row].toString()
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
         return UITableViewCellEditingStyle.delete
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
       return true
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
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
