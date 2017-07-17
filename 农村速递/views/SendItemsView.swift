//
//  SendItemsView.swift
//  农村速递
//
//  Created by 郭有超 on 2017/6/18.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class SendItemsView: BaseTableViewController, UITextFieldDelegate {
    var cells : Array<FieldTableViewCell> = []
    var hasshow = false
    var rpi     = ""
    var rpwi    = ""
    var spwi    = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem =  UIBarButtonItem(title: UserData.appshowtexts[10], style: UIBarButtonItemStyle.done, target: self, action:#selector(addReceiveDatas))
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @objc func addReceiveDatas(sender: UIBarButtonItem) {
        var per = Parameters()
        per["send_person_id"]      = UserData.getUD().personmsg.phone
        per["send_person_where"]   = spwi
        per["receive_person_id"]   = rpi
        per["receive_where_id"]    = rpwi
        
        per["send_person_wheremsg"]    = UserData.getUD().getAddressById(id: spwi).toString()
        per["rec_person_wheremsg"]     = UserData.getUD().getAddressById(id: rpwi).toString()
        per["rec_person_phonemsg"]     = UserData.getUD().getLinkPersonById(id: rpi).phone1
        per["rec_person_phone2msg"]    = UserData.getUD().getLinkPersonById(id: rpi).phone2
        per["rec_person_name"]         = UserData.getUD().getLinkPersonById(id: rpi).name
        
        Http.Post(url: Http.senditemrequestaction, data: per, call: callback)
        print(per)
    }
    
    func callback(data: JSON) -> Bool {
        self.navigationController?.popViewController(animated: true)
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

    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("当前的tag = ",textField.tag)
        textField.resignFirstResponder()
        if hasshow == false{
           if textField.tag == UserData.senditemshowids[0]{
              let receve   = ReceiverPersonView()
              receve.upperview = self
              self.navigationController?.pushViewController(receve, animated: true)
            }else if textField.tag == UserData.senditemshowids[1]{
                let receve     = ReceiveItemWhere()
                receve.dealtag = textField.tag
                receve.upperview = self
                self.navigationController?.pushViewController(receve, animated: true)
            }else if textField.tag == UserData.senditemshowids[2]{
                let receve = ReceiveItemWhere()
                receve.upperview = self
                receve.dealtag = textField.tag
                self.navigationController?.pushViewController(receve, animated: true)
            }
           
        }else{
             hasshow = true
        }
       
    }
    
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return UserData.senditemshows.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let person = UserData.getUD().getLinkPersonById(id: rpi)
        if person.id.characters.count > 0{
           cells[0].textfield.text = person.getString()
        }
        
        let saddress = UserData.getUD().getAddressById(id: rpwi)
        if saddress.id.characters.count > 0{
            cells[1].textfield.text = saddress.toString()
        }
        
        let raddress = UserData.getUD().getAddressById(id: spwi)
        if raddress.id.characters.count > 0{
           cells[2].textfield.text = raddress.toString()
        }
        
        print("收件人的ID=  ",rpi, spwi)
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath:  IndexPath) -> UITableViewCell {
        
        let cell = FieldTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.placeholder =  String(UserData.senditemshows[indexPath.row])
        cell.flushShow()
        cell.textfield.delegate = self
        cell.textfield.tag =  UserData.senditemshowids[indexPath.row]
        cell.showid = UserData.senditemshowids[indexPath.row]
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.textLabel?.text = String(UserData.senditemshows[indexPath.row])
        cell.textLabel?.textAlignment = NSTextAlignment.left
        cell.textLabel?.font = UIFont(name: "Arial", size: 18)
        cells.append(cell)
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
