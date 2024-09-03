import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(GameAnalyticsPlugin)
public class GameAnalyticsPlugin: CAPPlugin {
    
    @objc func initialize(_ call: CAPPluginCall) {
        //debug
        let debug = call.getBool("debug", false)
        GameAnalytics.setEnabledInfoLog(debug)
        GameAnalytics.setEnabledVerboseLog(debug)
        
        //build
        if let build = call.getString("build") {
            GameAnalytics.configureAutoDetectAppVersion(false)
            GameAnalytics.configureBuild(build)
        } else {
            GameAnalytics.configureAutoDetectAppVersion(true)
        }
        
        //initialize
        let key = call.getString("key")
        let secret = call.getString("secret")
        GameAnalytics.initialize(withGameKey: key, gameSecret: secret)
        
        call.resolve()
    }
    
    @objc func addBusinessEvent(_ call: CAPPluginCall) {
        let currency = call.getString("currency")
        let amount = call.getInt("amount")
        let itemType = call.getString("itemType")
        let itemId = call.getString("itemType")
        let cartType = call.getString("cartType")
        let receipt = call.getString("receipt");
        GameAnalytics.addBusinessEvent(withCurrency: currency, amount: amount!, itemType: itemType, itemId: itemId, cartType: cartType, receipt: receipt)
    }
    
    @objc func addDesignEvent(_ call: CAPPluginCall) {
        let id = call.getString("id")
        let value = call.getFloat("value")
        let customFields = call.getObject("customFields")
        if (value != nil && customFields != nil) {
            GameAnalytics.addDesignEvent(withEventId: id, value: NSNumber(value: value!), customFields: customFields)
        } else if (value == nil && customFields != nil) {
            GameAnalytics.addDesignEvent(withEventId: id, customFields: customFields)
        } else if (value != nil && customFields == nil) {
            GameAnalytics.addDesignEvent(withEventId: id, value: NSNumber(value: value!))
        } else {
            GameAnalytics.addDesignEvent(withEventId: id)
        }

    }
}
