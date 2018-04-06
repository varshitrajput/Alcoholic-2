//
//  ViewController.swift
//  Alcoholic
//
//  Created by Varshit Rajput on 22/03/17.
//  Copyright © 2017 Varshit Rajput. All rights reserved.
//

import UIKit
import TextFieldEffects


class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate , UITextFieldDelegate{

    @IBAction func searchTry(_ sender: Any) {
        searchAction()
    }
    var episodes = [Episode]()




    @IBOutlet weak var image: UIImageView!

    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var search = [Episode]()
    var searchfull = [""]
    var searchhalf = [""]
    var searchquater = [""]

    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
        search.removeAll()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        textInput.delegate=self
        image.layer.shadowColor = UIColor.black.cgColor
        image.layer.shadowOffset = CGSize(width: 0, height: 0)
        image.layer.shadowOpacity = 0.8
        image.layer.shadowRadius = 5
        episodes = Episode.downloadAllEpisodes()
        self.tableView.reloadData()


    }

    @IBOutlet weak var textInput: UITextField!


    @IBAction func searchButton(_ sender: Any) {
        searchAction()
        textInput.resignFirstResponder()

    }

    func searchAction()
    {   if textInput.text != ""{
        tableView.alpha=1
        introLabel.alpha=0
        search.removeAll()
        searchquater.removeAll()
        searchhalf.removeAll()
        searchfull.removeAll()

        tableView.reloadData()

            let text = textInput.text!
           for i in 0 ... episodes.count-1{
                let string = episodes[i].name
                if string?.range(of:text) != nil {
                    search.append(episodes[i])

                }
            }
        }
    else{
        search.removeAll()
        }
        tableView.reloadData()

    }




    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return search.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! TableViewCell2
        cell.halfLabel.text = search[indexPath.row].half
        cell.fullLabel.text = search[indexPath.row].full
        cell.quaterLabel.text = search[indexPath.row].quarter
        cell.textField.text = search[indexPath.row].name
    if search[indexPath.row].category?.range(of:"whisky") != nil {
            cell.logoImage.image = UIImage(named: "whisky.png")

        }
     else if   search[indexPath.row].category?.range(of:"beer") != nil {
            cell.logoImage.image = UIImage(named: "beer.png")

        }
    else if   search[indexPath.row].category?.range(of:"vodka") != nil {
        cell.logoImage.image = UIImage(named: "vodka.png")

        }
    else if   search[indexPath.row].category?.range(of:"rum") != nil {
        cell.logoImage.image = UIImage(named: "rum.png")

        }
    else if   search[indexPath.row].category?.range(of:"champ") != nil {
        cell.logoImage.image = UIImage(named: "champ.png")

        }
    else if   search[indexPath.row].category?.range(of:"wine") != nil {
        cell.logoImage.image = UIImage(named: "wine.png")

        }

        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
       CellAnimator.animateCell(cell, withTransform: CellAnimator.TransformTilt, andDuration: 0.5)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("row selecterd")
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete  {
            print ("success")
        }
    }



    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        textInput.resignFirstResponder()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchAction()
        textInput.resignFirstResponder()
        return(true)
    }
    override var prefersStatusBarHidden : Bool {
        return true
    }

}
