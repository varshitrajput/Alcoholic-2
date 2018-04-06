
//  infoViewController.swift
//  Alcoholic
//
//  Created by Varshit Rajput on 23/03/17.
//  Copyright © 2017 Varshit Rajput. All rights reserved.
//

import UIKit

class infoViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    

    var heading = ["Scotch Whisky","Single Malt Whisky","Grain Whisky","Blended Whisky","Irish Whisky","Japanese Whisky","Bourbon","Tennessee Whiskey"]
    var content = ["A Scotch Whisky must be made from malted barley or grain with the spirit aged in oak casks no bigger than 700 litres for no less than three years. Whisky of one type or another is made all over the world, but to be called Scotch Whisky it must be made entirely in Scotland.","This is a whisky from a single distillery made using only malted barley, water and yeast. Single Malt Scotch Whiskies traditionally come from five regions: Lowland, Highland, Speyside, Island and Campbelltown.The different regions are famed for specific characteristics like fruitiness, freshness, maltiness and smokiness.","This is a type of whisky where the main ingredient is maize or wheat, or both. This whiskey contains major amount of maize that provides to its flavour and texture that makes it special","A Blended Scotch Whisky is made by mixing together Single Malt Whiskies and Single Grain Whiskies. The advantage of blending is that it ensures the flavor and quality of the whisky remains the same time after time. In an ‘age stated’ Blended Scotch Whisky, the age statement refers to the youngest whisky used in the blend.","This is any whiskey made in Eire (Republic of Ireland) or in Northern Ireland. Unlike Scotch, any malted cereal grains can be used in any proportion. Like Scotch, it must be aged in wooden casks for a minimum of three years.","Japanese whisky is usually made in the same way as Scotch whisky. It has been manufactured since the 1920s, but has only become widely available outside Japan in the last decade.","Bourbon is an American whiskey made from malted grains that are at minimum 51% corn.The rules around what constitutes a bourbon are more relaxed than those for Scotch, but it must be made entirely within the United States to qualify.","This is essentially the same as bourbon. The only distinction is the inclusion of charcoal filtering in the post-distillation process."]

    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        image.layer.shadowColor = UIColor.black.cgColor
        image.layer.shadowOffset = CGSize(width: 0, height: 0)
        image.layer.shadowOpacity = 0.8
        image.layer.shadowRadius = 5

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heading.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell3
        cell.headingLabel.text! = heading[indexPath.row]
        cell.content.text! = content[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        UIView.animate(withDuration: 0.6, animations: {
            cell.alpha = 1
        })
    }

    override var prefersStatusBarHidden : Bool {
        return true
    }


}



