
import Foundation

protocol ViewToPresenterYapilacakDetayProtocol {
    var yapilacakDetayInteractor: PresenterToInteractorYapilacakDetayProtocol? {get set}
    
    func guncelle(yapilacak_id:Int,yapilacak_is:String)
}

protocol PresenterToInteractorYapilacakDetayProtocol {
    func isGuncelle(yapilacak_id:Int,yapilacak_is:String)
}

protocol PresenterToRouterYapilacakDetayProtocol {
    static func createModule(ref:detayVC)
}
