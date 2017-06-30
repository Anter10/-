//
//  LoginTableView.swift
//  农村速递
//
//  Created by 郭有超 on 2017/6/22.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
class LoginTableView: BaseTableViewController , UIGestureRecognizerDelegate, UITextFieldDelegate{
    
    var idfield: UITextField = UITextField()
    var pwdfield: UITextField = UITextField()
    var tap:UITapGestureRecognizer?
    var LoginButton : UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        print("______________________________进入应用__________________")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        self.title = "express.heisekeji.com"
        tap = UITapGestureRecognizer(target: self, action:#selector(cancelFocus(_:)))
        
        tap?.delegate = self
        tap?.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tap!)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
         let size = self.tableView.bounds
        let IdLabel = UIButton(frame: CGRect(x: Paramters.ScreenWidthCenter - 60, y: size.height - 100, width: 120, height: 40))
        IdLabel.titleLabel?.font = UIFont(name: "Arial", size: 14)
        IdLabel.titleLabel?.textColor = UIColor.blue
        IdLabel.setTitle("更多操作", for: UIControlState.normal)
        IdLabel.setTitleColor(UIColor.blue, for: .normal)
        self.view.addSubview(IdLabel)
        IdLabel.addTarget(self, action:#selector(MoreCall(_:)), for:.touchUpInside)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        print("什么情况是事实")
    }
    //键盘的出现
    @objc func keyBoardWillShow(_ notification: Notification){
        self.view.addGestureRecognizer(tap!)
        print("键盘的出现")
    }
    //键盘的隐藏
    @objc func keyBoardWillHide(_ notification: Notification){
         self.view.removeGestureRecognizer(tap!)
        print("收回键盘")
    }
    
    @objc func cancelFocus(_ sender:UITapGestureRecognizer) {
        print("点击了嘛")
        idfield.resignFirstResponder()
        pwdfield.resignFirstResponder()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0{
            return 10
        }
        return 0
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0{
            return 2
        }
        return 1
    }
    
    // 登录服务器
    @objc func LoginServer(_ sender: UIButton){
        let id:  String  = idfield.text!
        let pwd: String  = pwdfield.text!
        var per  = Parameters()
        per["id"]         = id
        per["logintype"]  = "1"
        per["pwd"]        = pwd
        Http.Post(url: Http.loginurl, data: per, call: logincallback)
        print("账号 = ",id,"密码 = ",pwd)
        
        //        let MainBar = MainTabBarTable()
        //        present(MainBar, animated: false, completion: nil)
        print("LoginServer")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //收起键盘
        textField.resignFirstResponder()
        //打印出文本框中的值
        
        return true;
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(textField.tag,"string",string)
        if textField.tag == 100 {
            if ((textField.text?.characters.count)! < 11){
                return true
            }else if(string.characters.count == 0){
                return true
            }
                
            else{
                return false
            }
        }else{
            if ((textField.text?.characters.count)! < 18){
                return true
            }else if(string.characters.count == 0){
                return true
            }
                
            else{
                return false
            }
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
             cell.selectionStyle = UITableViewCellSelectionStyle.none
             if indexPath.section == 0{
                if indexPath.row == 0{
                    if UserData.appshowtexts.count > 0 {
                       cell.textLabel?.text = UserData.appshowtexts[7]
                    }else{
                       cell.textLabel?.text = "账号"
                    }
                     idfield.becomeFirstResponder()
                    idfield = UITextField(frame: CGRect(x: 75, y: 10, width: 220, height: 40))
                    idfield.placeholder = "请输入账号"
                    idfield.delegate = self
                    cell.addSubview(idfield)
                }else{
                    if UserData.appshowtexts.count > 0 {
                        cell.textLabel?.text = UserData.appshowtexts[8]
                    }else{
                        cell.textLabel?.text = "密码"
                    }
                    pwdfield = UITextField(frame: CGRect(x: 75, y: 10, width: 220, height: 40))
                    pwdfield.delegate = self
                    pwdfield.placeholder = "请输入密码"
                    pwdfield.isSecureTextEntry = true
                    cell.addSubview(pwdfield)
                }
                
             } else if indexPath.section == 1{
                LoginButton = UIButton(frame: CGRect(x: 0, y: 0, width: Paramters.LoginButtonSize.0, height: 55))
                cell.addSubview(LoginButton!)
                LoginButton?.backgroundColor = UIColor.lightGray
                LoginButton?.addTarget(self, action:#selector(LoginServer(_:)), for:.touchUpInside)
                //            LoginButton?.titleLabel?.backgroundColor = UIColor.black
                LoginButton?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
                LoginButton?.titleLabel?.textColor = UIColor.black
                LoginButton?.setTitle("登录", for: UIControlState.normal)
             }
        
             return cell
    }
    
    
    
    
    func logincallback(data: JSON) -> Bool {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.pushViewController(TabBarScene(), animated: true)
        print("登陆数据回调 ",data)
        return true
    }
    
    // 点击更多的时候调用
    @objc func MoreCall(_ sender: UIButton){
        print("MoreCall")
        let alert = UIAlertController(title: "", message: "请选择操作", preferredStyle: UIAlertControllerStyle.actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel){
            (result : UIAlertAction) -> Void in
            print("Cancel")
        }
        
        let okAction = UIAlertAction(title: "注册账号", style: UIAlertActionStyle.default){
            (result : UIAlertAction) -> Void in
            // 注册账号
            let backButton = UIBarButtonItem()
            backButton.title = "注册账号"
            self.navigationItem.backBarButtonItem = backButton
            let registView = RegisterViewTable()
            self.show(registView, sender: nil)
            
        }
            
        let forgetAction = UIAlertAction(title: "忘记密码", style: UIAlertActionStyle.default){
            (result : UIAlertAction) -> Void in
            let backButton = UIBarButtonItem()
            backButton.title = "找回密码"
            self.navigationItem.backBarButtonItem = backButton
            let name = FindPasswordTable()
            self.show(name, sender: nil)
            print("OK")
        }
        
        
        // 验证码登录
        let codeAction = UIAlertAction(title: "验证码登录", style: UIAlertActionStyle.default){
            
            (result : UIAlertAction) -> Void in
            let backButton = UIBarButtonItem()
            backButton.title = "验证码登录"
            self.navigationItem.backBarButtonItem = backButton
            let name = CodeViewTable()
            self.show(name, sender: nil)
            print("OK")
        }
        
        alert.addAction(cancelAction)
        
        alert.addAction(forgetAction)
        alert.addAction(okAction)
        alert.addAction(codeAction)
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
