
import Foundation

class yapilacakDetayRouter : PresenterToRouterYapilacakDetayProtocol {
    static func createModule(ref: detayVC) {
        ref.yapilacakDetayPresenterNesnesi = yapilacakDetayPresenter()
        ref.yapilacakDetayPresenterNesnesi?.yapilacakDetayInteractor = yapilacakDetayInteractor()
    }
}
