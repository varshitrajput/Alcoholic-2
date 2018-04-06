//
//  SortViewController.swift
//  Alcoholic
//
//  Created by Varshit Rajput on 26/03/17.
//  Copyright © 2017 Varshit Rajput. All rights reserved.
//

import UIKit

class SortViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{



    @IBOutlet weak var tableView: UITableView!
    var episodes = [Episode]()

    override func viewDidLoad() {
        episodes = Episode.downloadAllEpisodes()
        super.viewDidLoad()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return search2.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! TableViewCell4
        cell.halfLabel.text = search2[indexPath.row].half
        cell.fullLabel.text = search2[indexPath.row].full
        cell.quarterLabel.text = search2[indexPath.row].quarter
        cell.name.text = search2[indexPath.row].name
        cell.logoImage.image=image
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        CellAnimator.animateCell(cell, withTransform: CellAnimator.TransformTilt, andDuration: 0.5)
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
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            print ("saved \(task3)")
            tableView.reloadData()

        }
        wish.backgroundColor = UIColor.init(red: 255/255, green: 241/255, blue: 115/255, alpha: 0.8)
        
        return [check,wish,trash]
    }


    @IBAction func backButton(_ sender: Any) {
        search2.removeAll()
        tableView.reloadData()
    }
    override var prefersStatusBarHidden : Bool {
        return true
    }



}
`
