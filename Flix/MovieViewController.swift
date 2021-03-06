//
//  MovieViewController.swift
//  Flix
//
//  Created by Chanel Johnson on 6/21/17.
//  Copyright © 2017 Chanel Johnson. All rights reserved.
//

import UIKit
import AlamofireImage
class MovieViewController: UIViewController, UITableViewDataSource {
    var movies : [[String : Any]] = []
   // var results : [[String : Any]] = []
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        activityIndicator.startAnimating()
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        tableView.dataSource = self
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), for: UIControlEvents.valueChanged)
        tableView.insertSubview(refreshControl, at : 0)
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request){(data, response, error) in
            if let error = error{
                print(error.localizedDescription)
                let alertController = UIAlertController(title: "Cannot get Movies", message: "The internet connection appears to be offline", preferredStyle: .alert)
                // create an OK action
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    // handle response here.
                }
                // add the OK action to the alert controller
                alertController.addAction(OKAction)
                self.present(alertController, animated: true)
                    
                
                
            }
            else if let data = data{
                let dataDict = try!JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
                let movies = dataDict["results"] as! [[String : Any]]
                
                self.movies = movies
                self.tableView.reloadData()
            }
            self.tableView.reloadData()
           
        }
        task.resume()
        activityIndicator.stopAnimating()
        // Do any additional setup after loading the view.
    }
    
func refreshControlAction(_ refreshControl: UIRefreshControl) {
    
    let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
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
            let movies = dataDict["results"] as! [[String : Any]]
            
            self.movies = movies
           self.tableView.reloadData()
        }
    self.tableView.reloadData()
    
    refreshControl.endRefreshing()
    }
    task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
return movies.count    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let overview = movie["overview"] as! String
        cell.titleLabel.text = title
        cell.overviewLabel.text = overview
        let posterPathString = movie["poster_path"] as! String
        let baseURLString = "https://image.tmdb.org/t/p/w500"
        let posterURL = URL(string : baseURLString + posterPathString)!
        cell.movieImage.af_setImage(withURL: posterURL)
        

        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
       if let indexPath = tableView.indexPath(for: cell){
            let  movie = movies[indexPath.row]
            let detailViewController = segue.destination as! DetailViewController
        detailViewController.movie = movie
            
        }
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
