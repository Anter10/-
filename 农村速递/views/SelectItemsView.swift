//
//  SelectItemsView.swift
//  农村速递
//
//  Created by 郭有超 on 2017/6/18.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit

class SelectItemsView: BaseTableViewController {

    var aboutWebView = UIWebView()
    ;
    var orderid      = ""
    var orderproid   = "-1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "订单详情"
        let body = "?orderid=\(orderid)&selectpid=\(orderproid)"
        let aboutUrl = NSURL(string: Http.selectorderaction + body)!
        
        //编码POST数据
        let postData = body.data(using: String.Encoding.utf8, allowLossyConversion: true)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        self.tableView.isScrollEnabled = false
        let urlLabel = UILabel(frame: CGRect(x: 0, y: 20, width: Paramters.ScreenSize.width, height: 40))
        urlLabel.textAlignment = NSTextAlignment.center
        urlLabel.text = "www.express-heisekeji.net"
        //        self.view.addSubview(urlLabel)
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        aboutWebView = UIWebView(frame: CGRect(x: 0, y: 2, width: Paramters.ScreenSize.width, height: Paramters.ScreenSize.height - 110))
        let request = NSURLRequest(url: aboutUrl as URL)
 
        aboutWebView.loadRequest(request as URLRequest)
        
        self.tableView.addSubview(aboutWebView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

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
