import Foundation
class SepetPresenter: ViewToPresenterSepetProtocol {
    
    var sepetInteractor: PresenterToInteractorSepetProtocol?
    
    var sepetView: PresenterToViewSepetProtocol?
    
    func sepettekiTUMYemekleriSec(userName: String) {
        sepetInteractor?.sepettekiYemekSec(userName: userName)
    }
    
    func sepettenSil(sepet_yemek_id: Int, userName: String) {
        sepetInteractor?.sepettenYemekSil(sepet_yemek_id: sepet_yemek_id, userName: userName)
    }
    
}

extension SepetPresenter: InteractorToPresenterSepetProtocol {
    
    func PresenteraVeriGonder(SepettekiYemekListe: Array<SepettekiYemekler>) {
        sepetView?.ViewaVeriGonder(SepettekiYemekListe: SepettekiYemekListe)
    }

}
