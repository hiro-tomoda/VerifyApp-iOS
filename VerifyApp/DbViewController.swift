//
//  DbViewController.swift
//  VerifyApp
//
//  Created by yuwa on 2019/01/14.
//  Copyright © 2019 yuwa-seisakusho. All rights reserved.
//

import UIKit
import RealmSwift // podでインストールが必要

/**
 *  DB検証画面
 */
class DbViewController: UIViewController {
    
    var realm: Realm!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    /**
     * Viewが始めて呼び出される時に一回だけ呼ばれる
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Realmオブジェクトを生成
        realm = try! Realm()
        
        // Realmデータベースファイルの場所を出力
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        // ラベルの設定
        self.resultLabel.numberOfLines = 0 // 表示可能最大数を制限なし
    }
    
    /**
     * SELECTボタン押下時の処理
     */
    @IBAction func selectButton(_ sender: UIButton) {
        self.resultLabel.text = ""
        
        // テーブルから全レコードを取得
        let verifyModels = realm.objects(VerifyModel.self)
        
        // 日付フォーマット設定
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        // レコードの数だけ繰り返す
        for model in verifyModels {
            
//            print(model.id)
//            self.resultLabel.text = "test\ntest"
            
            // 処理結果に出力
            // String(xxx)でも文字列変換できるが、小数やマイナス値でエラーになる
            self.resultLabel.text?.append(model.id.description + ","  + model.name + "," + model.age.description + "," + dateFormatter.string(from: model.date) + "\n")
        }
        
//        // ラベルのサイズを調整
//        self.resultLabel.sizeToFit()
    }

    /**
     * INSERTボタン押下時の処理
     */
    @IBAction func InsertButton(_ sender: UIButton) {
        // DBに登録されているIDの最大値を取得する
        let realmResult = self.realm.objects(VerifyModel.self).sorted(byKeyPath: "id", ascending: false).first
        var id:Int!
        if realmResult != nil {
            id = realmResult!.id + 1
        } else {
            id = 0
        }
        
        // テーブルモデルクラスを作成
        let model = VerifyModel()
        model.id = id
        model.name = "共田"
        model.age = 39
        model.date = Date()
        
        // トランザクション開始
        try! realm.write {
            // レコード登録
            realm.add(model)
            self.resultLabel.text = "DB登録に成功しました。"
        }
    }
  
    /**
     * UPDATEボタン押下時の処理
     */
    @IBAction func updateButton(_ sender: UIButton) {
        // テーブルから全レコードを取得
        let verifyModels = realm.objects(VerifyModel.self)
        
        // 全レコードの日時を更新 トランザクションの中でプロパティに値を代入する
        for model in verifyModels {
            // トランザクション開始
            try! realm.write {
                model.date = Date()
                self.resultLabel.text = "DB更新に成功しました。"
            }
        }
    }
    
    /**
     * DELETEボタン押下時の処理
     */
    @IBAction func deleteButton(_ sender: UIButton) {
        // トランザクション開始
        try! realm.write {
            realm.deleteAll()
            self.resultLabel.text = "DB削除に成功しました。"
        }
    }
    
}
