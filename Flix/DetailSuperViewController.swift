//
//  DetailSuperViewController.swift
//  Flix
//
//  Created by Chanel Johnson on 6/23/17.
//  Copyright © 2017 Chanel Johnson. All rights reserved.
//

import UIKit
import AlamofireImage
class DetailSuperViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backDropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
     var movie : [String : Any]?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = movie{
            titleLabel.text = movie["title"] as? String
            
            releaseLabel.text = movie["release_date"] as? String
            
            overviewLabel.text = movie["overview"] as? String
            let backdropPathString = movie["backdrop_path"] as! String
            let posterPathString = movie["poster_path"] as! String
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            let backDropURL = URL(string: baseURLString+backdropPathString)!
            backDropImageView.af_setImage(withURL: backDropURL)
            let posterPathURL = URL(string: baseURLString + posterPathString)!
            posterImageView.af_setImage(withURL: posterPathURL)
        }


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}