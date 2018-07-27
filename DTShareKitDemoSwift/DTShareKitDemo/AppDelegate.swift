//
//  AppDelegate.swift
//  DTShareKitDemo
//
//  Created by 青山 on 16/5/9.
//  Copyright © 2016年 QingShan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, DTOpenAPIDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        DTOpenAPI.registerApp("dingoak5hqhuvmpfhpnjvt")
        
        return true
    }

    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return DTOpenAPI.handleOpenURL(url, delegate: self);
    }
    
    func onReq(req: DTBaseReq!) {
        
    }
    
    func onResp(resp: DTBaseResp!) {
        let alertVC = UIAlertController(title: "ErrorCode: \(resp.errorCode.rawValue)",
                                        message: "ErrorMsg: \(resp.errorMessage)",
                                        preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "好的", style: UIAlertActionStyle.Default, handler: nil)
        
        alertVC.addAction(okAction)
        
        self.window?.rootViewController?.presentViewController(alertVC, animated: true, completion: nil)
    }
}

