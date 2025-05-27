//
//  ViewController.swift
//  Supers-iOS
//
//  Created by Mañanas on 20/5/25.
//

import UIKit

class ListViewController: UIViewController, UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var collectionView: UICollectionView!
    var superheroList: [Superhero] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.dataSource = self
        collectionView.delegate = self
              
              searchSuperheroesBy(name: "a")
              
              let searchController = UISearchController(searchResultsController: nil)
              searchController.searchBar.delegate = self
              self.navigationItem.searchController = searchController
          }
          
          func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
              searchSuperheroesBy(name: searchBar.text ?? "a")
          }
          
          func searchSuperheroesBy(name: String) {
              Task {
                  superheroList = await SuperheroProvider.findSuperheroesByName(query: name)
                  
                  DispatchQueue.main.async {
                      self.collectionView.reloadData()
                  }
              }
          }
          
          override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
              if segue.identifier == "Detail" {
                  let detailVC = segue.destination as! DetailViewController
                  let indexPath = collectionView.indexPathsForSelectedItems![0]
                  let superhero = superheroList[indexPath.row]
                  detailVC.superhero = superhero
                  collectionView.deselectItem(at: indexPath, animated: true)
              }
          }
          
          func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
              
              let columns = switch (UIScreen.main.traitCollection.userInterfaceIdiom) {
              case .phone:
                  2
              default:
                  5
              }
              
              
              // distancia de 10 en Min Spacing y Section Insets en los 6 parametros debe ser igual
              
              let spacing = (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).minimumInteritemSpacing
              let screenWidth = collectionView.frame.size.width
              var leftSpace = screenWidth - spacing * CGFloat(columns + 1)
              leftSpace -= 1
              let width = leftSpace / CGFloat(columns) //some width
              let height = width * 1.33 //ratio
              return CGSize(width: width, height: height)
          }
          
          func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
              superheroList.count
          }
          
          func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SuperheroCollectionViewCell", for: indexPath) as! SuperheroCollectionViewCell
              let superhero = superheroList[indexPath.row]
              cell.render(superhero: superhero)
              return cell
          }

      }
