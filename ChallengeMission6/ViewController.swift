//
//  ViewController.swift
//  ChallengeMission6
//
//  Created by 신상우 on 2020/04/27.
//  Copyright © 2020 SangWoo Shin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    static let sstrign = ""
    let timeSelector: Selector = #selector(updateTime(_:))
    let timeInterval = 1.0
    var timer: Timer!
    lazy var alaramTime = "\(self.timeInterval)"
    var stop = false
    @IBOutlet var currentTime: UILabel!
    @IBOutlet var choiceTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let userInfo: Dictionary<String, Int> = ["key":5]
        self.timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(updateTime(_:)), userInfo: userInfo, repeats: true)
        
    }
    
    @IBAction func datePickerView(_ sender: UIDatePicker) {
        let datePicker = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm aaa"
        choiceTime.text = "선택시간 : " +  formatter.string(from:datePicker.date)
        alaramTime = formatter.string(from: datePicker.date)
        
    }
    
    @objc func testButton(_ sender: UIButton) {
        self.timer.invalidate()
        self.timer = nil
        
        let viewController: ViewController = ViewController()
        self.present(viewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func updateTime(_ timer: Timer) {
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm aaa"
        currentTime.text = "현재시간 : " + formatter.string(from: date)
        let testTime = formatter.string(from: date)
        if testTime == self.alaramTime {
            if !stop {
            let alertControl = UIAlertController(title: "알림", message: "설정된 시간입니다!!!", preferredStyle: UIAlertController.Style.alert)
            let alertAction = UIAlertAction(title: "네,알겠습니다.", style:UIAlertAction.Style.default, handler:{ACTION in self.stop = true})
            alertControl.addAction(alertAction)
            present(alertControl,animated: true, completion: nil)
            }
            
        } else {
            stop = false
        }
    }
    
}

