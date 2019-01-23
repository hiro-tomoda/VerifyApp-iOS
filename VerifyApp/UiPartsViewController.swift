//
//  UiPartsViewController.swift
//  VerifyApp
//
//  Created by yuwa on 2019/01/22.
//  Copyright © 2019 yuwa-seisakusho. All rights reserved.
//

import UIKit

/**
 * UI部品検証画面
 */
class UiPartsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    // PickerViewに表示する文字列
    let dataList = ["テスト1","テスト2","テスト3"]
    
    /**
     * Viewが始めて呼び出される時に一回だけ呼ばれる
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // デリゲートの設定
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }
    
    /**
     * PickerViewの列の数
     */
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    /**
     * PickerViewの行数、リストの数
     */
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataList.count
    }
    
    /**
     * PickerViewの最初の表示
     */
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataList[row]
    }

    /**
     * PickerViewが選択された時の処理
     */
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(dataList[row])
    }


    
    
    
    
    
    
}
