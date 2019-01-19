//
//  CalendarViewController.swift
//  VerifyApp
//
//  Created by yuwa on 2019/01/19.
//  Copyright © 2019 yuwa-seisakusho. All rights reserved.
//

import UIKit
import FSCalendar // podでインストールが必要
import CalculateCalendarLogic // podでインストールが必要

/**
 * カレンダー検証画面
 */
class CalendarViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {

    @IBOutlet weak var calendar: FSCalendar!
    
    @IBOutlet weak var dateText: UILabel!
    
    /**
     * Viewが始めて呼び出される時に一回だけ呼ばれる
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // デリゲートの設定
        self.calendar.delegate = self
        self.calendar.dataSource = self
        
        // 曜日を日本語にする
        self.calendar.calendarWeekdayView.weekdayLabels[0].text = "日"
        self.calendar.calendarWeekdayView.weekdayLabels[1].text = "月"
        self.calendar.calendarWeekdayView.weekdayLabels[2].text = "火"
        self.calendar.calendarWeekdayView.weekdayLabels[3].text = "水"
        self.calendar.calendarWeekdayView.weekdayLabels[4].text = "木"
        self.calendar.calendarWeekdayView.weekdayLabels[5].text = "金"
        self.calendar.calendarWeekdayView.weekdayLabels[6].text = "土"
    }
    
    /**
     * 日付が押下された場合の処理
     */
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy年MM月dd日"
//        dateText.text = dateFormatter.string(from: date)
        
        let gregorian = Calendar(identifier: .gregorian)
        let year = gregorian.component(.year, from: date)
        let month = gregorian.component(.month, from: date)
        let day = gregorian.component(.day, from: date)
        dateText.text = String(year) + "年" + String(month) + "月" + String(day) + "日"
        
    }
    
}
