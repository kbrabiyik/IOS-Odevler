
import Foundation


class YemeklerDetayPresenter: ViewToPresenterYemeklerDetayProtocol, ViewToPresenterSepetProtocol {
    
    var sepetInteractor: PresenterToInteractorSepetProtocol?
    
    var sepetView: PresenterToViewSepetProtocol?
    
    func sepettekiTUMYemekleriSec(userName: String) {
        sepetInteractor?.sepettekiYemekSec(userName: userName)
    }
    
    func sepettenSil(sepet_yemek_id: Int, userName: String) {
        sepetInteractor?.sepettenYemekSil(sepet_yemek_id: sepet_yemek_id, userName: userName)
    }
    
    
    var yemekInteractor: PresenterToInteractorYemeklerDetayProtocol?
    
    func sepeteEkle(yemekAd: String, yemekImageAd: String, yemekFiyat: Int, yemekAdedi: Int, userName: String) {
        
        yemekInteractor?.sepeteYemekEkle(yemekAd: yemekAd, yemekImageAd: yemekImageAd, yemekFiyat: yemekFiyat, yemekAdedi: yemekAdedi, userName: userName)
    }
    
}

extension YemeklerDetayPresenter: InteractorToPresenterSepetProtocol {
    func PresenteraVeriGonder(SepettekiYemekListe: Array<SepettekiYemekler>) {
        sepetView?.ViewaVeriGonder(SepettekiYemekListe: SepettekiYemekListe)
    }
   
}
