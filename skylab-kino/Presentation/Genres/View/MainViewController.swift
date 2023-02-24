//
//  MainViewController.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 23.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var dataArray: [String] = []
    private var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    // MARK: - Funcions
    func loadData() {
        
        //запит в інтернет на жанри
        NetworkService.shared.fetchGenres { genre in
            //жанри збережені в realm
            for item in genre.genres {
                let genreRealmModel = GenreRealmModel(name: item.name)
                RealmManager.shared.save(model: genreRealmModel)
            }
            
            //виконано запит в realm на всі фільми, результат збережено в dataArray
            self.dataArray = RealmManager.shared.fetchGenres().map{$0.name}
            
            // інтерфейс оновлено відповідно до dataArray
            self.tableView.reloadData()
        }
        
        if !isLoading {
            isLoading = true
            let page = dataArray.count/20 + 1
            
            //запит в інтернет на фільми
            NetworkService.shared.fetchPopularMovies(page: page) { movie in
                
                //фільми збережені в realm
                for item in movie.results {
                    let movieRealmModel = MovieRealmModel(name: item.originalTitle)
                    RealmManager.shared.save(model: movieRealmModel)
                }
                
                //виконано запит в realm на всі фільми, результат збережено в dataArray
                self.dataArray = RealmManager.shared.fetchMovies().map{$0.name}
                
                // інтерфейс оновлено відповідно до dataArray
                self.tableView.reloadData()
                self.isLoading = false
            }
        }
        
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            // Return the amount of items
            return dataArray.count
        } else if section == 1 {
            // Return the Loading cell
            return 1
        } else {
            // Return nothing
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmsTableViewCell", for: indexPath) as! FilmsTableViewCell
        
        var content = cell.defaultContentConfiguration()
        content.text = dataArray[indexPath.row]
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 44 // Item Cell height
        } else {
            return 55 // Loading Cell height
        }
    }
}

extension MainViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastIndex = dataArray.count - 1
        if indexPath.row == lastIndex, !isLoading {
            // api call and get next page
            loadData()
        }
    }
}
