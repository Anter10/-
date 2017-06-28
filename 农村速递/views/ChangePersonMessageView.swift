//
//  ChangePersonMessageView.swift
//  农村速递
//
//  Created by 郭有超 on 2017/6/19.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit

class ChangePersonMessageView: BaseTableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var changetag : Int = 0
    var changeText : UITextField = UITextField()
    var curchangevalue   : String = ""
    var pickers : [UIPickerView] = []
    var picker  : UIPickerView    = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isScrollEnabled = false
        print("当前更换的tag",changetag)
        self.navigationItem.rightBarButtonItem =  UIBarButtonItem(title: UserData.appshowtexts[4], style: UIBarButtonItemStyle.done, target: self, action:#selector(changeMessage))
        picker = UIPickerView(frame: CGRect(x: 5, y: 0, width: UIScreen.main.bounds.width - 10, height: UIScreen.main.bounds.height / 4 - 10))
        picker.delegate = self
        if changetag == 105 {
           picker.selectRow(0, inComponent: 0, animated: true)
        }
        
        picker.dataSource = self
        
        
//        self.tableView.tableHeaderView = picker
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if changetag == 105{
           return 2
        }
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if changetag == 105{
           return LocalAppData.sex[row]
        }
        return String(row) + "_ " + String(component)
    }
    
    @objc func changeMessage(sender: UIBarButtonItem) {
        var changvalue = changeText.text!
        if changetag == 105 {
           changvalue = curchangevalue
        }
        print("修改后的内容 = ",changvalue)
        UserData.getUD().personmsg.setValueByTag(tag: changetag, msg1: changvalue)
        self.navigationController?.popViewController(animated: true)
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
        if changetag == 105{
            return 2
        }
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
         cell.selectionStyle = UITableViewCellSelectionStyle.gray
         // Configure the cell...
         cell.tag = changetag
         if changetag == 105{
            if indexPath.row == 0 {
               cell.isSelected = true
               cell.setSelected(true, animated: true)
//               cell.backgroundColor = UIColor.lightGray
            }
            let Label = UILabel(frame: CGRect(x: 0, y: 10, width: UIScreen.main.bounds.width , height:cell.bounds.height ))
        
            Label.text = LocalAppData.sex[indexPath.row]
            Label.textAlignment = NSTextAlignment.center
            cell.addSubview(Label)
            
         }else{
            changeText = UITextField(frame: CGRect(x: 10, y: 10, width: cell.bounds.width - 130, height: cell.bounds.height))
            changeText.text = curchangevalue
            cell.addSubview(changeText)
            changeText.becomeFirstResponder()
         }
        
         return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if  changetag == 105{
            curchangevalue = LocalAppData.sex[indexPath.row]
//            tableView.cellForRow(at: indexPath)?.backgroundColor = UIColor.lightGray
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
