//
//  NoStoryBoardViewController.swift
//  VerifyApp
//
//  Created by yuwa on 2019/02/16.
//  Copyright © 2019 yuwa-seisakusho. All rights reserved.
//

import UIKit

/**
 * ストーリーボードなし検証画面
 */
class NoStoryBoardViewController: UIViewController {
    
    let label = UILabel()
    
    /**
     * Viewが始めて呼び出される時に一回だけ呼ばれる
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        label.text = "Hello World!"
        label.textAlignment = .center
        self.view.addSubview(label)
    }
    
    /**
     * ViewがSubViewをレイアウトした時に呼ばれる
     */
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // view.boundsは画面の大きさ
        // self.view.bounds.widthは画面の幅
        // self.view.bounds.heightは画面の高さ
        // frameもboundsも変数名で型はCGRect
        // viewの表示位置を確定させるには、view.frameに左上角の座標、および幅と高さをセットする（例）x:0,y:0,width:32,height:50
        label.frame = view.bounds
    }
    
    
}
