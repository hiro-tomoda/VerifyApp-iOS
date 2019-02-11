//
//  CustomView.swift
//  VerifyApp
//
//  Created by yuwa on 2019/02/09.
//  Copyright © 2019 yuwa-seisakusho. All rights reserved.
//

import Foundation
import UIKit

class CustomView: UIView {
    
    // コードから生成した時の初期化処理
    override init(frame: CGRect) {
        super.init(frame: frame)
        initXib()
    }
    
    // ストーリーボードで配置した時の初期化処理
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initXib()
    }
    
    // XIBファイルを読み込んでViewに重ねる
    func initXib() {
        
        
        guard let view = UINib(nibName: "CustomView", bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else {
            return
        }
        
        view.frame = self.bounds
        
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        self.addSubview(view)
        
        
    }
    
    
    
    
}
