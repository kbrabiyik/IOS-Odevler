import UIKit
import Kingfisher

class SepetViewController: UIViewController {

    @IBOutlet weak var sepetTableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    
    var sepetPresenterNesnesi: ViewToPresenterSepetProtocol?
    var yemekListe =  [SepettekiYemekler]()
    var username: String?
   
    
    override func viewDidLoad() {
        /*
         if let tabItems = tabBarController?.tabBar.items {
            let item = tabItems[1] //sepet kısmı için
            item.badgeValue = "2"
        }
        
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor.white
        itemRenkDegistir(itemAppearance: appearance.stackedLayoutAppearance)
        itemRenkDegistir(itemAppearance: appearance.inlineLayoutAppearance)
        itemRenkDegistir(itemAppearance: appearance.compactInlineLayoutAppearance)
        
        
        tabBarController?.tabBar.standardAppearance = appearance
        tabBarController?.tabBar.scrollEdgeAppearance = appearance
         */
         
        super.viewDidLoad()

        navigationItem.title = "Sepet"
        
        sepetTableView.delegate = self
        sepetTableView.dataSource = self
        sepetTableView.rowHeight = 250
        sepetTableView.separatorStyle = .singleLine
        
        SepetRouter.createModule(ref: self)
        self.tabBarController?.navigationItem.hidesBackButton = true
    }
    /*
    func itemRenkDegistir(itemAppearance:UITabBarItemAppearance) {
        //Seçili olmayan durum rengi
        itemAppearance.normal.iconColor = UIColor.white
        itemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        
        itemAppearance.normal.badgeBackgroundColor = UIColor.red
        // Seçili olan durum rengi
       
        itemAppearance.selected.iconColor = UIColor.yellow
        itemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.yellow]
        itemAppearance.selected.badgeBackgroundColor = UIColor.orange
    }
    */
    override func viewWillAppear(_ animated: Bool) {
        self.sepetPresenterNesnesi?.sepettekiTUMYemekleriSec(userName: username ?? "Kübra")
        
    }

}

extension SepetViewController: PresenterToViewSepetProtocol {
    func ViewaVeriGonder(SepettekiYemekListe: Array<SepettekiYemekler>) {
        self.yemekListe = SepettekiYemekListe
        
        DispatchQueue.main.async {
            self.sepetTableView.reloadData()
            var total = 0
            for i in self.yemekListe {
                total += Int(i.yemek_fiyat!)! * Int(i.yemek_siparis_adet!)!
            }
            self.totalLabel.text = "Toplam Sepet Tutarı \(String(describing: total)) ₺"
        }
    }

}

extension SepetViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yemekListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.sepetIdentifier, for: indexPath) as! SepetTableViewCell
        
        cell.sepetView.layer.shadowColor = UIColor.gray.cgColor
        cell.sepetView.layer.shadowOpacity = 0.3
        cell.sepetView.layer.shadowOffset = CGSize.zero
        cell.sepetView.layer.shadowRadius = 6
        cell.sepetView.layer.cornerRadius = 10
        
        cell.yemekAD.text = yemekListe[indexPath.row].yemek_adi
        cell.yemekFIYAT.text = yemekListe[indexPath.row].yemek_fiyat! + " ₺"
        cell.yemekADET.text = yemekListe[indexPath.row].yemek_siparis_adet
        
        let url = URL(string: Constants.Urller.yemekImageUrl + yemekListe[indexPath.row].yemek_resim_adi!)
        cell.yemekImageView.kf.setImage(with: url)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Sil") { (action,view,void) in
            self.sepetPresenterNesnesi?.sepettenSil(sepet_yemek_id: Int(self.yemekListe[indexPath.row].sepet_yemek_id!)!, userName: self.username ?? "Kübra")
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    

}
