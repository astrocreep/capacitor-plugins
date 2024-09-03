#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

CAP_PLUGIN(GameCenterPlugin, "GameCenter",
           CAP_PLUGIN_METHOD(authenticate, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(toggleAccessPoint, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(addScore, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(progressAchievement, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(commit, CAPPluginReturnPromise);
           )
