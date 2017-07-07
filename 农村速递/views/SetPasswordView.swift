//
//  SetPasswordView.swift
//  农村速递
//
//  Created by 郭有超 on 2017/7/4.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SetPasswordView: BaseTableViewController {
    var RegisterPhone = UITextField();
    var changetype = "";
    var changeid   = "";
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
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    func sendCodeCall(data: JSON) -> Bool{
        print("zenmehuishi",data[0]["id"])
        return true
    }
    
    @objc func setpwdcall(_ sender: UIButton){
        let phone = RegisterPhone.text as! String
        var par = Parameters()
        par["changetype"] = "101"
        par["changeid"] = changeid
        par["changepwd"] = phone
        
        print(phone)
        Http.Post(url: Http.changepassword, data: par, call: sendCodeCall)
        
        print("注册号码")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let upsize = CGFloat(5)
        if indexPath.section == 0{
            RegisterPhone = UITextField(frame: CGRect(x: 125, y: upsize, width: Paramters.InputSize.0, height: Paramters.InputSize.1))
            let IdLabel = UILabel(frame: CGRect(x: 10, y: upsize, width: 120, height: 40))
            IdLabel.font = UIFont.boldSystemFont(ofSize: 22)
            cell.addSubview(IdLabel)
            IdLabel.text = "设置密码:"
            cell.addSubview(RegisterPhone)
            RegisterPhone.font = UIFont.systemFont(ofSize: 18)
            //                PhoneOrEmailTextField?.borderStyle = UITextBorderStyle.roundedRect
            
            RegisterPhone.returnKeyType = UIReturnKeyType.done
            RegisterPhone.clearButtonMode = .whileEditing
            RegisterPhone.minimumFontSize=16
            RegisterPhone.adjustsFontSizeToFitWidth=true
            RegisterPhone.placeholder = "请输入账号密码"
            RegisterPhone.keyboardAppearance = .alert
            RegisterPhone.keyboardType  = .numberPad
        }else{
            var LoginButton = UIButton(frame: CGRect(x: 0, y: 15, width: Paramters.LoginButtonSize.0, height: Paramters.LoginButtonSize.1))
            cell.addSubview(LoginButton)
            LoginButton.backgroundColor = UIColor.green
            LoginButton.addTarget(self, action:#selector(setpwdcall(_:)), for:.touchUpInside)
            //            LoginButton?.titleLabel?.backgroundColor = UIColor.black
            LoginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
            LoginButton.titleLabel?.textColor = UIColor.black
            LoginButton.setTitle("确定", for: UIControlState.normal)
        }
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0{
            return 10
        }else{
            return 0
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
