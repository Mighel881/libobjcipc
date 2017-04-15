#import <AssertionServices/BKSProcessAssertion.h>
#import <SpringBoard/SBApplicationController.h>
#import <version.h>

typedef enum {
    NSNotificationSuspensionBehaviorDrop = 1,
    NSNotificationSuspensionBehaviorCoalesce = 2,
    NSNotificationSuspensionBehaviorHold = 3,
    NSNotificationSuspensionBehaviorDeliverImmediately = 4
} NSNotificationSuspensionBehavior;

@interface SBApplication : NSObject
- (BOOL)suspendingUnsupported;
- (BOOL)isRunning;
@end

@interface SpringBoard : UIApplication
- (BOOL)launchApplicationWithIdentifier:(NSString *)identifier suspended:(BOOL)suspended;
@end

@interface BSAuditToken : NSObject
- (int)pid;
@end

@interface BKSProcessAssertion ()
- (instancetype)initWithBundleIdentifier:(id)arg1 flags:(unsigned)arg2 reason:(unsigned)arg3 name:(id)arg4 withHandler:(/*^block*/id)arg5 ;
- (void)invalidate;
@end

@interface NSDistributedNotificationCenter : NSNotificationCenter
+ (instancetype)defaultCenter;
- (void)addObserver:(id)notificationObserver selector:(SEL)notificationSelector name:(NSString *)notificationName object:(NSString *)notificationSender suspensionBehavior:(NSNotificationSuspensionBehavior)suspendedDeliveryBehavior;
- (void)removeObserver:(id)notificationObserver name:(NSString *)notificationName object:(NSString *)notificationSender;
- (void)postNotificationName:(NSString *)notificationName object:(NSString *)notificationSender userInfo:(NSDictionary *)userInfo deliverImmediately:(BOOL)deliverImmediately;
@end
