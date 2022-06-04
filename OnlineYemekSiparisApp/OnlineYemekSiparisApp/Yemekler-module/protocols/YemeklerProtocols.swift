

import Foundation

protocol ViewToPresenterYemeklerProtocol {
    var yemeklerInteractor: PresenterToInteractorYemeklerProtocol? { get set }
    var yemeklerView: PresenterToViewYemeklerProtocol? { get set }
    
    func tumYemekleriSec()
}

protocol PresenterToInteractorYemeklerProtocol {
    var yemeklerPresenter: InteractorToPresenterYemeklerProtocol? { get set }
    
    func yemekleriSec()
}


//
protocol InteractorToPresenterYemeklerProtocol {
    func PresenteraVeriGonder(yemekListe: Array<Yemekler>)
}


protocol PresenterToViewYemeklerProtocol {
    func ViewaVeriGonder(yemekListe: Array<Yemekler>)
}


//
protocol PresenterToRouterYemeklerProtocol {
    static func createModule(ref: YemeklerViewController)
}
