//
//  LifeTableView.swift
//  农村速递
//
//  Created by 郭有超 on 2017/7/23.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit

class LifeTableView: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = UserData.appshowtexts[17]
        print("ddddsadasd")
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
        return UserData.getUD().LifeBaseShowIds.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return UserData.getUD().LifeBaseShowIds[section].count
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section < UserData.getUD().LifeBaseShowIds[section].count - 1{
            return 10
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text =  UserData.getUD().LifeBaseShowDics[indexPath.section][indexPath.row]
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        // Configure the cell...
        cell.tag = UserData.getUD().LifeBaseShowIds[indexPath.section][indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(tableView.cellForRow(at: indexPath)?.tag == 103){
           let nav = ServerTableView()
            nav.title = UserData.getUD().LifeBaseShowDics[indexPath.section][indexPath.row]
           self.navigationController?.pushViewController(nav, animated: true)
        }else if(tableView.cellForRow(at: indexPath)?.tag == 101){
           let nav = NewRepView()
            nav.title = UserData.getUD().LifeBaseShowDics[indexPath.section][indexPath.row]; self.navigationController?.pushViewController(nav, animated: true)
        }else if(tableView.cellForRow(at: indexPath)?.tag == 102){
            let nav = BuyCardView()
            nav.title = UserData.getUD().LifeBaseShowDics[indexPath.section][indexPath.row]; self.navigationController?.pushViewController(nav, animated: true)
            
            
        }
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
