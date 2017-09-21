//
//  VerityIdCardView.swift
//  农村速递
//
//  Created by 郭有超 on 2017/6/18.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
class VerityIdCardView: BaseTableViewController, UIGestureRecognizerDelegate {
    var id: UITextField   = UITextField()
    var name: UITextField = UITextField()
    var idname : [String] = ["身份证号: ","姓名: "]
    var hasveri = false
    var tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(cancelFocus(_:)))
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isScrollEnabled = false
        self.navigationItem.rightBarButtonItem =  UIBarButtonItem(title: UserData.appshowtexts[4], style: UIBarButtonItemStyle.done, target: self, action:#selector(okidcard))
        tap = UITapGestureRecognizer(target: self, action:#selector(cancelFocus(_:)))
        tap.delegate = self
        tap.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tap)
        getVeri()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @objc func cancelFocus(_ sender:UITapGestureRecognizer) {
        id.resignFirstResponder()
        name.resignFirstResponder()
        
    }
    
    // 请求验证信息
    func getVeri() -> Void {
        if (UserData.veriidcarddata.idcard.characters.count == 0) {
            var para = Parameters()
            para["mainid"]      = UserData.getUD().personmsg.phone
            para["tbid"]        = "107"
            
            Http.Post(url: Http.sendalldataaction, data: para, call: veriData)
        }
    }
    
    @objc func okidcard(sender: UIBarButtonItem) {
        if (UserData.veriidcarddata.idcard.characters.count == 0) {
            var para = Parameters()
            para["uid"]      = UserData.getUD().personmsg.phone
            para["idcard"]   = id.text!
            para["idname"]   = name.text
        
            Http.Post(url: Http.veriidcard, data: para, call: veriData)
            print("身份证 = ",para)
            cantEdit()
        }
       
    }
    
    func cantEdit() -> Void {
        if (UserData.veriidcarddata.idcard.characters.count != 0) {
            id.isSelected   = false
            name.isSelected = false
            id.isEnabled    = false
            name.isEnabled  = false
            id.text   = UserData.veriidcarddata.idcard
            name.text = UserData.veriidcarddata.idname
            print("验证信息 ",UserData.veriidcarddata.idcard)
            self.navigationItem.rightBarButtonItem?.title = "已经验证"
        }
    }
    
    func veriData(data: JSON)-> Bool{
        print("datadatadatadata = ",data)
        //        UserData.getUD().receiveaddress.removeIndex(index: indexPath.row)
        //        self.tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
     
        UserData.veriidcarddata = ViriIdCard(_id: data[0]["id"].stringValue, _mainid: data[0]["mainid"].stringValue, _idcard: data[0]["idcard"].stringValue, _idname: data[0]["idname"].stringValue, _vertime: data[0]["vertime"].stringValue)
        hasveri = true
        cantEdit()
        return true
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
        return 2
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        cell.selectionStyle  = UITableViewCellSelectionStyle.none
        cell.textLabel?.text = UserData.getUD().verificationshows[indexPath.row]
        if indexPath.row == 0{
            id = UITextField(frame: CGRect(x: 120, y: 10, width: cell.bounds.width - 80, height: cell.bounds.height))
            id.placeholder = UserData.placeholders[1]
            cell.addSubview(id)
            
        }else{
            name = UITextField(frame: CGRect(x: 120, y: 10, width: cell.bounds.width - 80, height: cell.bounds.height))
            name.placeholder = UserData.placeholders[2]
            cell.addSubview(name)
            cantEdit()
        }
        
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
