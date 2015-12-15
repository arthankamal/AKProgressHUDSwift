//
//  ProgressHUD.swift
//  ResearchKitRest
//
//  Created by Admin on 9/23/15.
//  Copyright © 2015 DreamOrbit. All rights reserved.
//

import UIKit

class AKProgressHUD {

    static let sharedInstance = AKProgressHUD()
    private var progressView: ProgressHUDView
    private init() {
        progressView = ProgressHUDView(frame: (UIApplication.sharedApplication().keyWindow?.frame)!)
        progressView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        if let window: UIWindow = UIApplication.sharedApplication().keyWindow {
            window.addSubview(progressView)
        }
    }
    
    func showProgress(forView: AnyObject) {
        progressView.hidden = false
        progressView.showProgressHUDView(forView)
    }
    
    private func hideProgress(forView: AnyObject) {
        progressView.hidden = true
        progressView.hideProgressHUDView(forView)
    }
    
    
}

private class ProgressAlertController : UIAlertController {
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private class ProgressHUDView : UIView {
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.White)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(activityIndicator)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func showProgressHUDView (forViewController: AnyObject) {
        if let view: UIView = forViewController.view {
            activityIndicator.center = view.center
        }
//        activityIndicator.center = forViewController.view!!.center
        activityIndicator.startAnimating()
    }
    
    private func hideProgressHUDView (forViewController: AnyObject) {
        activityIndicator.stopAnimating()
    }

}