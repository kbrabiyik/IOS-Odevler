
import Foundation

protocol ViewToPresenterYemeklerDetayProtocol {
    var yemekInteractor: PresenterToInteractorYemeklerDetayProtocol? { get set }
    
    func sepeteEkle(yemekAd: String, yemekImageAd: String, yemekFiyat: Int, yemekAdedi: Int, userName: String)

}

protocol PresenterToInteractorYemeklerDetayProtocol {
    
    func sepeteYemekEkle(yemekAd: String, yemekImageAd: String, yemekFiyat: Int, yemekAdedi: Int, userName: String)
    
}

protocol InteractorToPresenterYemeklerDetayProtocol {
    func PresenteraVeriGonder(SepettekiYemekListe: Array<SepettekiYemekler>)
}

protocol PresenterToViewYemeklerDetayProtocol {
    func ViewaVeriGonder(SepettekiYemekListe: Array<SepettekiYemekler>)
}

protocol PresenterToRouterYemeklerDetayProtocol {
    static func createModule(ref: YemeklerDetayVC)
}
