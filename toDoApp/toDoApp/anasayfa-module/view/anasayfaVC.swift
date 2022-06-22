import UIKit

class anasayfaVC: UIViewController {
    
    @IBOutlet weak var yapilacaklarTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var TasksLabel: UILabel!
    
    var yapilacaklarListesi = [Yapilacaklar]()
    
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        yapilacaklarTableView.separatorColor = UIColor(white: 1, alpha: 1)
        
        searchBar!.delegate = self
        yapilacaklarTableView.delegate = self
        yapilacaklarTableView.dataSource = self
        
        veritabaniKopyala()
        AnasayfaRouter.createModule(ref: self)
        self.navigationItem.setHidesBackButton(true, animated: false)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.isleriYukle()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            let yapilacakIs = sender as? Yapilacaklar
            let gidilecekVC = segue.destination as! detayVC
            gidilecekVC.yapilacakIs = yapilacakIs
        }
    }
    
    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "ToDo", ofType: ".db")
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask,true).first!
        
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("ToDo.db")
        
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: kopyalanacakYer.path) {
            print("Veritabanı zaten var")
        }else {
            do {
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch{}
        }
    }

}

extension anasayfaVC : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yapilacaklarListesi: Array<Yapilacaklar>) {
        self.yapilacaklarListesi = yapilacaklarListesi
        self.yapilacaklarTableView.reloadData()
    }
}

extension anasayfaVC : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        anasayfaPresenterNesnesi?.ara(aramaKelimesi: searchText)
    }
}

extension anasayfaVC : UITableViewDelegate,UITableViewDataSource{
  
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yapilacaklarListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yapilacakIs = yapilacaklarListesi[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "toDoTableCell", for: indexPath) as! anasayfaTableViewCell
        hucre.durumView.layer.cornerRadius = hucre.durumView.frame.width
        hucre.durumView.layer.masksToBounds = true
        hucre.durumView.layer.borderWidth = 3
        hucre.durumView.layer.borderColor = UIColor(rgb: 0xEE827F).cgColor
        hucre.cellBackground.layer.cornerRadius = 30.0
        hucre.yapilacakIsListesi.text = "\(yapilacakIs.yapilacak_is!)"
      
        
        func check(indexPath: IndexPath) {
            let attributeString =  NSMutableAttributedString(string: "\(yapilacakIs.yapilacak_is!)")
                attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle,
                                                     value: NSUnderlineStyle.single.rawValue,
                                                         range: NSMakeRange(0, attributeString.length))
            hucre.yapilacakIsListesi.attributedText = attributeString
         
           
        }
        
        hucre.selectionStyle = .none
        
        return hucre
    }
  

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yapilacakIs = yapilacaklarListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: yapilacakIs)
        tableView.deselectRow(at: indexPath, animated: true)
    }
      
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .normal, title: "Sil"){ (contextualAction,view,bool) in
            
            let yapilacakIs = self.yapilacaklarListesi[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(yapilacakIs.yapilacak_is!) silinsin mi?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ action in
                
            }
            alert.addAction(iptalAction)
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.anasayfaPresenterNesnesi?.sil(yapilacak_id: yapilacakIs.yapilacak_id!)
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
extension String {
    func createAttributedString(stringtToStrike: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        let range = attributedString.mutableString.range(of: stringtToStrike)
        attributedString.addAttributes([NSAttributedString.Key.strikethroughStyle : NSUnderlineStyle.single], range: range)
        return attributedString
    }
}
