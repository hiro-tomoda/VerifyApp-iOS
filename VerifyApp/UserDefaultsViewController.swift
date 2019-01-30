//
//  UserDefaultsViewController.swift
//  VerifyApp
//
//  Created by yuwa on 2019/01/25.
//  Copyright © 2019 yuwa-seisakusho. All rights reserved.
//

import UIKit

/**
 * ユーザデフォルト検証画面
 */
class UserDefaultsViewController: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    
    /**
     * Viewが始めて呼び出される時に一回だけ呼ばれる
     */
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /**
     * 保存ボタン押下時の処理
     */
    @IBAction func save(_ sender: Any) {
        // ユーザーデフォルトを参照する
        let defaults = UserDefaults.standard
        defaults.set("Hello UserDefaults!", forKey: "key")
        label.text = "ユーザーデフォルトに値を保存しました"
    }
    
    /**
     * 読込ボタン押下時の処理
     */
    @IBAction func read(_ sender: Any) {
        // ユーザーデフォルトを参照する
        let defaults = UserDefaults.standard
        label.text = defaults.string(forKey: "key")
    }
    
    /**
     * 削除ボタン押下時の処理
     */
    @IBAction func remove(_ sender: Any) {
        // ユーザーデフォルトを参照する
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "key")
        label.text = "ユーザーデフォルトに値を削除しました"
    }
    
    
}
