#define LOG_MESSAGE_BODY 0

#ifdef DEBUG
	#define IPCLOG(x,...) HBLogDebug(@"*** libobjcipc: %@",[NSString stringWithFormat:(x), ##__VA_ARGS__])
#else
	// Replace with call to [NSString stringWithFormat:] so that any variables passed aren't marked as unused.
	#define IPCLOG(x,...) [NSString stringWithFormat:(x), ##__VA_ARGS__]
#endif

static NSString * const PrefPath = @"/var/mobile/Library/Preferences/libobjcipc.plist";
static NSString * const SpringBoardIdentifier = @"com.apple.springboard";
static NSString * const OBJCIPCActivateAppNotification = @"OBJCIPCActivateAppNotification";
static NSString * const OBJCIPCDeactivateAppNotification = @"OBJCIPCDeactivateAppNotification";

@class OBJCIPC, OBJCIPCConnection, OBJCIPCMessage;

typedef NSDictionary *(^OBJCIPCIncomingMessageHandler)(NSDictionary *); // return NSDictionary or nil to reply
typedef void(^OBJCIPCReplyHandler)(NSDictionary *);

typedef struct {
	char magicNumber[3];
	BOOL replyFlag;
	char messageIdentifier[5];
	char messageName[256];
	int contentLength;
} OBJCIPCMessageHeader;
