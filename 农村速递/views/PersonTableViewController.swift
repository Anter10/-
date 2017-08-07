//
//  PersonTableViewController.swift
//  农村速递
//
//  Created by 郭有超 on 2017/6/18.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
class PersonTableViewController: BaseTableViewController {
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = UserData.appshowtexts[1]
        let filemanager = FileManager.default
         
         UserData.removeFile(filename: "dictionary.plist")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func call(data: String) -> Bool {
        print("得到的数据 = ",JSON(data))
        return true
    }
    
    // 添加登陆提示框
    func showLoginView(){
        let alertController : UIAlertController = UIAlertController(title: "登陆", message: "使用手机验证码登录", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addTextField {
            (textField: UITextField!) -> Void in
            textField.frame = CGRect(x: 0, y: 0, width: textField.frame.width, height: 60)
            textField.placeholder = "手机号码"
        }
        
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "好的", style: .default, handler: {
            action in
            var pp = Parameters()
         
        })
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return UserData.showdics.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       return UserData.showdics[section].count
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if(section == UserData.showdics.count - 1){
            return 0
        }
        return 10
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let footheight:CGFloat = CGFloat(UserData.showdics.count * 10)
        return (UIScreen.main.bounds.height - footheight - FirstNavigationView().navigationBar.bounds.height) / 10
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        // Configure the cell...
        let showid : Int     = UserData.showids[indexPath.section][indexPath.row]
        cell.textLabel?.text = UserData.showdics[indexPath.section][indexPath.row]
        cell.tag = showid
        if cell.tag == 103{
            let creditlabel = UILabel(frame:CGRect(x: -10, y: 10, width: UIScreen.main.bounds.width, height: (cell.bounds.height)))
            creditlabel.textAlignment = NSTextAlignment.right
            creditlabel.text = String(UserData.getUD().credit)
            cell.addSubview(creditlabel)
        }
        
        return cell
    }
    
  
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell: UITableViewCell? = tableView.cellForRow(at: indexPath)
        var showview : BaseTableViewController = BaseTableViewController()
        if(cell!.tag == 101){
           showview = PersonMessageView()
        }else if(cell?.tag == 102){
           showview = MyOrderView()
        }else if(cell?.tag == 103){
//           showview = CreditView()
        }else if(cell?.tag == 104){
           showview = ReceiveItemWhere()
        } else if(cell?.tag == 105){
          showview = ReceiverPersonView()
        }else if(cell?.tag == 106){
          showview = EditView()
        }else if(cell?.tag == 107){
          showview = AllActivitysView()
        }
        if(cell?.tag != 103){
            showview.title = UserData.showdics[indexPath.section][indexPath.row]
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: UserData.appshowtexts[1], style: UIBarButtonItemStyle.plain, target: self, action: nil)
            self.navigationController?.pushViewController(showview, animated: true)
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
