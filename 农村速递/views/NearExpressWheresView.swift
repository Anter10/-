//
//  NearExpressWheresView.swift
//  农村速递
//
//  Created by 郭有超 on 2017/6/18.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class NearExpressWheresView: BaseTableViewController , CLLocationManagerDelegate{
    var mainMapView: MKMapView!
    var currentCoordinate:CLLocationCoordinate2D?
    //定位管理器
    let locationManager:CLLocationManager = CLLocationManager()
    var currentLocation:CLLocation!
    var lock = NSLock()
    override func viewDidLoad() {
        super.viewDidLoad()
        //使用代码创建
        self.mainMapView = MKMapView(frame:CGRect(x: 0, y: 60, width: Paramters.ScreenSize.width, height: Paramters.ScreenSize.height - 60))
        self.view.addSubview(self.mainMapView)
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //地图类型设置 - 标准地图
        
        self.mainMapView.mapType = MKMapType.standard
//        self.mainMapView.delegate = self
        //创建一个MKCoordinateSpan对象，设置地图的范围（越小越精确）
        let latDelta = 0.05
        let longDelta = 0.05
        //设置定位服务管理器代理
        locationManager.delegate = self
        //设置定位进度
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //更新距离
        locationManager.distanceFilter = 100
        ////发送授权申请
        locationManager.requestAlwaysAuthorization()
        if (CLLocationManager.locationServicesEnabled())
        {
            //允许使用定位服务的话，开启定位服务更新
            locationManager.startUpdatingLocation()
            print("定位开始")
        }
//         let currentLocationSpan:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
//        locationManager.startUpdatingLocation()
        //定义地图区域和中心坐标（
//        //使用当前位置
//        let center:CLLocation = locationManager.location!.coordinate
//        //使用自定义位置
////        let center:CLLocation = CLLocation(latitude: 32.029171, longitude: 118.788231)
//        let currentRegion:MKCoordinateRegion = MKCoordinateRegion(center: center.coordinate,
//                                                                  span: currentLocationSpan)
//
//        //设置显示区域
////        self.mainMapView.setRegion(currentRegion, animated: true)
//        self.mainMapView.showsUserLocation = true
//          self.locationManager.delegate = self
//          self.mainMapView.delegate = self
//        //创建一个大头针对象
//        let objectAnnotation = MKPointAnnotation()
//        //设置大头针的显示位置
//        objectAnnotation.coordinate = CLLocation(latitude: 32.029171,
//                                                 longitude: 118.788231).coordinate
//        //设置点击大头针之后显示的标题
//        objectAnnotation.title = "威信县人民医院"
//        //设置点击大头针之后显示的描述
//        objectAnnotation.subtitle = "威信县人民医院附近"
//        //添加大头针
//        self.mainMapView.addAnnotation(objectAnnotation)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
    
    
    
    //地理信息反编码
    func reverseGeocode(){
        var geoCoder: CLGeocoder = {
            return CLGeocoder()
        }()
        let latitude = 118//CLLocationDegrees(latitudeTF.text!) ?? 0
        let longitude = 32//CLLocationDegrees(longitudeTF.text!) ?? 0
        let loc1 = CLLocation(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
        geoCoder.reverseGeocodeLocation(loc1) { (pls: [CLPlacemark]?, error: Error?)  in
            if error == nil {
                
                guard let plsResult = pls else {return}
                let firstPL = plsResult.first
                 print("反地理编码成功",firstPL)
            }else {
                print("错误")
            }
        }
    }
    //CLLocationManager定位代理方法
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //获取最新的坐标
        let currLocation:CLLocation = locations.last!
        //获取经纬度
        let longitude = currLocation.coordinate.longitude
        let latitude = currLocation.coordinate.latitude
        //显示经纬度
        print("hello ")
        
    }
    
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("定位出错拉！！\(error)")
    }
    
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        print("地图缩放级别发送改变时")
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print("地图缩放完毕触法")
    }
    
    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        print("开始加载地图")
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        print("地图加载结束")
    }
    
    func mapViewDidFailLoadingMap(_ mapView: MKMapView, withError error: Error) {
        print("地图加载失败")
    }
    
    func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
        print("开始渲染下载的地图块")
    }
    
    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        print("渲染下载的地图结束时调用")
    }
    
    func mapViewWillStartLocatingUser(_ mapView: MKMapView) {
        print("正在跟踪用户的位置")
    }
    
    func mapViewDidStopLocatingUser(_ mapView: MKMapView) {
        print("停止跟踪用户的位置")
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        print("更新用户的位置")
        
    }
    
    func mapView(_ mapView: MKMapView, didFailToLocateUserWithError error: Error) {
        print("跟踪用户的位置失败")
    }
    
    func mapView(_ mapView: MKMapView, didChange mode: MKUserTrackingMode,
                 animated: Bool) {
        print("改变UserTrackingMode")
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay)
        -> MKOverlayRenderer {
            print("设置overlay的渲染")
            return MKPolylineRenderer()
    }
    
    private func mapView(mapView: MKMapView,
                         didAddOverlayRenderers renderers: [MKOverlayRenderer]) {
        print("地图上加了overlayRenderers后调用")
    }
    
    /*** 下面是大头针标注相关 *****/
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        print("添加注释视图")
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {
        print("点击注释视图按钮")
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("点击大头针注释视图")
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        print("取消点击大头针注释视图")
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 didChange newState: MKAnnotationViewDragState,
                 fromOldState oldState: MKAnnotationViewDragState) {
        print("移动annotation位置时调用")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FieldTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.flushShow()
        cell.textfield.placeholder = "北京市海淀区"
        cell.textLabel?.text = UserData.appshowtexts[11]
        cell.textfield.isEnabled = false
        
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
