import Foundation

class YemeklerDetayRouter: PresenterToRouterYemeklerDetayProtocol {
    
    static func createModule(ref: YemeklerDetayVC) {
        
        let presenter = YemeklerDetayPresenter()
        
        ref.yemekPresenterNesnesi = presenter
        ref.sepetPresenterNesnesi = SepetPresenter()
        
        ref.yemekPresenterNesnesi?.yemekInteractor = YemeklerDetayInteractor()
        
        let presenter2 = SepetPresenter()
        ref.sepetPresenterNesnesi = presenter2
        
        ref.sepetPresenterNesnesi?.sepetInteractor = SepetInteractor()
        ref.sepetPresenterNesnesi?.sepetView = ref
        
        ref.sepetPresenterNesnesi?.sepetInteractor?.sepetPresenter = presenter2
        
    }
    
    
}
