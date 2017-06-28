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
    var trailers : [[String : Any]] = []
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
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let movie = movie{
            
        let id = movie["id"] as! Int
            let urlString =  "https://api.themoviedb.org/3/movie/" + String(id) + "/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US"
            let url = URL(string: urlString)!
            let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
            let task = session.dataTask(with: request){(data, response, error) in
                if let error = error{
                    print(error.localizedDescription)
                    let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
                    self.present(alertController, animated: true)
                    
                }
                else if let data = data{
                    let dataDict = try!JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
                    let trailers = dataDict["results"] as! [[String : Any]]
                    
                    //self.trailers = trailers
                    //let mainTrailer = trailers[0]
let key = trailers[0]["key"] as! String
                    print("hi")
                    print(key)
                    let youtubeURL = "https://www.youtube.com/watch?v=" + key
                    let trailerViewController = segue.destination as! WebViewController
                    trailerViewController.url = youtubeURL
                    print(youtubeURL)
                }
               //self.collectionView.reloadData()
                
                //refreshControl.endRefreshing()
            }
            task.resume()

            
        
       /* let cell = sender as! UICollectionViewCell
        //if let indexPath = collectionView.indexPath(for: cell){
            //let  movie = movies[indexPath.row]
            let webViewController = segue.destination as! WebViewController
            webViewController.movie = movie*/
        }
        }
 */

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
