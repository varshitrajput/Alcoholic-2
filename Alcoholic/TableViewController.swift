//
//  TableViewController.swift
//  Alcoholic
//
//  Created by Varshit Rajput on 20/03/17.
//  Copyright © 2017 Varshit Rajput. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
  

    var episodes = [Episode]()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        episodes = Episode.downloadAllEpisodes()
        self.tableView.reloadData()
        image.layer.shadowColor = UIColor.black.cgColor
        image.layer.shadowOffset = CGSize(width: 0, height: 0)
        image.layer.shadowOpacity = 0.8
        image.layer.shadowRadius = 5


    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return episodes.count
    }

      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let episode = episodes[indexPath.row]

        cell.episode = episode

        return cell

    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        CellAnimator.animateCell(cell, withTransform: CellAnimator.TransformTilt, andDuration: 0.5)

       
    }

    override var prefersStatusBarHidden : Bool {
        return true
    }


    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    }


    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        let check = UITableViewRowAction(style: .normal, title: "✓done") { action, index in
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let daaru = self.episodes[indexPath.row]
            let task = Beenon(context: context)
            task.nameData = daaru.name!
            task.fullData = daaru.full!
            task.halfData = daaru.half!
            task.quarterData = daaru.quarter!
            task.category = daaru.category!
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            print ("saved \(task)")
            tableView.reloadData()

        }
        check.backgroundColor = UIColor.init(red: 129/255, green: 199/255, blue: 132/255, alpha: 0.8)

    


        let wish = UITableViewRowAction(style: .normal, title: "♥︎Wish") { action, index in
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let daaru = self.episodes[indexPath.row]
            let task2 = Wishlist(context: context)
            task2.nameData = daaru.name!
            task2.fullData = daaru.full!
            task2.halfData = daaru.half!
            task2.quarterData = daaru.quarter!
            task2.category = daaru.category!
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            print ("saved \(task2)")
            tableView.reloadData()

        }
        wish.backgroundColor = UIColor.init(red: 229/255, green: 115/255, blue: 115/255, alpha: 0.8)


        let trash = UITableViewRowAction(style: .normal, title: "✖︎Trash") { action, index in
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let daaru = self.episodes[indexPath.row]
            let task3 = Trash(context: context)
            task3.nameData = daaru.name!
            task3.fullData = daaru.full!
            task3.halfData = daaru.half!
            task3.quarterData = daaru.quarter!
            task3.category = daaru.category!
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            print ("saved \(task3)")
            tableView.reloadData()

        }
        wish.backgroundColor = UIColor.init(red: 255/255, green: 241/255, blue: 115/255, alpha: 0.8)

        return [check,wish,trash]
    }










}
