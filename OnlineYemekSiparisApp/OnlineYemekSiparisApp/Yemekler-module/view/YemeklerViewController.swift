
import UIKit
import Kingfisher

class YemeklerViewController: UIViewController {
    
    @IBOutlet weak var YemeklerCollectionView: UICollectionView!
        var username: String?
        
        var yemekListe = [Yemekler]()
        
        var yemeklerPresenterNesnesi: ViewToPresenterYemeklerProtocol?
        

    override func viewDidLoad() {
        super.viewDidLoad()
    
    
        let secondTab = (self.tabBarController?.viewControllers![1])! as! SepetViewController
        secondTab.username = username
                
        YemeklerCollectionView.delegate = self
        YemeklerCollectionView.dataSource = self
                
       
        self.navigationController?.navigationBar.topItem?.title = "Yemekler"
        self.tabBarController?.navigationItem.hidesBackButton = true
        
        YemeklerRouter.createModule(ref: self)
        yemeklerPresenterNesnesi?.tumYemekleriSec()

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.detaySegue {
            if let yemek = sender as? Yemekler {
                let VC = segue.destination as! YemeklerDetayVC
                VC.yemekDetay = yemek
                VC.username = username
            }
        }
    }
        

        
}


extension YemeklerViewController: PresenterToViewYemeklerProtocol {
        
    func ViewaVeriGonder(yemekListe: Array<Yemekler>) {
        self.yemekListe = yemekListe
        DispatchQueue.main.async {
            self.YemeklerCollectionView.reloadData()
        }
    }
        
        
}

extension YemeklerViewController: UICollectionViewDelegate, UICollectionViewDataSource {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return yemekListe.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.yemeklerIdentifier, for: indexPath) as! YemeklerCollectionViewCell
            
           
        cell.yemekView.layer.cornerRadius = 10
        cell.yemekView.layer.masksToBounds = true

        cell.layer.cornerRadius = 10
        cell.layer.shadowOpacity = 0.3
        cell.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.layer.shadowRadius = 2
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.masksToBounds = false
         
        let url = URL(string: Constants.Urller.yemekImageUrl + yemekListe[indexPath.row].yemek_resim_adi)
        cell.yemekImage.kf.setImage(with: url)
        cell.yemekImage.frame.size.height = cell.yemekImage.frame.width
        cell.yemekAD.text = yemekListe[indexPath.row].yemek_adi
        cell.yemekFIYAT.text = yemekListe[indexPath.row].yemek_fiyat + " ₺"
            
        return cell

    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let yemek = yemekListe[indexPath.row]
        performSegue(withIdentifier: Constants.detaySegue, sender: yemek)
    }
    

}
