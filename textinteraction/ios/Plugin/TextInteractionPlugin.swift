import Foundation
import Capacitor

@objc(TextInteractionPlugin)
public class TextInteractionPlugin: CAPPlugin {

    @objc func toggle(_ call: CAPPluginCall) {
        let enabled = call.getBool("enabled") ?? false
        
        DispatchQueue.main.async {
            if #available(iOS 14.5, *) {
                self.bridge?.webView?.configuration.preferences.isTextInteractionEnabled = enabled
                call.resolve(["success": true])
            } else {
                call.resolve(["success": false])
            }
        }
    }
}
