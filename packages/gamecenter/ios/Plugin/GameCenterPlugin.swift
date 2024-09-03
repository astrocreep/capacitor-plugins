import Foundation
import Capacitor
import GameKit
import UIKit

@available(iOS 14.0, *)
@objc(GameCenterPlugin)
public class GameCenterPlugin: CAPPlugin {
    static let notificationOptin = Notification.Name("gamecenter")
    
    var achievements: [GKAchievement] = []
    var dirty: [GKAchievement] = []
    var initialized: Bool = false
    var reporting: Bool = false
    
    @objc public func authenticate(_ call: CAPPluginCall) {
        if (!self.initialized) {
            NotificationCenter.default.addObserver(self, selector: #selector(reportAchievementChanges), name: GameCenterPlugin.notificationOptin, object: nil)
            self.initialized = true;
        }
        
        GKLocalPlayer.local.authenticateHandler = { gcViewController, error in
            if gcViewController != nil {
                // Present the view controller so the player can sign in.
                let capacitorViewController: UIViewController = (self.bridge?.viewController)!
                capacitorViewController.present(gcViewController!, animated: true)
                // wait, this handler will be triggered again.
                return
            }
            if error != nil {
                // Player could not be authenticated.
                // Disable Game Center in the game.
                call.reject("GameCenterUnautenticated")
                return
            }
            
            // now load the in progress achievements
            GKAchievement.loadAchievements(completionHandler: { (achievements: [GKAchievement]?, error: Error?) in
                if (error != nil) {
                    call.reject("GameCenterLoadingError")
                    return
                }
                if let achievements = achievements {
                    self.achievements = achievements
                }
                call.resolve()
            })
        }
    }

    @objc public func toggleAccessPoint(_ call: CAPPluginCall) {
        guard GKLocalPlayer.local.isAuthenticated else {
            call.reject("GameCenterUnauthenticated")
            return
        }
        DispatchQueue.main.async {
            GKAccessPoint.shared.location = .topLeading
            GKAccessPoint.shared.showHighlights = true
            let show = call.getBool("show")
            GKAccessPoint.shared.isActive = show!
            call.resolve(["success": true])
        }
    }

    @objc public func addScore(_ call: CAPPluginCall) {
        guard GKLocalPlayer.local.isAuthenticated else {
            call.reject("GameCenterUnautenticated")
            return
        }
        let identifier = call.getString("identifier")!
        let score = call.getInt("score")!

        GKLeaderboard.submitScore(score, context: 0, player: GKLocalPlayer.local, leaderboardIDs: [identifier], completionHandler: {
            error -> Void in

            let success = error == nil
            call.resolve(["success": success])
        })
    }
    
    @objc public func progressAchievement(_ call: CAPPluginCall) {
        let identifier = call.getString("identifier")!
        let progress = Double(call.getFloat("progress")!)
        
        var achievement = self.achievements.first(where: {$0.identifier == identifier})
        
        if (achievement == nil) {
            achievement = GKAchievement.init(identifier: identifier)
            self.achievements.append(achievement!)
        }
        
        if (!(achievement!.isCompleted) && achievement!.percentComplete != progress) {
            achievement!.percentComplete = progress
            
            if (!self.dirty.contains(achievement!)) {
                self.dirty.append(achievement!)
            }
        }
         
        call.resolve()
        
        if (self.reporting || self.dirty.isEmpty) {
            return
        }
        
        self.reporting = true
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1)) {
            NotificationCenter.default.post(name: GameCenterPlugin.notificationOptin, object: nil)
        }
    }
    
    @objc public func reportAchievementChanges() {
        if (self.dirty.isEmpty) {
            self.reporting = false
            return
        }
        
        print("REPORT ACHIEVEMENT CHANGES")
        
        let toReport = self.dirty.map { $0 }
        self.dirty = []
        self.reporting = false
        
        for achievement in toReport {
            achievement.showsCompletionBanner = true
        }
        
        GKAchievement.report(toReport) { (error) in
            if (error != nil) {
                self.dirty += toReport
            }
        }
    }
}
