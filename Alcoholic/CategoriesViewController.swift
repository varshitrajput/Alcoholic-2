//
//  CategoriesViewController.swift
//  Alcoholic
//
//  Created by Varshit Rajput on 26/03/17.
//  Copyright © 2017 Varshit Rajput. All rights reserved.
//

import UIKit
var entry = "nil"
var search2 = [Episode]()
var image = UIImage(named: "vodka.png")


class CategoriesViewController: UIViewController {



    var menuShowing = false
   

    @IBOutlet weak var banner: UIImageView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button6: UIButton!

    var episodes = [Episode]()

    override func viewDidLoad() {
        super.viewDidLoad()
        banner.layer.shadowColor = UIColor.black.cgColor
        banner.layer.shadowOffset = CGSize(width: 0, height: 0)
        banner.layer.shadowOpacity = 0.8
        banner.layer.shadowRadius = 5



        button1.layer.shadowColor = UIColor.black.cgColor
        button1.layer.shadowOffset = CGSize(width: 0, height: 0)
        button1.layer.shadowOpacity = 0.8
        button1.layer.shadowRadius = 5

        button2.layer.shadowColor = UIColor.black.cgColor
        button2.layer.shadowOffset = CGSize(width: 0, height: 0)
        button2.layer.shadowOpacity = 0.8
        button2.layer.shadowRadius = 5

        button3.layer.shadowColor = UIColor.black.cgColor
        button3.layer.shadowOffset = CGSize(width: 0, height: 0)
        button3.layer.shadowOpacity = 0.8
        button3.layer.shadowRadius = 5

        button4.layer.shadowColor = UIColor.black.cgColor
        button4.layer.shadowOffset = CGSize(width: 0, height: 0)
        button4.layer.shadowOpacity = 0.8
        button4.layer.shadowRadius = 5

        button5.layer.shadowColor = UIColor.black.cgColor
        button5.layer.shadowOffset = CGSize(width: 0, height: 0)
        button5.layer.shadowOpacity = 0.8
        button5.layer.shadowRadius = 5

        button6.layer.shadowColor = UIColor.black.cgColor
        button6.layer.shadowOffset = CGSize(width: 0, height: 0)
        button6.layer.shadowOpacity = 0.8
        button6.layer.shadowRadius = 5







        episodes = Episode.downloadAllEpisodes()



    }


    @IBAction func whiskyButton(_ sender: Any) {
        let text = "whisky"
        image = UIImage(named: "whisky.png")
        for i in 0 ... episodes.count-1{
            let string = episodes[i].category
            if string?.range(of:text) != nil {
                search2.append(episodes[i])
        performSegue(withIdentifier: "send", sender: self)
            }
            }
        }


    @IBAction func beerButton(_ sender: Any) {
        let text = "beer"
        image = UIImage(named: "beer.png")
        for i in 0 ... episodes.count-1{
            let string = episodes[i].category
            if string?.range(of:text) != nil {
                search2.append(episodes[i])
                performSegue(withIdentifier: "send", sender: self)
            }
        }
    }




    @IBAction func wineButton(_ sender: Any) {
        let text = "wine"
        image = UIImage(named: "wine.png")
        for i in 0 ... episodes.count-1{
            let string = episodes[i].category
            if string?.range(of:text) != nil {
                search2.append(episodes[i])
                performSegue(withIdentifier: "send", sender: self)
            }
        }
    }


    @IBAction func vodkaButton(_ sender: Any) {
        let text = "vodka"
        image = UIImage(named: "vodka.png")
        for i in 0 ... episodes.count-1{
            let string = episodes[i].category
            if string?.range(of:text) != nil {
                search2.append(episodes[i])
                performSegue(withIdentifier: "send", sender: self)
            }
        }
    }

    @IBAction func rumButton(_ sender: Any) {
        let text = "rum"
        image = UIImage(named: "rum.png")
        for i in 0 ... episodes.count-1{
            let string = episodes[i].category
            if string?.range(of:text) != nil {
                search2.append(episodes[i])
                performSegue(withIdentifier: "send", sender: self)
            }
        }
    }

    @IBAction func champButton(_ sender: Any) {
        let text = "champ"
        image = UIImage(named: "champ.png")
        for i in 0 ... episodes.count-1{
            let string = episodes[i].category
            if string?.range(of:text) != nil {
                search2.append(episodes[i])
                performSegue(withIdentifier: "send", sender: self)
            }
        }
    }

    override var prefersStatusBarHidden : Bool {
        return true
    }
    override func viewDidAppear(_ animated: Bool) {
        search2.removeAll()
    }

    
}
