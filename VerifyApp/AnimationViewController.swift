//
//  AnimationViewController.swift
//  VerifyApp
//
//  Created by yuwa on 2019/02/23.
//  Copyright © 2019 yuwa-seisakusho. All rights reserved.
//

import UIKit
import QuartzCore

/**
 * アニメーション検証画面
 */
class AnimationViewController: ViewController {
    
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // キーフレームアニメーション（順番に実行）
        UIView.animateKeyframes(withDuration: 5.0, delay: 0.0, options: [], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 2.5, animations: {
                // 同時実行
                self.label.center.y += 100.0
                self.label.center.x += 100.0
            })
        
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 2.5, animations: {
                self.label.alpha = 0
            })
            
        }
        , completion: nil)
    }
    
    
    
    
}
