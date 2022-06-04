
import UIKit
import Kingfisher

class YemeklerDetayVC: UIViewController {
    @IBOutlet weak var yemekImageView: UIImageView!
    @IBOutlet weak var yemekAdLabel: UILabel!
    @IBOutlet weak var yemekFiyatLabel: UILabel!
    @IBOutlet weak var sepeteEkleButton: UIButton!
    @IBOutlet weak var yemekAdetLabel: UILabel!
    @IBOutlet weak var adetStepper: UIStepper!
       
    var username: String?
    var yemekDetay: Yemekler?
    var sepettekiYemekler = [SepettekiYemekler]()
    var yemekPresenterNesnesi: ViewToPresenterYemeklerDetayProtocol?
    var sepetPresenterNesnesi: ViewToPresenterSepetProtocol?
       

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Detay"
       
        yemekAdLabel.text = yemekDetay?.yemek_adi
        
        if let y = yemekDetay {
            yemekAdLabel.text = "\(y.yemek_adi)"
            yemekFiyatLabel.text = "\(y.yemek_fiyat)₺"
            
            if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(y.yemek_resim_adi)"){
                yemekImageView.kf.setImage(with: url)
            }
        }
        sepeteEkleButton.layer.cornerRadius = 10
        adetStepper.minimumValue = 1
                
        YemeklerDetayRouter.createModule(ref: self)
        SepetRouter.createModule(ref:(self.navigationController?.tabBarController?.viewControllers?[1]) as! SepetViewController)
        sepetPresenterNesnesi?.sepettekiTUMYemekleriSec(userName: username ?? "Kübra")

    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
            yemekAdetLabel.text = Int(sender.value).description
            yemekFiyatLabel.text = String(Int(yemekDetay!.yemek_fiyat)! * Int(sender.value)) + " ₺"
    }
    
    @IBAction func sepeteEkle(_ sender: UIButton) {
           var check = false
           for i in sepettekiYemekler {
               if yemekDetay?.yemek_adi == i.yemek_adi {
                   sepetPresenterNesnesi?.sepettenSil(sepet_yemek_id: Int(i.sepet_yemek_id!)!, userName: username ?? "Kübra")
                   
                   yemekPresenterNesnesi?.sepeteEkle(yemekAd: yemekDetay!.yemek_adi, yemekImageAd: yemekDetay!.yemek_resim_adi, yemekFiyat: Int(yemekDetay!.yemek_fiyat)!, yemekAdedi: Int(yemekAdetLabel.text!)! + Int(i.yemek_siparis_adet!)!, userName: username ?? "Kübra")
                   check = true
               }
           }
           
           if check == false {
               yemekPresenterNesnesi?.sepeteEkle(yemekAd: yemekDetay!.yemek_adi, yemekImageAd: yemekDetay!.yemek_resim_adi, yemekFiyat: Int(yemekDetay!.yemek_fiyat)!, yemekAdedi: Int(yemekAdetLabel.text!)!, userName: username ?? "Kübra")
           }
    }
    
    
}

extension YemeklerDetayVC: PresenterToViewYemeklerDetayProtocol, PresenterToViewSepetProtocol {
    func ViewaVeriGonder(SepettekiYemekListe: Array<SepettekiYemekler>) {
            self.sepettekiYemekler = SepettekiYemekListe
    }
}
