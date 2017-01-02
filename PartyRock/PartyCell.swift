//
//  PartyCell.swift
//  PartyRock
//
//  Created by minh duong on 12/30/16.
//  Copyright © 2016 minh duong. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    
    @IBOutlet weak var videoTItle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
 
    
    
    
    func updateUI(partyRock: PartyRock) {
        videoTItle.text = partyRock.videoTitle
        let url = URL(string: partyRock.imageURL)!
        //asyn grab from the background thread
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                //sync grab from the main thread
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            } catch {
                //handle the error
            }
        }
    }
    
    
    

}
