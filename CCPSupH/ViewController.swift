//
//  ViewController.swift
//  CCPSupH
//
//  Created by Ceair on 17/3/14.
//  Copyright © 2017年 ceair-imac. All rights reserved.
//

import UIKit

extension UIView {

    /*
     自适应高度
     exH:下边距
     */
    func adaptionH(_ exH : CGFloat = 0) {
        let hs : Array<CGFloat> = self.subviews.map({$0.frame.maxY})
        var f = self.bounds
        f.size.height = hs.max()! + exH
        self.bounds = f
    }
    
    /*
     自适应宽度
     exW:right-margin
     */
    func adaptionW(_ exW : CGFloat = 0) {
        let hs : Array<CGFloat> = self.subviews.map({$0.frame.maxX})
        var f = self.bounds
        f.size.width = hs.max()! + exW
        self.bounds = f
    }
    
    /*
     自适应大小
     exWH:$0 = right-margin,$1 = bottom-margin
     */
    func adaptionWH(_ exWH : (CGFloat,CGFloat) = (0,0)) {
        self.adaptionW(exWH.0)
        self.adaptionH(exWH.1)
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let sv = UIView()
        sv.backgroundColor = UIColor.red
        sv.bounds = CGRect.init(x: 0, y: 0, width: 300, height: 10)
        sv.center = view.center
        view.addSubview(sv)
        let colors = [UIColor.white,UIColor.orange,UIColor.purple,UIColor.green,UIColor.brown]
        for i in 0 ..< 5 {
            let v = UIView.init(frame: CGRect.init(x: 10, y: 10 + 60 * i, width: 130, height: 50))
            v.backgroundColor = colors[i]
            v.layer.cornerRadius = 5.0
            sv.addSubview(v)
        }
        for i in 0 ..< 5 {
            let v = UIView.init(frame: CGRect.init(x: 160, y: 10 + 60 * i, width: 130, height: 50))
            v.backgroundColor = colors[i]
            v.layer.cornerRadius = 5.0
            sv.addSubview(v)
        }
        
//        sv.adaptionH(10)
//        sv.adaptionW(10)
        sv.adaptionWH((10,10))
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

