import Foundation

protocol ViewToPresenterSepetProtocol {
    var sepetInteractor: PresenterToInteractorSepetProtocol? { get set }
    var sepetView: PresenterToViewSepetProtocol? { get set }
    
    func sepettekiTUMYemekleriSec(userName: String)
    func sepettenSil(sepet_yemek_id: Int, userName: String)
}

protocol PresenterToInteractorSepetProtocol {
    var sepetPresenter: InteractorToPresenterSepetProtocol? { get set }
    
    func sepettekiYemekSec(userName: String)
    func sepettenYemekSil(sepet_yemek_id: Int, userName: String)
}

protocol InteractorToPresenterSepetProtocol {
    func PresenteraVeriGonder(SepettekiYemekListe: Array<SepettekiYemekler>)
}

protocol PresenterToViewSepetProtocol {
    func ViewaVeriGonder(SepettekiYemekListe: Array<SepettekiYemekler>)
}

protocol PresenterToRouterSepetProtocol {
    static func createModule(ref: SepetViewController)
}
