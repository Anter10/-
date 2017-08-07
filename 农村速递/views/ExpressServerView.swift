//
//  ExpressServerView.swift
//  农村速递
//
//  Created by 郭有超 on 2017/7/29.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit

class ExpressServerView: BaseTableViewController, UIGestureRecognizerDelegate{
    var tablesection:Int = 1
    var tablerownumber : Int = 3
    var showdics:[[String]] = UserData.fshowdics
    var showids :[[Int]] = UserData.fshowids
    var tap:UITapGestureRecognizer = UITapGestureRecognizer()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = UserData.appshowtexts[0]
        tap = UITapGestureRecognizer(target: self, action:#selector(cancelFocus(_:)))
        
        tap.delegate = self
        tap.numberOfTapsRequired = 1
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        print("什么情况是事实")
    }
    
   
    override func viewWillAppear(_ animated: Bool) {
        showViews()
    }
    
    @objc func cancelFocus(_ sender:UITapGestureRecognizer) {
        print("点击了嘛")
        showViews()
    }
    
    func showViews(){
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.tableView.scrollsToTop = true
        self.tableView.reloadData()
        self.view.removeGestureRecognizer(tap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        print("第三个部分 = ",showdics.count)
        return showdics.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return showdics[section].count
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section < showdics[section].count{
            return 10
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (UIScreen.main.bounds.height - 50 - 10 - FirstNavigationView().navigationBar.bounds.height) / 10
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell.tag = showids[indexPath.section][indexPath.row]
        cell.textLabel?.text = showdics[indexPath.section][indexPath.row]
        return cell
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        showdics = []
        showids  = []
        self.tableView.reloadData()
        self.view.addGestureRecognizer(tap)
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell: UITableViewCell? = tableView.cellForRow(at: indexPath)
        var showview : UIViewController = UIViewController()
        if(cell!.tag == 101){
            showview = SwapCodeView()
        }else if(cell?.tag == 102){
            showview = SendItemsView()
            
        }else if(cell?.tag == 103){
            showview = NearExpressWheresView()
        }
        print("ddddsadasd")
        showview.title = showdics[indexPath.section][indexPath.row]
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: UserData.appshowtexts[0], style: UIBarButtonItemStyle.plain, target: self, action: nil)
        self.navigationController?.pushViewController(showview, animated: true)
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

