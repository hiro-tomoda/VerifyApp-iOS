//
//  TabViewController.swift
//  VerifyApp
//
//  Created by yuwa on 2019/01/21.
//  Copyright © 2019 yuwa-seisakusho. All rights reserved.
//

import UIKit

/**
 * タブバー検証画面
 */
class TabViewController: UIViewController, UITabBarDelegate {
    
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var tabBar: UITabBar!
    
    /**
     * Viewが始めて呼び出される時に一回だけ呼ばれる
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // デリゲート先を自分に設定
        tabBar.delegate = self
    }
    
    /**
     * タブバー選択時の処理
     */
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // 各ボタンのtabにセットした値で処理を分ける
        switch item.tag {
        case 0:
            message.text = "Home"
        case 1:
            message.text = "Dashboard"
        case 2:
            message.text = "Notification"
        default:
            return
        }
    }
}
