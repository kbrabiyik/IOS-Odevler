
import Foundation

class yapilacakKayitRouter : PresenterToRouterYapilacakKayitProtocol {
    static func createModule(ref: kayitVC) {
        ref.yapilacakKayitPresenterNesnesi = yapilacakKayitPresenter()
        ref.yapilacakKayitPresenterNesnesi?.yapilacakKayitInteractor = yapilacakKayitInteractor()
    }
}
