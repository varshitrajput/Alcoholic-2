//
//  DataViewController.swift
//  Alcoholic
//
//  Created by Varshit Rajput on 02/04/17.
//  Copyright © 2017 Varshit Rajput. All rights reserved.
//

import UIKit
import CoreData

class DataViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {



    @IBOutlet weak var welcome: UILabel!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var addItemView: UIView!

    @IBOutlet weak var addVisualView: UIVisualEffectView!
    var effect:UIVisualEffect!

    @IBAction func profileClick(_ sender: Any) {
        titleGiver()
        calculate()
        animateIn()
    }
    var whiskycount=0
    var beercount=0
    var rumcount=0
    var champcount=0
    var winecount=0
    var vodkacount=0

    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var wlabel: UILabel!
    @IBOutlet weak var blabel: UILabel!
    @IBOutlet weak var vlabel: UILabel!
    @IBOutlet weak var winelabel: UILabel!
    @IBOutlet weak var clabel: UILabel!
    @IBOutlet weak var rlabel: UILabel!

    @IBOutlet weak var descriptionLabel2: UILabel!


    override func viewDidLoad() {

        super.viewDidLoad()
        effect = addVisualView.effect
        addVisualView.effect=nil
        addItemView.layer.cornerRadius=10
        tableView.dataSource=self
        tableView.delegate=self
        getData()
        welcome.text = "Varshit"

    }

    override func viewWillAppear(_ animated: Bool) {
        calculate()
        titleGiver()
    }

    func titleGiver(){

        if whiskycount>beercount && whiskycount>rumcount && whiskycount>vodkacount && whiskycount>champcount && whiskycount>winecount{
            descriptionLabel.text = "Whisky Connoisseur"
            descriptionLabel2.text = "Whisky Connoisseur"
        }

        else if beercount>whiskycount && beercount>rumcount && beercount>vodkacount && beercount>champcount && beercount>winecount{
            descriptionLabel.text = "Beer-a-phile"
            descriptionLabel2.text = "Beer-a-phile"
        }

        else if vodkacount>whiskycount && vodkacount>rumcount && vodkacount>beercount && vodkacount>champcount && vodkacount>winecount{
            descriptionLabel.text = "Vodkalicious"
            descriptionLabel2.text = "Vodkalicious"
        }
        else if champcount>whiskycount && champcount>rumcount && champcount>beercount && champcount>vodkacount && champcount>winecount{
            descriptionLabel.text = "Perfect Champagnion"
            descriptionLabel2.text = "Perfect Champagnion"
        }
        else if winecount>whiskycount && winecount>rumcount && winecount>beercount && winecount>vodkacount && winecount>champcount{
            descriptionLabel.text = "Wine Lover"
            descriptionLabel2.text = "Wine Lover"
        }
        else if rumcount>whiskycount && rumcount>winecount && rumcount>beercount && rumcount>vodkacount && rumcount>champcount{
            descriptionLabel.text = "Rum Monk"
            descriptionLabel2.text = "Rum Monk"
        }
}

    func calculate(){
        whiskycount=0
        beercount=0
        rumcount=0
        champcount=0
        winecount=0
        vodkacount=0
        for i in tasks{
            print(i)
            if i.category == "whisky"{
                whiskycount = whiskycount+1
            }
            else if i.category == "vodka"{
                vodkacount = vodkacount+1
            }
            else if i.category == "beer"{
                beercount = beercount+1
            }
            else if i.category == "champ"{
                champcount = champcount+1
            }
            else if i.category == "rum"{
                rumcount=rumcount+1
            }
            else if i.category == "wine"{
                winecount=winecount+1
            }

        }


        total.text =   "\(tasks.count)"
        wlabel.text =    "\(whiskycount)"
        blabel.text =    "\(beercount)"
        vlabel.text =    "\(vodkacount)"
        winelabel.text = "\(rumcount)"
        clabel.text =    "\(champcount)"
        rlabel.text =    "\(winecount)"
    }

    @IBOutlet weak var descriptionLabel: UILabel!

    @IBAction func backButtin(_ sender: Any) {
        animateOut()
    }


    var tasks:[Beenon]=[]
    var tasks2:[Wishlist]=[]
    var tasks3:[Trash]=[]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        if (segment.selectedSegmentIndex==0){
            count=tasks.count
        }
        else if (segment.selectedSegmentIndex==1){
            count=tasks2.count
        }

        else if (segment.selectedSegmentIndex==2){
           count=tasks3.count
        }

        return (count)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell6", for: indexPath) as! DataTableViewCell
        if (segment.selectedSegmentIndex==0){
            let task = tasks[indexPath.row]
            cell.name.text = task.nameData
            cell.half.text = task.halfData
            cell.full.text = task.fullData
            cell.quarter.text = task.quarterData
            if tasks[indexPath.row].category?.range(of:"whisky") != nil {
                cell.logoimage.image = UIImage(named: "whisky.png")

            }
            else if   tasks[indexPath.row].category?.range(of:"beer") != nil {
                cell.logoimage.image = UIImage(named: "beer.png")

            }
            else if   tasks[indexPath.row].category?.range(of:"vodka") != nil {
                cell.logoimage.image = UIImage(named: "vodka.png")

            }
            else if   tasks[indexPath.row].category?.range(of:"rum") != nil {
                cell.logoimage.image = UIImage(named: "rum.png")

            }
            else if   tasks[indexPath.row].category?.range(of:"champ") != nil {
                cell.logoimage.image = UIImage(named: "champ.png")

            }
            else if   tasks[indexPath.row].category?.range(of:"wine") != nil {
                cell.logoimage.image = UIImage(named: "wine.png")
                
            }


        }

