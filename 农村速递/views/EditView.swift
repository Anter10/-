//
//  EditView.swift
//  农村速递
//
//  Created by 郭有超 on 2017/6/18.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit

class EditView: BaseTableViewController {
   
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
        return UserData.getUD().editdata.edits.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return UserData.getUD().editdata.edits[section].count
    }

    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == UserData.getUD().editdata.edits.count - 1{
            return 0
        }
        return 10
    }
    
    override  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.textLabel?.text = UserData.getUD().editdata.edits[indexPath.section][indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var showview:BaseTableViewController? = nil
        
        if (indexPath.section == 0 && indexPath.row == 0){
           
        }
        if UserData.getUD().editdata.editids[indexPath.section][indexPath.row] == 103{
//           showview = LoginTableView()
//           self.navigationController?.setNavigationBarHidden(true, animated:false)
//            exit(0)
            MoreCall()
//            self.navigationController?.popToRootViewController(animated: true)
        }else if UserData.getUD().editdata.editids[indexPath.section][indexPath.row] == 101{
           showview = VerityIdCardView()
        }else if UserData.getUD().editdata.editids[indexPath.section][indexPath.row] == 104{
            showview = AboutNCSDExpressLayer()
        }
        if showview != nil{
           showview?.title = UserData.getUD().editdata.edits[indexPath.section][indexPath.row]
           self.navigationItem.backBarButtonItem = UIBarButtonItem(title: UserData.appshowtexts[6], style: UIBarButtonItemStyle.plain, target: self, action: nil)
           self.navigationController?.pushViewController(showview!, animated: true)
        }
        
    }
 
    // 点击更多的时候调用
    func MoreCall(){
        
        let alert = UIAlertController(title: "", message: "退出账号后,将保存你的账号,密码不保存,确定退出吗？", preferredStyle: UIAlertControllerStyle.actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel){
            (result : UIAlertAction) -> Void in
            print("Cancel")
        }
        
        let okAction = UIAlertAction(title: "退出账号", style: UIAlertActionStyle.default){
            (result : UIAlertAction) -> Void in
            // 注册账号
            let persondir:NSDictionary = ["id":UserData.getUD().personmsg.phone,"pwd" : ""]
            
            // 保存账号数据
            UserData.writeDataToPath(data: persondir, filename: "usermessage.json")
            UserData.tabscene.removeFromParentViewController()
            exit(0)
        }
        
        
        
        alert.addAction(cancelAction)
 
        alert.addAction(okAction)
        self.present(alert, animated: true)
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
