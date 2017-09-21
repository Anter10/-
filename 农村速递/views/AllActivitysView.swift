//
//  AllActivitysView.swift
//  农村速递
//
//  Created by 郭有超 on 2017/7/8.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AllActivitysView: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        let cellXIB = UINib.init(nibName: "NotifyCell", bundle: Bundle.main)
        self.tableView.register(cellXIB, forCellReuseIdentifier: "NotifyCell")
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        var para = Parameters()
      
        Http.Post(url: Http.getnotifyaction, data: para, call: callback)
    }
    
    func callback(data: JSON)-> Bool{
        UserData.clearNotifyDatas()
        for (_,subJson):(String, JSON) in JSON(parseJSON:data.rawString()!) {
            let notify = NotifyData(_id: subJson["id"].stringValue, _title: subJson["title"].stringValue, _showimage: subJson["showimage"].stringValue, _showmessage: subJson["showmessage"].stringValue, _notifytime: subJson["notifytime"].stringValue)
            UserData.NotifyDatas.append(notify)
        }
          print("通知数据= ",data)
        self.tableView.reloadData()
        return true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return UserData.NotifyDatas.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }
        return 2
    }
   
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 281
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotifyCell", for: indexPath) as! NotifyCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        cell.title.text = UserData.NotifyDatas[indexPath.section].tilte
        cell.notifytime.text = UserData.NotifyDatas[indexPath.section].notifytime
        cell.showmessage.text = UserData.NotifyDatas[indexPath.section].showmessage
        cell.loadTexture(imagedata: UserData.NotifyDatas[indexPath.section].pngdatas!)
        // Configure the cell...

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
