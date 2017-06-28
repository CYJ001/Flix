//
//  WebViewController.swift
//  Flix
//
//  Created by Chanel Johnson on 6/23/17.
//  Copyright © 2017 Chanel Johnson. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    var id : Int = 0
    var url : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
      /*  let id = movie["id"] as! Int
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
let requestURL  = URL(string:url)
        print(url)
    let request = URLRequest(url: requestURL! as URL)
        // Load Request into WebView.
        webView.loadRequest(request as URLRequest)
        // Do any additional setup after loading the view. */
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
