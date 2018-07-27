//
//  ViewController.swift
//  DTShareKitDemo
//
//  Created by 青山 on 16/5/9.
//  Copyright © 2016年 QingShan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("isDingTalkInstalled: \(DTOpenAPI.isDingTalkInstalled())")
        print("isDingTalkSupportOpenAPI: \(DTOpenAPI.isDingTalkSupportOpenAPI())")
        print("appStoreURLOfDingTalk: \(DTOpenAPI.appStoreURLOfDingTalk())")
        print("openAPIVersion: \(DTOpenAPI.openAPIVersion())")
    }
    
    @IBAction private func openDingTalk(sender: UIButton) {
        
        print("openDingTalk: \(DTOpenAPI.openDingTalk())")
    }
    
    @IBAction private func shareTextToDingTalk(sender: UIButton) {
        
        let textObject = DTMediaTextObject()
        textObject.text = "Hi DingTalk."
        
        let mediaMessage = DTMediaMessage()
        mediaMessage.mediaObject = textObject
        
        let sendMessageReq = DTSendMessageToDingTalkReq();
        sendMessageReq.message = mediaMessage
        
        let result = DTOpenAPI.sendReq(sendMessageReq)
        if result {
            print("Text 发送成功")
        } else {
            print("Text 发送失败")
        }
    }

    @IBAction private func shareImageToDingTalk(sender: UIButton) {
        
        let imageObject = DTMediaImageObject()
        imageObject.imageURL = "https://img.alicdn.com/tps/TB1dagdIpXXXXc5XVXXXXXXXXXX.jpg"
        
        // Or
        // imageObject.imageData = NSData()
        
        let mediaMessage = DTMediaMessage()
        mediaMessage.mediaObject = imageObject
        
        let sendMessageReq = DTSendMessageToDingTalkReq()
        sendMessageReq.message = mediaMessage
        
        let result = DTOpenAPI.sendReq(sendMessageReq)
        if result {
            print("Image 发送成功")
        } else {
            print("Image 发送失败")
        }
    }

    @IBAction private func shareWebToDingTalk(sender: UIButton) {
        
        let webObject = DTMediaWebObject()
        webObject.pageURL = "http://www.dingtalk.com/"
        
        let mediaMessage = DTMediaMessage()
        mediaMessage.title = "钉钉"
        mediaMessage.thumbURL = "https://static.dingtalk.com/media/lALOGp__Tnh4_120_120.png"
        // Or Set a image data which less than 32K.
        // mediaMessage.thumbData = UIImagePNGRepresentation(UIImage(named: "open_icon"))
        
        mediaMessage.messageDescription = "钉钉，是一个工作方式。为企业量身打造统一办公通讯平台"
        mediaMessage.mediaObject = webObject
        
        let sendMessageRequest = DTSendMessageToDingTalkReq()
        sendMessageRequest.message = mediaMessage
        
        let result = DTOpenAPI.sendReq(sendMessageRequest)
        if result {
            print("Link 发送成功")
        } else {
            print("Link 发送失败")
        }
    }
}

