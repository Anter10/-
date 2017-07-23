//
//  AddReceivePersonView.swift
//  农村速递
//
//  Created by 郭有超 on 2017/7/8.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AddReceivePersonView: BaseTableViewController {
    var cells : Array<FieldTableViewCell> = []
    var editrp   : ReceivePerson?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "添加收件人"
        if editrp != nil{
            self.title = "更新地址信息"
        }
        self.navigationItem.rightBarButtonItem =  UIBarButtonItem(title: UserData.appshowtexts[4], style: UIBarButtonItemStyle.done, target: self, action:#selector(addReceiveDatas))
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func callback(data: JSON) -> Bool {
        UserData.getUD().clearReceivePerson()
        for (_,subJson):(String, JSON) in JSON(parseJSON:data.rawString()!) {
            UserData.getUD().addPerson(name: subJson["name"].stringValue, phone1: subJson["phone1"].stringValue, phone2: subJson["phone2"].stringValue, id: subJson["id"].stringValue, mainid: subJson["uid"].stringValue)
        }
        self.navigationController?.popViewController(animated: true)
        return true
    }
    @objc func addReceiveDatas(sender: UIBarButtonItem) {
       var per = Parameters()
       per["mainid"]    = UserData.getUD().personmsg.phone
       per["name"]   = cells[0].textfield.text as! String
       per["phone1"] = cells[1].textfield.text as! String
       per["phone2"] = cells[2].textfield.text as! String
      if (editrp != nil){
           per["id"]    = editrp?.id
            Http.Post(url: Http.updatereceivepersonaction, data: per, call: callback)
      }
      if (editrp == nil)  {
            Http.Post(url: Http.addreceiveperson, data: per, call: self.callback)
        }
        
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
        return UserData.addreceiveshows.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FieldTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.placeholder =  String(UserData.addreceiveshows[indexPath.row])
        cell.flushShow()
        if editrp != nil{
           cell.textfield.text = editrp?.getEditData()[indexPath.row]
        }
        cell.showid = UserData.addreceiveshowids[indexPath.row]
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.textLabel?.text = String(UserData.addreceiveshows[indexPath.row])
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
