//
//  WebViewController.swift
//  VerifyApp
//
//  Created by yuwa on 2019/01/18.
//  Copyright © 2019 yuwa-seisakusho. All rights reserved.
//

import UIKit
import WebKit // Webkit.frameworkをライブラリに追加していないとエラーになる

/**
 * WebView検証画面
 */
class WebViewController: UIViewController, WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler {
    
    var webView: WKWebView!
    
    /**
     * viewDidLoadの前に呼び出される
     */
    override func loadView() {
        // ストーリーボードのWebKitViewからビューをコネクトすると画面が真っ黒になるので、公式ドキュメント通りの実装にする
        let webConfiguration = WKWebViewConfiguration()
        
        // Javascriptからネイティブの関数を呼び出すのに必要な設定
        let userController = WKUserContentController()
        userController.add(self, name:"android")
        webConfiguration.userContentController = userController
        
        // WebView設定
        webView = WKWebView(frame: CGRect.zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self

        view = webView
    }
    
    /**
     * Viewが始めて呼び出される時に一回だけ呼ばれる
     */
    override func viewDidLoad() {
        super.viewDidLoad()

        // URL設定
        let url = URL(string: "http://133.167.108.164/webview.html")
        let request = URLRequest(url: url!)

        // Webページ読み込み
        webView.load(request)
    }
    
    /**
     * Webページ読み込み開始
     */
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("遷移開始")
    }

    /**
     * Webページ読み込み終了
     */
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // HTML側のJavascript呼び出し
        print("Javascript実行")
        webView.evaluateJavaScript("outputTextJs('ネイティブから渡した値')", completionHandler: {(object, error) -> Void in
                    print(object!)
        })
        print("遷移終了")
    }
    
    /**
     * HTML側でJavascriptが実行された場合の処理
     * Androidと違い、ネイティブからJavascriptに戻り値を返すことはできなそうなので、もう一度Javascriptを呼ぶことで同じことができると思われる
     */
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("HTMLから呼ばれた")
        if message.name == "android" {
            print(message.body)
        }
    }
    
}
