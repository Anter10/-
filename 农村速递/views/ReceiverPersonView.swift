//
//  ReceiverPersonView.swift
//  农村速递
//
//  Created by 郭有超 on 2017/6/18.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit

class ReceiverPersonView: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem =  UIBarButtonItem(title: UserData.appshowtexts[5], style: UIBarButtonItemStyle.done, target: self, action:#selector(addPersonDatas))
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @objc func addPersonDatas(sender: UIBarButtonItem) {
        UserData.getUD().addPerson(name: "郭有超", phone1: "15010215839", phone2: "")
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
        return UserData.getUD().linkperson.count
    }
    
    func deleteRow(action: UITableViewRowAction, indexPath: IndexPath) -> Void{
        print("删除按钮",indexPath.section, indexPath.row)
        UserData.getUD().linkperson.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        
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
        let cell = UITableViewCell(style: UITableViewCellStyle.value2, reuseIdentifier: "Cell")
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.textLabel?.text = UserData.getUD().linkperson[indexPath.row].name
        cell.textLabel?.textAlignment = NSTextAlignment.left
        cell.textLabel?.font = UIFont(name: "Arial", size: 18)
        
        let detailLabel = UILabel(frame:  CGRect(x: -10, y: 10, width: UIScreen.main.bounds.width, height: cell.bounds.height))
        
        detailLabel.textAlignment = NSTextAlignment.right
        detailLabel.text  = UserData.getUD().linkperson[indexPath.row].phone1
        cell.addSubview(detailLabel)
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
