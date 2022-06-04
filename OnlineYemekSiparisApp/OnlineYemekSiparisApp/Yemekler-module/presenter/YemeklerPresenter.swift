

import Foundation
class YemeklerPresenter: ViewToPresenterYemeklerProtocol {
    
    var yemeklerInteractor: PresenterToInteractorYemeklerProtocol?
    
    var yemeklerView: PresenterToViewYemeklerProtocol?
    
    func tumYemekleriSec() {
        yemeklerInteractor?.yemekleriSec()
    }
    
    
}

extension YemeklerPresenter: InteractorToPresenterYemeklerProtocol {
    
    func PresenteraVeriGonder(yemekListe: Array<Yemekler>) {
        yemeklerView?.ViewaVeriGonder(yemekListe: yemekListe)
    }
    
    
}

