//
//  PersonMessageView.swift
//  农村速递
//
//  Created by 郭有超 on 2017/6/18.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit

class PersonMessageView: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("dddd")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 1300
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
         print("你好")
        self.tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        print(UserData.getUD().personmsg.msg.count)
        return UserData.getUD().personmsg.msg.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return UserData.getUD().personmsg.msg[section].count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }else{
            return 10
        }
        
        
    }
    
   override  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 60
    }
    
     
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.textLabel?.text = UserData.getUD().personmsg.keys[indexPath.section][indexPath.row]
        cell.textLabel?.textAlignment = NSTextAlignment.left
        cell.textLabel?.font = UIFont(name: "Arial", size: 18)
        
        let detailLabel = UILabel(frame:  CGRect(x: UIScreen.main.bounds.width / 2 - 10, y: 10, width: UIScreen.main.bounds.width / 2, height: cell.bounds.height))
        detailLabel.numberOfLines = 0
        detailLabel.isUserInteractionEnabled = true
        cell.tag = UserData.getUD().personmsg.tags[indexPath.section][indexPath.row]
        detailLabel.textAlignment = NSTextAlignment.right
        detailLabel.text  = UserData.getUD().personmsg.msg[indexPath.section][indexPath.row]
        cell.addSubview(detailLabel)
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let showview = ChangePersonMessageView()
        showview.title = UserData.getUD().personmsg.keys[indexPath.section][indexPath.row]
        showview.changetag = UserData.getUD().personmsg.tags[indexPath.section][indexPath.row]
        showview.curchangevalue =  UserData.getUD().personmsg.msg[indexPath.section][indexPath.row]
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
