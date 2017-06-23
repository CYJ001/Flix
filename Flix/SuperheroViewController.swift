//
//  SuperheroViewController.swift
//  Flix
//
//  Created by Chanel Johnson on 6/23/17.
//  Copyright © 2017 Chanel Johnson. All rights reserved.
//

import UIKit
import AlamofireImage

class SuperheroViewController: UIViewController, UICollectionViewDataSource {
    var movies : [[String : Any]] = []
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
collectionView.dataSource = self
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/297762/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US")!
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
              
            }
            self.collectionView.reloadData()
            
            //refreshControl.endRefreshing()
        }
        task.resume()
    
        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return movies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        let movie = movies[indexPath.item]
        if let posterPathString = movie["poster_path"] as? String{
        let baseURLString = "https://image.tmdb.org/t/p/w500"
        let posterURL = URL(string : baseURLString + posterPathString)!
            cell.posterImageView.af_setImage(withURL: posterURL)}
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UICollectionViewCell
        if let indexPath = collectionView.indexPath(for: cell){
            let  movie = movies[indexPath.row]
            let detailViewController = segue.destination as! DetailSuperViewController
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
