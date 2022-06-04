
import Foundation

struct Constants {
    
        static let appName = "Yemekler"
        static let detaySegue = "YemeklerToDetay"
        static let yemeklerIdentifier = "yemekCell"
        static let sepetIdentifier = "sepetCell"
        static let loginIdentifier = "loginToYemekler"
        static let signUpIdentifier = "signUpToYemekler"
        
        struct Urller {
            static let tumYemekleriGetirUrl = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php"
            static let sepeteYemekEkleUrl = "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php"
            static let sepettekiYemekleriGetirUrl = "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php"
            static let sepettenYemekSilUrl = "http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php"
            static let yemekImageUrl = "http://kasimadalan.pe.hu/yemekler/resimler/"
        }
        
    
}
