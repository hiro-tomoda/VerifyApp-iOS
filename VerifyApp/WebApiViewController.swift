//
//  WebApiViewController.swift
//  VerifyApp
//
//  Created by yuwa on 2019/01/11.
//  Copyright © 2019 yuwa-seisakusho. All rights reserved.
//

import UIKit

class WebApiViewController: UIViewController {
    
    // WebAPIのURL 張子なしにしようとしたらapacheのhtaccessの設定が必要と思われる
    let API_URL = "http://133.167.108.164/api/verify/aisatu.php"
    
    // HTTPメソッド
    let GET_METHOD = "GET"
    let POST_METHOD = "POST"
    
    @IBOutlet weak var result: UILabel!
    
    /**
     * Viewが始めて呼び出される時に一回だけ呼ばれる
     */
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /**
     * GETボタン押下時の処理
     */
    @IBAction func getButton(_ sender: UIButton) {
        // URL設定
        let queryParam = "name=共田"
        let url = API_URL + "?" + queryParam
        let encUrl = url.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)! // URLに全角文字が含まれる場合の対応
        let apiURL = URL(string: encUrl)!
    
        // リクエスト設定
        var request = URLRequest(url: apiURL)
        request.httpMethod = GET_METHOD
        
        // HTTP通信タスク設定
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            
            print("HTTPレスポンス受取")
            
            // 処理エラーの場合
            if error != nil {
                print(error!)
                return
            }
            
            // レスポンスデータが存在する場合
            if data != nil {
                let text = String(data: data!, encoding: String.Encoding.utf8)
                print(text!)
                
                // メインスレッドでUI操作
                DispatchQueue.main.async(execute: {
                    do {
                        // レスポンスをJSONに変換
                        let json = try JSONSerialization.jsonObject(with: data!) as! [String:Any]
                        // JSONから結果文字列を取得
                        let result = json["result"] as! String
                        self.result.text = result
                        
                    } catch {
                        self.result.text = "JSON変換に失敗しました"
                    }
                })
            }
        })
        
        // HTTP通信実行（非同期処理：別スレッド）
        print("HTTPリクエスト実行")
        task.resume()
    
    }
    
    /**
     * POSTボタン押下時の処理
     */
    @IBAction func postButton(_ sender: UIButton) {
        // URL設定
        let url = API_URL
        let encUrl = url.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)! // URLに全角文字が含まれる場合の対応
        let apiURL = URL(string: encUrl)!
        
        // リクエスト設定
        let paramArray: [String:Any] = ["name":"共田"]
        var request = URLRequest(url: apiURL)
        request.httpMethod = POST_METHOD
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: paramArray, options: JSONSerialization.WritingOptions.prettyPrinted) // 整形して配列からJSONに変換
        } catch (let e) {
            print(e)
        }
     
        // HTTP通信タスク設定
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            
            print("HTTPレスポンス受取")
            
            // 処理エラーの場合
            if error != nil {
                print(error!)
                return
            }
            
            // レスポンスデータが存在する場合
            if data != nil {
                let text = String(data: data!, encoding: String.Encoding.utf8)
                print(text!)
                
                // メインスレッドでUI操作
                DispatchQueue.main.async(execute: {
                    do {
                        // レスポンスをJSONに変換
                        let json = try JSONSerialization.jsonObject(with: data!) as! [String:Any]
                        // JSONから結果文字列を取得
                        let result = json["result"] as! String
                        self.result.text = result
                        
                    } catch {
                        self.result.text = "JSON変換に失敗しました"
                    }
                })
            }
        })
        
        // HTTP通信実行（非同期処理：別スレッド）
        print("HTTPリクエスト実行")
        task.resume()
    }

}