        else if (segment.selectedSegmentIndex==1){


            let task = tasks2[indexPath.row]
            cell.name.text = task.nameData
            cell.half.text = task.halfData
            cell.full.text = task.fullData
            cell.quarter.text = task.quarterData
            if tasks2[indexPath.row].category?.range(of:"whisky") != nil {
                cell.logoimage.image = UIImage(named: "whisky.png")

            }
            else if   tasks2[indexPath.row].category?.range(of:"beer") != nil {
                cell.logoimage.image = UIImage(named: "beer.png")

            }
            else if   tasks2[indexPath.row].category?.range(of:"vodka") != nil {
                cell.logoimage.image = UIImage(named: "vodka.png")

            }
            else if   tasks2[indexPath.row].category?.range(of:"rum") != nil {
                cell.logoimage.image = UIImage(named: "rum.png")

            }
            else if   tasks2[indexPath.row].category?.range(of:"champ") != nil {
                cell.logoimage.image = UIImage(named: "champ.png")

            }
            else if   tasks2[indexPath.row].category?.range(of:"wine") != nil {
                cell.logoimage.image = UIImage(named: "wine.png")
                
            }

        }

        else if (segment.selectedSegmentIndex==2){


            let task = tasks3[indexPath.row]
            cell.name.text = task.nameData
            cell.half.text = task.halfData
            cell.full.text = task.fullData
            cell.quarter.text = task.quarterData
            if tasks3[indexPath.row].category?.range(of:"whisky") != nil {
                cell.logoimage.image = UIImage(named: "whisky.png")

            }
            else if   tasks3[indexPath.row].category?.range(of:"beer") != nil {
                cell.logoimage.image = UIImage(named: "beer.png")

            }
            else if   tasks3[indexPath.row].category?.range(of:"vodka") != nil {
                cell.logoimage.image = UIImage(named: "vodka.png")

            }
            else if   tasks3[indexPath.row].category?.range(of:"rum") != nil {
                cell.logoimage.image = UIImage(named: "rum.png")

            }
            else if   tasks3[indexPath.row].category?.range(of:"champ") != nil {
                cell.logoimage.image = UIImage(named: "champ.png")

            }
            else if   tasks3[indexPath.row].category?.range(of:"wine") != nil {
                cell.logoimage.image = UIImage(named: "wine.png")
                
            }
            
        }


        return (cell)
    }




    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]?
    {
        let deleteAction  = UITableViewRowAction(style: .default, title: "Delete") { (rowAction, indexPath) in
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            tableView.beginUpdates()
            let task = self.tasks[indexPath.row]
            context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            print ("saved \(task)")
            tableView.endUpdates()
            print("Delete Button tapped. Row item value ")
        }
    
        return [deleteAction]
    }

    func getData()
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            tasks = try context.fetch(Beenon.fetchRequest())
            tasks2 = try context.fetch(Wishlist.fetchRequest())
            tasks3 = try context.fetch(Trash.fetchRequest())


        } catch  {
            print("fetching failed")
        }
    }



    
    @IBAction func segmentControl(_ sender: Any) {
        if segment.selectedSegmentIndex==0{

            tasks.removeAll()
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                do {
                    tasks = try context.fetch(Beenon.fetchRequest())

                } catch  {
                    print("fetching failed")
                }
            tableView.reloadData()

        }
        else if segment.selectedSegmentIndex==1{
            tasks2.removeAll()
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            do {
                tasks2 = try context.fetch(Wishlist.fetchRequest())

            } catch  {
                print("fetching failed")
            }
            tableView.reloadData()
        }
        else if segment.selectedSegmentIndex==2{
            tasks3.removeAll()
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            do {
                tasks3 = try context.fetch(Trash.fetchRequest())

            } catch  {
                print("fetching failed")
            }
            tableView.reloadData()
        }


    }

    func animateIn(){
        self.view.addSubview(addItemView)
        addItemView.center = self.view.center
        addItemView.transform = CGAffineTransform.init(scaleX:1.3, y:1.3)
        addItemView.alpha=0
                UIView.animate(withDuration: 0.4){
            self.addVisualView.effect = self.effect
            self.addVisualView.alpha = 1
            self.addItemView.alpha = 1
            self.addItemView.transform = CGAffineTransform.identity
        }
    }



    func animateOut(){
        UIView.animate(withDuration: 0.3 , animations:
            {
                self.addItemView.transform = CGAffineTransform.init(scaleX:1.3, y:1.3)
                self.addItemView.alpha=0
                self.addVisualView.effect=nil
                self.addVisualView.alpha=0
        }) { (success:Bool) in
            self.addItemView.removeFromSuperview()
        }
        getData()
        tableView.reloadData()
    }

    override func viewDidAppear(_ animated: Bool) {
        getData()
    }


    override var prefersStatusBarHidden : Bool {
        return true
    }
}
