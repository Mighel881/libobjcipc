#import <dlfcn.h>
#import <Foundation/Foundation.h>
#import <version.h>

%hookf(int, XPCConnectionHasEntitlement, id connection, NSString *entitlement) {
  // to enable process assertions in SpringBoard
  if ([entitlement isEqualToString:@"com.apple.multitasking.unlimitedassertions"]) {
    return true;
  }

  return %orig;
}

%ctor {
  if (IS_IOS_OR_NEWER(iOS_8_0)) {
    return;
  }
  // load the library
  dlopen("/System/Library/PrivateFrameworks/XPCObjects.framework/XPCObjects", RTLD_LAZY);
  // replace the function
  void *XPCConnectionHasEntitlement = MSFindSymbol(NULL, "_XPCConnectionHasEntitlement");
  %init;
}
