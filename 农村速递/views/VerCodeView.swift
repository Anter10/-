//
//  VerCodeView.swift
//  农村速递
//
//  Created by 郭有超 on 2017/9/9.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit
import DeviceCheck
import Alamofire
import SwiftyJSON

class VerCodeView: BaseTableViewController, UITextFieldDelegate {
    var RegisterPhone : UITextField?
    var SendButton : UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func setTitle(title: String) {
        self.title = title
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
    
    
    func sendCodeCall(data: JSON) -> Bool {
        let veride = SetPasswordView()
        veride.title = "设置密码"
        self.navigationController?.pushViewController(veride, animated: true)
        return true
    }
    
    // 发送找回密码
    @objc func findPWD(_ sender: UIButton)-> Void{
        let code = RegisterPhone?.text as! String
        var par = Parameters()
        par["phoneoreamil"] = UserData.cur_login_id
        par["codetype"] = 104
        par["code"] = code
        Http.Post(url: Http.verilphoneoreamilcode, data: par, call: sendCodeCall)
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
           
            
            RegisterPhone?.keyboardAppearance = .alert
            RegisterPhone?.keyboardType  = .numberPad
        }else if indexPath.section == 1 {
            SendButton = UIButton(frame: CGRect(x:0, y: 0, width: Paramters.ScreenSize.width, height: Paramters.InputCodeButtonSize.1))
            SendButton?.backgroundColor = UIColor.green
            SendButton?.addTarget(self, action:#selector(findPWD(_:)), for:.touchUpInside)
            SendButton?.setTitle("确定验证码", for: UIControlState.normal)
            cell.addSubview(SendButton!)
            
        }
        
        // Configure the cell...
        
        return cell
    }

    // MARK: - Table view data source

    
 

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
