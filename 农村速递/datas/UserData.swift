//
//  UserData.swift
//  农村速递
//
//  Created by 郭有超 on 2017/6/18.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import Foundation
import SwiftyJSON
class UserData: NSObject {
   
    var personmsg : UserMessage     = UserMessage()
    var editdata  : EditData        = EditData()
    static var ud : UserData        = UserData()
    var receiveaddress: AddressData = AddressData()
    var sendaddress   : AddressData = AddressData()
    var linkperson    : [ReceivePerson] = []
    var orderdatas    : [OrderData]     = []
    var verificationshows : [String]    = []
    static var appshowtexts : [String]    = []
    static var veriidcarddata = ViriIdCard()
    static var tabscene = TabBarScene()
    var credit    : Int         = 0
    public static var lantype  : String = "1"
    
    public static var showdics : [[String]] = []
    public static var showids  : [[Int]]    = []
    public static var fshowdics:[[String]] = []
    public static var fshowids :[[Int]] = []
    public static var placeholders:[String] = []
    public static var loginshows: Array<String>  = []
    public static var ordershows:    Array<String>  = []
    public static var ordershowids: [Int] = []
    public static var addreceiveshows : Array<String>  = []
    public static var addreceiveshowids : [Int]  = []
    public static var addreceiveaddressshows : Array<String>  = []
    public static var addreceiveaddresssshowids : [Int]  = []
    public static var newrepids                     : [Int] = []
    public static var newreptexts                   : [String] = []
    public static var senditemshows: Array<String> = []
    public static var senditemshowids: [Int] = []
    public static var aboutText = ""
    public static var servershowdics : [[String]] = []
    public static var servershowids  : [[Int]]    = []
    public var LifeBaseShowDics:   [[String]] = []
    public var LifeBaseShowIds :   [[Int]] = []
    public static var cur_login_id: String = ""
    public var LifeServerDatas: [[LifeServerData]] = []
    public static var NotifyDatas:Array<NotifyData> = []
    // 商品分类数据
    public var newshopclasssdatas:NSMutableDictionary = NSMutableDictionary()
    
    public static func getDictionaryFromJSONString(jsonString:String) ->NSDictionary{
        
        let jsonData:Data = jsonString.data(using: .utf8)!
        
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary()
    }
    
    static func getUD()->UserData{
        return ud
    }
    
//  添加新的新零售数据
    func addNewShopClasssData(key: String, shopclasssdata: ShopThingClasss){
        newshopclasssdatas.setValue(shopclasssdata, forKey: key)
    }
    
   // 判断该类型的数据是否已经存在
    func exitType(key:String) -> Bool{
        if (newshopclasssdatas.value(forKey: key) != nil){
            return true
        }
        return false
    }
    
    func getShopThingClasss(key:String) -> ShopThingClasss {
       
        return newshopclasssdatas.value(forKey: key) as! ShopThingClasss
    }
    
    override init() {
        super.init()
//        receiveaddress.addAddress(address: "云南省昭通市镇雄县花朗乡")
//        sendaddress.addAddress(address: "浙江省宁波市")
//        addOrder(id: 110520013, rcname: "王勇", mid: "王聪")
    }
    
    // 清空收获地址
    public func clearReceivePerson(){
        linkperson = []
    }
    
    // 清空收获地址
    public static func clearNotifyDatas(){
        NotifyDatas = []
    }
     
    public func getLifeBaseData()->[[String]]{
       return LifeBaseShowDics
    }
    
    public func getLifeServerDatas()->[[LifeServerData]]{
       return LifeServerDatas
    }
    
    // 得到联系人
    func getLinkPersonById(id: String) -> ReceivePerson {
        for person in linkperson {
            if person.id == id {
               return person
            }
        }
        return ReceivePerson()
    }
    
    // 得到地址
    func getAddressById(id: String) -> ReceiveAddressData {
        for address in receiveaddress.addresss {
            if address.id == id {
                return address
            }
        }
        return ReceiveAddressData()
    }
    
    //  添加收货人
    public func addPerson(name: String, phone1: String, phone2:String, id: String ,mainid: String ) {
        let person = ReceivePerson()
        person.name   = name
        person.phone1 = phone1
        person.phone2 = phone2
        person.id     = id
        person.mainid = mainid
        linkperson.append(person)
    }
    
    public func addOrder(id: String, rcname: String, mid:String) {
        let orderdata = OrderData()
        orderdata.id = id
        orderdatas.append(orderdata)
    }
    
    public static func writeDataToPath(data: NSDictionary, filename: String){
        let dic : String = NSHomeDirectory() + "/Documents/" + filename
        data.write(toFile: dic, atomically: true)
    }
    
    public static func readDataFromPath(filename: String) -> NSDictionary {
        let diaryList:String = NSHomeDirectory() + "/Documents/" + filename
        var listData: NSDictionary = NSDictionary()
        if(FileManager.default.fileExists(atPath: diaryList)){
           listData = NSDictionary(contentsOfFile: diaryList)!
        }
        
        return listData
    }
    
    public static func removeFile(filename: String) {
        let diaryList:String = NSHomeDirectory() + "/Documents/" + filename
        if(FileManager.default.fileExists(atPath: diaryList)){
            try! FileManager.default.removeItem(atPath: diaryList)
        }
    }
    
    public static func exitFile(filename: String) -> Bool {
        let diaryList:String = NSHomeDirectory() + "/Documents/" + filename
        if(FileManager.default.fileExists(atPath: diaryList)){
           return true
        }
        return false
    }
    
    // 将二维JSON转换成 二维数组
    public static func converJSONTOStringArray(jsonData: JSON) -> [[String]]{
        var data: Array<Array<String>> = []
        for (_,subJson):(String, JSON) in JSON(parseJSON:jsonData.rawString()!) {
            var tdata: Array<String> = []
            for (_,subJson1):(String, JSON) in subJson {
               tdata.append(subJson1.stringValue)
             }
             data.append(tdata)
        }
        return data
    }
    
    public static func converJSONTOIntArray(jsonData: JSON) -> [[Int]]{
        var data: Array<Array<Int>> = []
        for (_,subJson):(String, JSON) in JSON(parseJSON:jsonData.rawString()!) {
            var tdata: Array<Int> = []
            for (_,subJson1):(String, JSON) in subJson {
                tdata.append(subJson1.intValue)
            }
            data.append(tdata)
        }
        return data
    }
    
    public static func converJSONTOIntArray(jsonData: JSON) -> [Int]{
        var data: Array<Int> = []
        for (_,subJson):(String, JSON) in JSON(parseJSON:jsonData.rawString()!) {
            data.append(subJson.intValue)
        }
        return data
    }
    
    public static func converJSONTOStringArray(jsonData: JSON) -> [String]{
        var data: Array<String> = []
        for (_,subJson):(String, JSON) in JSON(parseJSON:jsonData.rawString()!) {
            data.append(subJson.stringValue)
        }
        return data
    }
    
    
}
