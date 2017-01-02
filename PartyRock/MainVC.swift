//
//  ViewController.swift
//  PartyRock
//
//  Created by minh duong on 12/29/16.
//  Copyright © 2016 minh duong. All rights reserved.
//

import UIKit

class MainVC: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let p1 = PartyRock(imageURL:"https://lh3.googleusercontent.com/1P3naImUifT5Mp0Ptek9Bp6CiNEANugFM2C4mdw2aW80InNKSYLYn09ffoikKmiAuw=w300"
 , videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/f-IG28y7gHs\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "call me maybe")
        
        let p2 = PartyRock(imageURL:"http://photoservice.gamesao.vn/Resources/Upload/Images/Editor/30/Ban-thich-choi-solo-3vs3-hay-5vs5-trong-3Q-360mobi/Du-ngoan-qua-cac-che-do-so-dau-trong-3q-360mobi%20(3).jpg"            , videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/rvHi98X5zd8\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Let it's snow")

        let p3 = PartyRock(imageURL:"https://img.zing.vn/upload/3qm/source/Gallery/Skin-Hua-Chu.jpg"            , videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ub9K9kCyg68\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "qiqi gaming")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        tableView.delegate = self
        tableView.dataSource = self
    }

    //recycle the correct cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            
            let partyRock = partyRocks[indexPath.row]
            
            cell.updateUI(partyRock: partyRock)
            
            return cell
        } else {
            return UITableViewCell()
        }
        
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? VideoVC {
            
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
            
        }
        
    }
    
}

