//
//  FindPasswordTable.swift
//  NowHome
//
//  Created by 郭有超 on 2016/12/2.
//  Copyright © 2016年 郭有超. All rights reserved.
//

import UIKit
import DeviceCheck
import Alamofire
import SwiftyJSON

class FindPasswordTable: UITableViewController, UITextFieldDelegate {
    
        var RegisterPhone : UITextField?
        var SendButton : UIButton?
    
        override func viewDidLoad() {
            super.viewDidLoad()
            self.title = "找回密码"
            self.tableView.tableFooterView = UIView()
            //        self.tableView.bounces = false
            self.tableView.backgroundColor = UIColor.groupTableViewBackground
            self.tableView.isScrollEnabled = false
            // Uncomment the following line to preserve selection between presentations
            // self.clearsSelectionOnViewWillAppear = false
            
            // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
            // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        }
    
        func sendCodeCall(data: JSON) -> Bool {
            let veride = VerCodeView()
            veride.setTitle(title: "验证码验证")
            self.navigationController?.pushViewController(veride, animated: true)
            return true
        }
    
        // 发送找回密码
    @objc func findPWD(_ sender: UIButton)-> Void{
            let phone = RegisterPhone?.text as! String
            var par = Parameters()
            par["phoneoreamil"] = phone
            par["codetype"] = 104
            UserData.cur_login_id = phone
            Http.Post(url: Http.sendregistercode, data: par, call: sendCodeCall)
        }
    
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        // MARK: - Table view data source
        
        override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 2
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            if section == 0 {
                return 1
            }
            return 1
        }
        
        
        override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            if section == 1{
                return 20
            }
            return 0
        }
        
        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if indexPath.section == 0{
                return 50
            }
            return Paramters.InputCodeButtonSize.1
        }
        
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell()
            cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
            cell.selectionStyle = .none
            cell.setSelected(false, animated: false)
            
            if indexPath.section == 0 {
                let upsize = CGFloat(5)
                RegisterPhone = UITextField(frame: CGRect(x: 85, y: upsize, width: Paramters.InputSize.0, height: Paramters.InputSize.1))
                let IdLabel = UILabel(frame: CGRect(x: 10, y: upsize, width: 120, height: 40))
                IdLabel.font = UIFont.boldSystemFont(ofSize: 22)
                cell.addSubview(IdLabel)
                IdLabel.text = "账号 "
                cell.addSubview(RegisterPhone!)
                RegisterPhone?.font = UIFont.systemFont(ofSize: 18)
                //                PhoneOrEmailTextField?.borderStyle = UITextBorderStyle.roundedRect
                RegisterPhone?.delegate = self
                RegisterPhone?.returnKeyType = UIReturnKeyType.done
                RegisterPhone?.clearButtonMode = .whileEditing
                RegisterPhone?.minimumFontSize=16
                RegisterPhone?.adjustsFontSizeToFitWidth=true
                RegisterPhone?.placeholder = "请输入手机号/邮箱"
                if UserData.cur_login_id.characters.count > 0 {
                    print("ssss = ",UserData.cur_login_id)
                    RegisterPhone?.text = UserData.cur_login_id
                }
                RegisterPhone?.keyboardAppearance = .alert
                RegisterPhone?.keyboardType  = .numberPad
            }else if indexPath.section == 1 {
                SendButton = UIButton(frame: CGRect(x:0, y: 0, width: Paramters.ScreenSize.width, height: Paramters.InputCodeButtonSize.1))
                SendButton?.backgroundColor = UIColor.green
                SendButton?.addTarget(self, action:#selector(findPWD(_:)), for:.touchUpInside)
                SendButton?.setTitle("发送验证码", for: UIControlState.normal)
                cell.addSubview(SendButton!)
                
            }
            
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
