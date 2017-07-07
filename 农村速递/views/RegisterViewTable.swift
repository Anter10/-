//
//  RegisterViewTable.swift
//  NowHome
//
//  Created by 郭有超 on 2016/11/27.
//  Copyright © 2016年 郭有超. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class RegisterViewTable: UITableViewController, UITextFieldDelegate {
    
    var RegisterPhone : UITextField?
    var InputCodeNumber: UITextField?
    var SendButton : UIButton?
    var LoginButton : UIButton?
    var remainCount = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        //        self.tableView.bounces = false
        self.tableView.backgroundColor = UIColor.groupTableViewBackground
        let size = self.tableView.bounds
        self.tableView.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height - 50)
        
        let IdLabel = UIButton(frame: CGRect(x: Paramters.ScreenWidthCenter - 60, y: size.height - 80, width: 120, height: 40))
        IdLabel.titleLabel?.textColor = UIColor.blue
        IdLabel.titleLabel?.font = UIFont(name: "Arial", size: 14)
        IdLabel.setTitle("用户协议", for: UIControlState.normal)
        IdLabel.setTitleColor(UIColor.blue, for: .normal)
        self.view.addSubview(IdLabel)
        IdLabel.addTarget(self, action:#selector(userKonw(_:)), for:.touchUpInside)
    
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    var countdownTimer: Timer?
    
    @objc func cuttime(timer: Timer) {
        // 计时开始时，逐秒减少remainingSeconds的值
        remainingSeconds -= 1
        print("remainingSeconds = ",remainingSeconds)
    }
    
    var remainingSeconds: Int = 0 {
        willSet {
            SendButton?.setTitle("(\(newValue)秒)", for: .normal)
            
            if newValue <= 0 {
                SendButton?.setTitle("重新获取验证码", for: .normal)
                isCounting = false
            }
        }
    }
    
    
  
    
    var isCounting = false {
        willSet {
            if newValue {
                countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(RegisterViewTable.cuttime(timer:)), userInfo: nil, repeats: true)
                
                remainingSeconds = 60
                
                SendButton?.backgroundColor = UIColor.gray
            } else {
                countdownTimer?.invalidate()
                countdownTimer = nil
                
                SendButton?.backgroundColor = UIColor.green
            }
            
            SendButton?.isEnabled = !newValue
        }
    }
    
   
    
    // 登录服务器
    @objc func userKonw(_ sender: UIButton){
        
        
        print("LoginServer")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
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
        return 55
    }
    
    func registerCall(data: JSON) -> Void{
        print("注册得到的数据 = ",data)
    }
    
    func sendCodeCall(data: JSON) -> Bool{
         print("zenmehuishi",data[0]["id"])
        if data[0]["id"].stringValue == "101"{
           print("zenmehuishi")
           let setpwd = SetPasswordView()
           setpwd.changeid = RegisterPhone?.text as! String
           setpwd.changetype = "101"
           setpwd.title = "设置密码"
           self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.plain, target: self, action: nil)
           self.navigationController?.pushViewController(setpwd, animated: true)
        }else{
            
        }
        
        print("注册得到的数据12 = ",data)
        
        return true
    }
    
    @objc func sendCode(_ sender: UIButton) -> Void {
        let phone = RegisterPhone?.text as! String
        var par = Parameters()
        par["phoneoreamil"] = phone
        par["codetype"] = 102
        
        isCounting = true
        print(phone)
        Http.Post(url: Http.sendregistercode, data: par, call: sendCodeCall)
      
    }
    
    @objc func RegisterServer(_ sender: UIButton) -> Void {
        let phone = RegisterPhone?.text
        let code  = InputCodeNumber?.text
        var per   = Parameters()
        per["phoneoremail"] = phone!;
        per["codetype"]     = "102";
        per["code"]         = code!;
        Http.Post(url: Http.verilphoneoreamilcode, data: per, call: sendCodeCall)
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        cell.selectionStyle = .none
        cell.setSelected(false, animated: false)
        if indexPath.section == 2{
           cell.backgroundColor = UIColor.groupTableViewBackground
            LoginButton = UIButton(frame: CGRect(x: 0, y: 15, width: Paramters.LoginButtonSize.0, height: Paramters.LoginButtonSize.1))
            cell.addSubview(LoginButton!)
            LoginButton?.backgroundColor = UIColor.green
            LoginButton?.addTarget(self, action:#selector(RegisterServer(_:)), for:.touchUpInside)
            //            LoginButton?.titleLabel?.backgroundColor = UIColor.black
            LoginButton?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
            LoginButton?.titleLabel?.textColor = UIColor.black
            LoginButton?.setTitle("注册", for: UIControlState.normal)

        }
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
            let upsize = CGFloat(5)
            InputCodeNumber = UITextField(frame: CGRect(x: 85, y: upsize, width: Paramters.CodeInputSize.0, height: Paramters.CodeInputSize.1))
            let PwdLabel = UILabel(frame: CGRect(x: 10, y: upsize, width: 120, height: 40))
            PwdLabel.font = UIFont.boldSystemFont(ofSize: 22)
            cell.addSubview(PwdLabel)
            PwdLabel.text = "验证码 "
            //                PasswordField?.borderStyle = UITextBorderStyle.roundedRect
            InputCodeNumber?.delegate=self
            InputCodeNumber?.returnKeyType = UIReturnKeyType.join
        
            InputCodeNumber?.minimumFontSize=16
            InputCodeNumber?.adjustsFontSizeToFitWidth=true
            cell.addSubview(InputCodeNumber!)
            InputCodeNumber?.keyboardAppearance = .alert
            InputCodeNumber?.keyboardType  = .numberPad
            InputCodeNumber?.font = UIFont.systemFont(ofSize: 18)
            InputCodeNumber?.placeholder = "请输入验证码"
            
            SendButton = UIButton(frame: CGRect(x: Paramters.ScreenSize.width - Paramters.InputCodeButtonSize.0 - CGFloat(10), y: upsize + 5, width: Paramters.InputCodeButtonSize.0, height: Paramters.InputCodeButtonSize.1))
            SendButton?.backgroundColor = UIColor.green
            SendButton?.addTarget(self, action:#selector(sendCode(_:)), for:.touchUpInside)
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
