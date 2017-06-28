//
//  Permiters.swift
//  农村速递
//
//  Created by 郭有超 on 2017/6/20.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import Foundation

import AVFoundation
import Photos
import AssetsLibrary

class Permissions: NSObject {
    
    // 相机权限
    static func hasGetCameraPermission()->Bool
    {
        let authStaus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        if authStaus != AVAuthorizationStatus.denied
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    // 获取相册权限
    static func hasGetPhotoPermission()->Bool
    {
        var bResult = false
        if #available(iOS 8.0, *) {
            if ( PHPhotoLibrary.authorizationStatus() != PHAuthorizationStatus.denied )
            {
                bResult = true
            }
        } else {
            if( ALAssetsLibrary.authorizationStatus() != ALAuthorizationStatus.denied )
            {
                bResult = true
            }
        }
        return bResult
    }
    
}
