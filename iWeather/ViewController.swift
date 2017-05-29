//
//  ViewController.swift
//  iWeather
//
//  Created by Kien Nguyen Duc on 5/23/17.
//  Copyright © 2017 Kien Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lbl_city: UILabel!
    
    @IBOutlet weak var lbl_quote: UILabel!
    
    @IBOutlet weak var lbl_temp: UILabel!
    
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var lbl_type: UIButton!
    var quotes = ["Thương cho roi cho vọt. Ghét cho ngọt cho bùi.", "Quy định nào cũng có ngoại lệ, ngay cả quy định này.", "Không có gì giúp tiết kiệm thời gian và tiền bạc bằng tình yêu sét đánh ngay từ cái nhìn đầu tiên.", "Khi nói ít đi, bạn sẽ nghe thấy nhiều hơn.", "Nếu tự khoe khoang về cái gì, bạn sẽ thất bại về cái ấy."]
    var city = ["New York", "London", "Ha Noi","Tokyo", "Paris", "Berlin", "Quarta", "Bangkok"]
    var backgroundImage = ["Blood", "Moon", "Sun"]
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func btn_CtoF(_ sender: UIButton) {
        if (count == 0) {
            cTof()
            lbl_type.setTitle("F", for: .normal)
            return count = 1
        } else if (count == 1 ) {
            fToc()
            lbl_type.setTitle("C", for: .normal)
            return count = 0
        }
    }
    @IBAction func btn_refresh(_ sender: UIButton) {
        randomCity()
        randomBackground()
        getTemp()
        randomQuote()
        if ( count == 1) {
            let a = String(format:"%2.1f", (Double(lbl_temp.text!)!*1.8 + 32))
            lbl_temp.text = "\(a)"
        }
    }
    
    func randomCity() {
        let cityIndex = Int(arc4random_uniform(UInt32(city.count)))
        lbl_city.text = city[cityIndex]
    }
    
    func fToc(){
        let c = ((Double(lbl_temp.text!)! - 32) / 1.8 )
        lbl_temp.text = String(c)
    }
    
    func cTof() {
        let f = String(format:"%2.1f", (Double(lbl_temp.text!)!*1.8 + 32))
        lbl_temp.text = String(f)
    }
    
    func tempRandom() -> Double {
        return Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX)
    }
    
    func randomBackground() {
        let rb = Int(arc4random_uniform(UInt32(backgroundImage.count)))
        background.image = UIImage.init(named: backgroundImage[rb])
    }
    
    func getTemp() {
        let randomNumber = String(format:"%2.1f", tempRandom()) //Lấy 1 số sau dấu phẩy
        lbl_temp.text = randomNumber
        
            }
    
    func randomQuote() {
        let qouteIndex = Int(arc4random_uniform(UInt32(quotes.count)))
        lbl_quote.text = quotes[qouteIndex]
    }
}

