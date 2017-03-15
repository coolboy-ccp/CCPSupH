//
//  CCPAdaptionSup.swift
//  CCPSupH
//
//  Created by Ceair on 17/3/15.
//  Copyright © 2017年 ceair-imac. All rights reserved.
//

import UIKit

fileprivate var extractWH : (CGFloat, CGFloat) = (0, 0)

//此方法用于和原生方法交换
func exchange(of cls : AnyClass, os : Selector, ps : Selector) {
    let om = class_getInstanceMethod(cls, os)
    let pm = class_getInstanceMethod(cls, ps)
    let isAdd = class_addMethod(cls, os, method_getImplementation(pm), method_getTypeEncoding(pm))
    if isAdd {
        class_replaceMethod(cls, ps, method_getImplementation(om), method_getTypeEncoding(om))
    }
    else {
        method_exchangeImplementations(om, pm)
    }
}

extension UIView {
    
    /*
     使用此方法初始化后,无需重复调用adaptionWH
     exWH:$0 -> width,$1 -> height
     */
    convenience init(frame : CGRect, exWH : (CGFloat,CGFloat) = (0,0)) {
        self.init(frame:frame)
        extractWH = exWH
        //交换方法,每次添加新subview就可以重新计算高度
        let os = #selector(UIView.addSubview(_:))
        let rs = #selector(UIView.ccp_addSubview(_:))
        exchange(of: UIView.self, os: os, ps: rs)
    }
    
    /*-----------------------此方法在普通使用系统init方法时需要在每次添加subview时调用--------------------*/
    
    /*
     自适应大小
     exWH:$0 = right-margin,$1 = bottom-margin
     */
    func adaptionWH(_ exWH : (CGFloat,CGFloat) = (0,0)) {
        self.adaptionW(exWH.0)
        self.adaptionH(exWH.1)
    }
    
    /*
     自适应高度
     exH:下边距
     */
   private func adaptionH(_ exH : CGFloat = 0) {
        let hs : Array<CGFloat> = self.subviews.map({$0.frame.maxY})
        var f = self.bounds
        f.size.height = hs.max()! + exH
        self.bounds = f
    }
    
    
    /*
     自适应宽度
     exW:right-margin
     */
    private func adaptionW(_ exW : CGFloat = 0) {
        let hs : Array<CGFloat> = self.subviews.map({$0.frame.maxX})
        var f = self.bounds
        f.size.width = hs.max()! + exW
        self.bounds = f
    }
    
    //替换addSubview方法
    func ccp_addSubview(_ view: UIView) {
        self.ccp_addSubview(view)
        let ws = self.subviews.map({$0.frame.maxX})
        let hs = self.subviews.map({$0.frame.maxY})
        let newW = ws.max() ?? 0
        let newH = hs.max() ?? 0
        var f = self.bounds
        f.size.width = newW + extractWH.0
        f.size.height = newH + extractWH.1
        self.bounds = f
    }
    
}
