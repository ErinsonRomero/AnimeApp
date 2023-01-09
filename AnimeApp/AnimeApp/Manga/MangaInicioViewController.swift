//
//  MangaInicioViewController.swift
//  AnimeApp
//
//  Created by Erinson Andres Romero Terry on 9/01/23.
//

import UIKit

class MangaInicioViewController: UIViewController {

    var mangaManager = MangaApi()
    var manga: [Datas]?
    var addMore = false
    var page = 2
    @IBOutlet weak var mangaCollectionView: UICollectionView!
    override func viewWillAppear(_ animated: Bool) {
        mangaManager.Tipo(tipo: "top/manga")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Mangas"
        mangaManager.delegate = self
        mangaCollectionView.delegate = self
        mangaCollectionView.dataSource = self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}

extension MangaInicioViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return manga?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mangaCollectionView.dequeueReusableCell(withReuseIdentifier: "MangaCollectionViewCell", for: indexPath) as! MangaCollectionViewCell
        if let imagen = manga?[indexPath.row].images?.jpg?.large_image_url {
            cell.mangaImage.downloaded(from: imagen)
        }
        cell.mangaName.text = manga![indexPath.row].title
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY =  scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > contentHeight - scrollView.frame.height {
            if !addMore {
                beginFetch()
            }
        }
        
    }
    
    func beginFetch() {
        addMore = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
            if self.page != 6 {
                self.mangaManager.Tipo(tipo: "top/manga?page=\(self.page)")
                self.page = self.page + 1
                print(self.page)
                self.addMore = false
            }
        })
    }
    
    
}
extension MangaInicioViewController: MangaDelegate {
    func didUpdateAnime(movie: [Datas]) {
        DispatchQueue.main.async {
            if self.manga == nil {
                self.manga = movie
                self.mangaCollectionView.reloadData()
            } else {
                self.manga?.append(contentsOf: movie)
                self.mangaCollectionView.reloadData()
            }
            
        }
    }
    
    func didFailWithError(error: Error) {
        
    }
    

}
