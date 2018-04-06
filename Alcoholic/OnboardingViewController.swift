//
//  OnboardingViewController.swift
//  Alcoholic
//
//  Created by Varshit Rajput on 24/03/17.
//  Copyright © 2017 Varshit Rajput. All rights reserved.
//

import UIKit
import PaperOnboarding
import AVFoundation

class OnboardingViewController: UIViewController, PaperOnboardingDataSource,PaperOnboardingDelegate {
    
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        
        let backgroundColor1 = UIColor(red: 217/255, green: 72/255, blue: 89/255, alpha: 1)
        let backgroundColor2 = UIColor(red: 106/255, green: 166/255, blue: 211/255, alpha: 1)
        let backgroundColor3 = UIColor(red: 168/255, green: 200/255, blue: 78/255, alpha: 1)
        
        let titleFont1 = UIFont(name: "AvenirNext-Bold", size:22)!
        let descriptionFont1 = UIFont(name: "AvenirNext-Regular", size: 18)!
        
        
        return [
            OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "Create"),
                               title: "Create Your Startup",
                               description:"We offer a platform where you can present your startup to the investor.",
                               pageIcon:#imageLiteral(resourceName: "Create") ,
                               color: backgroundColor1,
                               titleColor: UIColor.white,
                               descriptionColor: UIColor.white,
                               titleFont: titleFont1,
                               descriptionFont: descriptionFont1),
                
                OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "Present"),
                                   title: "Pitch Your Idea !",
                                   description: "Show a powerful and highly sophisticated presentation to the investor in order to provide exposure to your billion dollar idea.",
                                   pageIcon:#imageLiteral(resourceName: "Present") ,
                                   color:backgroundColor2,
                                   titleColor: UIColor.white,
                                   descriptionColor: UIColor.white,
                                   titleFont: titleFont1,
                                   descriptionFont: descriptionFont1),
                
                OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "Invest"),
                                   title: "Get Invested or Make Investment",
                                   description:"Startup can lure investor for their startup and Investor will have a secure and safe platform to invest in the hotshot Startups",
                                   pageIcon:#imageLiteral(resourceName: "Invest"),
                                   color: backgroundColor3,
                                   titleColor: UIColor.white,
                                   descriptionColor: UIColor.white,
                                   titleFont: titleFont1,
                                   descriptionFont: descriptionFont1)
            ][index]
    }
    




    @IBOutlet var onboardingView: onboarding!


    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingView.delegate=self
        onboardingView.dataSource=self
        }


    
    @IBOutlet weak var getStarted: UIButton!
   
    func onboardingItemsCount() -> Int {
        return 3
    }

    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {

    }
    func onboardingWillTransitonToIndex(_ index: Int) {
        print(index)
        if index==1{
            if self.getStarted.alpha == 1.0{
                UIView.animate(withDuration: 0.4, animations: {
                    self.getStarted.alpha=0
                })
            }
        }
    }
    func onboardingDidTransitonToIndex(_ index: Int) {
        print(index)
        if index==2{
            print("block Executed")
            UIView.animate(withDuration: 0.4 , animations: {
                self.getStarted.alpha=1.0
            })
        }
    }
    @IBAction func sendButton(_ sender: Any) {
        performSegue(withIdentifier: "send1", sender: self)
    }
    
}
