
import Foundation
class YemeklerRouter: PresenterToRouterYemeklerProtocol {
    
    static func createModule(ref: YemeklerViewController) {
        
        let presenter = YemeklerPresenter()
        
        ref.yemeklerPresenterNesnesi = presenter
        
        ref.yemeklerPresenterNesnesi?.yemeklerInteractor = YemeklerInteractor()
        ref.yemeklerPresenterNesnesi?.yemeklerView = ref
        
        ref.yemeklerPresenterNesnesi?.yemeklerInteractor?.yemeklerPresenter = presenter
    }
    
}
