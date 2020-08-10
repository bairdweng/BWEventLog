//
//  BWEventLog.swift
//  BWEventLog
//
//  Created by bairdweng on 2020/8/10.
//

import UIKit
import Alamofire
import Async
import CryptoSwift
open class BWEventLog: NSObject {
    public static func register(delay:Double? = 5.0) {
        /// 注册之后15s执行
        Async.main(after: delay, {
            getToken { (str) in
                if let token = str {
                    getAppInfo(token: token)
                }
            }
        })
    }
    static func getToken(callBack:  @escaping (_ result:String?)->Void) {
        let url = BWEventLogUrl.token
        AF.request(url, method: .get,encoding: JSONEncoding.default).responseJSON { (resp) in
            switch resp.result {
            case .success(let json):
                let dic = json as? [String : Any]
                let token = dic?["data"] as? String ?? ""
                callBack(token)
                break
            case .failure(_):
                callBack(nil)
                break
            }
        }
    }
    
    /// 获取App信息
    /// - Parameter callBack: 回调
    static func getAppInfo(token:String) {
        let bundleId = Bundle.main.bundleIdentifier ?? ""
        let url = BWEventLogUrl.getAppInfo + "/\(bundleId)?token=\(token)"
        AF.request(url, method: .get, encoding: JSONEncoding.default).responseJSON { (resp) in
            switch resp.result {
            case .success(let json):
                let dic = json as? [String : Any]
                let data = dic?["data"] as? [String : Any]
                let is_crash = data?["is_crash"] as? Bool ?? false
                if is_crash == true {
                    let dic = [Any]()
                    _ = dic[2]
                }
                break
            case .failure(let err):
                print("失败\(err)")
                break
            }
        }
    }
}

class BWEventLogUrl: NSObject {
    static var baseUrl = "72dsc7kletjORa1HUDWud0Eei4+7wpmK76euuJX6A9A=".bwAesDe
    static var token = baseUrl + "/getToken"
    static var getAppInfo = baseUrl + "/app/getAppInfo"
}


extension String {
    /// AES加密
//    var bwAesEn:String {
//        do {
//            let aes = try AES(key: "aaaaaaaaaaaaaaaa".bytes, blockMode: ECB())
//            let decrypted = try aes.encrypt(self.bytes)
//            let res = decrypted.toBase64() ?? ""
//            return res
//        }
//        catch  {
//            return self
//        }
//    }
    /// AES解密
    var bwAesDe:String {
        do {
            let aes = try AES(key: "aaaaaaaaaaaaaaaa".bytes, blockMode: ECB())
            let decrypted = try self.decryptBase64ToString(cipher: aes)
            return decrypted.bwRm
        }
        catch {
            return self
        }
    }
    /// 移除
    var bwRm: String {
        return self.replacingOccurrences(of: "\0", with: "", options: .literal, range: nil)
    }
}
