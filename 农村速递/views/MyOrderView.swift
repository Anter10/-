//
//  MyOrderView.swift
//  农村速递
//
//  Created by 郭有超 on 2017/6/18.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit

class MyOrderView: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return  UserData.ordershows.count
    }

    
    func deleteRow(action: UITableViewRowAction, indexPath: IndexPath) -> Void{
        print("删除按钮",indexPath.section, indexPath.row)
        UserData.getUD().orderdatas.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        
    }
    
    func editRow(action: UITableViewRowAction, indexPath: IndexPath) -> Void{
        print("设置按钮",indexPath.section, indexPath.row)
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let showview = ShowAllOrderDetailView()
        var showtype = 0
        
        if tableView.cellForRow(at: indexPath)?.tag == 101{
           showtype = 0
        }else if tableView.cellForRow(at: indexPath)?.tag == 102{
           showtype = 1
        }else if tableView.cellForRow(at: indexPath)?.tag == 103{
           showtype = 2
        }
//        self.navigationItem.backBarButtonItem  =  UIBarButtonItem(title: String(UserData.ordershows[indexPath.row]), style: UIBarButtonItemStyle.plain, target: self, action: nil)
        showview.ordertype = showtype
        showview.title     = String(UserData.ordershows[indexPath.row])
        showview.backinfo  = String(UserData.ordershows[indexPath.row])
        self.navigationController?.pushViewController(showview, animated: true)
    }
    
    
    
//    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let deleteRowAction:UITableViewRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "删除", handler: deleteRow)
//        deleteRowAction.backgroundColor = UIColor.darkGray
//        let editRowAction:UITableViewRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "编辑", handler: editRow)
//        editRowAction.backgroundColor = UIColor.gray
//        return [deleteRowAction, editRowAction];
//    }
//    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.textLabel?.text = String(UserData.ordershows[indexPath.row])
        cell.textLabel?.textAlignment = NSTextAlignment.left
        cell.textLabel?.font = UIFont(name: "Arial", size: 18)
        cell.tag = UserData.ordershowids[indexPath.row]
        print("orderid = ",UserData.ordershowids[indexPath.row])
//        let detailLabel = UILabel(frame:  CGRect(x: -10, y: 10, width: UIScreen.main.bounds.width, height: cell.bounds.height))
//
//        detailLabel.textAlignment = NSTextAlignment.right
//        detailLabel.text  = UserData.getUD().linkperson[indexPath.row].phone1
//        cell.addSubview(detailLabel)
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
