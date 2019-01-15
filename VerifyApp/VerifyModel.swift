//
//  VerifyModel.swift
//  VerifyApp
//
//  Created by yuwa on 2019/01/14.
//  Copyright © 2019 yuwa-seisakusho. All rights reserved.
//

import Foundation
import RealmSwift

/**
 * 検証テーブルモデルクラス
 */
class VerifyModel: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var age = 0
    @objc dynamic var date = Date()
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
