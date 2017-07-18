//
//  ShowAllOrderDetailView.swift
//  农村速递
//
//  Created by 郭有超 on 2017/7/17.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ShowAllOrderDetailView: BaseTableViewController {
    
    var ordertype = 0
    var orders: Array<OrderData> = []
    var backinfo = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        if ordertype == 2 {
            self.navigationItem.rightBarButtonItem =  UIBarButtonItem(title: "晴空订单", style: UIBarButtonItemStyle.done, target: self, action:#selector(clearOrder))
        }
        getOrders()
    }
    
    @objc func clearOrder(sender: UIBarButtonItem) {
        var per = Parameters()
        per["mainid"]    = UserData.getUD().personmsg.phone
        per["statue"]    = ordertype
        
        Http.Post(url: Http.clearorderbyorderaction, data: per, call: clearcallback)
    }
    
    func clearcallback(data: JSON) -> Bool {
        if data == nil{
           orders = []
           self.tableView.reloadData()
        }
       
        return true
    }
    
    func callback(data: JSON) -> Bool {
        for (_,subJson):(String, JSON) in JSON(parseJSON:data.rawString()!) {
            let order = OrderData(id: subJson["id"].stringValue, receive_person_id: subJson["receive_person_id"].stringValue, receive_where_id: subJson["receive_where_id"].stringValue, send_person_id: subJson["send_person_id"].stringValue, send_person_where: subJson["send_person_where"].stringValue, item_type: subJson["item_type"].stringValue, item_real_price: subJson["item_real_price"].stringValue, item_prot_price: subJson["item_prot_price"].stringValue, get_time: subJson["item_prot_price"].stringValue, express_price: subJson["express_price"].stringValue, orderpeoid: subJson["orderpeoid"].stringValue, orderstatue: subJson["orderstatue"].stringValue, reveivepersonname: subJson["reveivepersonname"].stringValue, receivepersonwhere: subJson["receivepersonwhere"].stringValue, receivepersonphone: subJson["receivepersonphone"].stringValue, receivepersonphone2: subJson["receivepersonphone2"].stringValue, express_move_path_id: subJson["express_move_path_id"].stringValue, curmovepeople: subJson["curmovepeople"].stringValue, movepeoplehistory: subJson["movepeoplehistory"].stringValue)
             orders.append(order)
        }
        self.tableView.reloadData()
        return true
    }
  
    func getOrders() -> Void {
        var per = Parameters()
        per["mainid"]    = UserData.getUD().personmsg.phone
        per["orderType"] = ordertype
        Http.Post(url: Http.selecttypeorderaction, data: per, call: callback)
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
        return orders.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
       
        cell.textLabel?.text = orders[indexPath.row].idMsg()
        cell.detailTextLabel?.text = orders[indexPath.row].rnMsg()
        cell.detailTextLabel?.textAlignment = NSTextAlignment.right
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let showview = SelectItemsView()
        showview.orderid = orders[indexPath.row].id
        
        self.navigationItem.backBarButtonItem  = UIBarButtonItem(title: backinfo, style: UIBarButtonItemStyle.plain, target: self, action: nil)
        self.navigationController?.pushViewController(showview, animated: true)
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
