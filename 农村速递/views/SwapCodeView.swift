//
//  SwapCodeView.swift
//  农村速递
//
//  Created by 郭有超 on 2017/6/18.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit

class SwapCodeView: BaseTableViewController {
 public var animationImage:UIImage?
    public var swapLabel = UILabel()
    public var swapdim   = true
    public var view1 = ImageViewLabelCell()
    public var view2 = ImageViewLabelCell()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isScrollEnabled = false
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
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
           return Paramters.ScreenSize.height - (FirstNavigationView().navigationBar.frame.height + TabBarScene().tabBar.frame.height + 160)
        }else{
            return 140
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        // Configure the cell...
        if indexPath.row == 1{
//            cell.backgroundColor = UIColor.gray
            view1 = ImageViewLabelCell()
            view1.frame = CGRect(x: 20, y: 10, width: 120, height: 120)
            view1.addShows(icon: "book_bookmark_64", title: UserData.appshowtexts[13])
            cell.addSubview(view1)
            view1.iconButton.addTarget(self, action: #selector(swapBar(_:)), for: UIControlEvents.touchDown)
            view2 = ImageViewLabelCell()
            view2.frame = CGRect(x: Paramters.ScreenSize.width - 120 - 20, y: 10, width: 120, height: 120)
            view2.addShows(icon: "link_64", title: UserData.appshowtexts[14])
            cell.addSubview(view2)
            view2.iconButton.addTarget(self, action: #selector(konwImage(_:)), for: UIControlEvents.touchDown)
        }else{
            let anim = ScanLineAnimation.instance()
            anim.startAnimatingWithRect(animationRect: CGRect(x: 20, y: 40, width: 320, height: 320), parentView: cell, image: animationImage)
            cell.addSubview(anim)
            cell.backgroundColor = UIColor.black
            swapLabel = UILabel(frame: CGRect(x: 0, y: Paramters.ScreenSize.height - 180 - 140, width: Paramters.ScreenSize.width, height: 35))
            swapLabel.text = UserData.appshowtexts[12]
            swapLabel.textColor = UIColor.white
            swapLabel.textAlignment = NSTextAlignment.center
            cell.addSubview(swapLabel)
           
            
            
            
        }
        return cell
    }
    
    @objc func swapBar(_ button: UIButton) -> Void{
        print("扫码条形码")
        if swapdim {
           swapLabel.text = UserData.appshowtexts[13]
           swapdim = false
           view1.iconButton.setTitle(UserData.appshowtexts[13], for: UIControlState.normal)
        }else{
            swapLabel.text = UserData.appshowtexts[12]
            view1.iconButton.setTitle(UserData.appshowtexts[12], for: UIControlState.normal)
            swapdim = true
        }
    }
    
    @objc func konwImage(_ button: UIButton) -> Void{
        print("图片识别")
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
