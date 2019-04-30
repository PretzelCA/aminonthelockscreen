#line 1 "Tweak.xm"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#define kBundlePath @"/Library/MobileSubstrate/DynamicLibraries/gq.skyenet.aminonthelockscreen.bundle"
@interface SBLockScreenViewControllerBase : UIViewController
@end


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBLockScreenViewControllerBase; 
static void (*_logos_orig$_ungrouped$SBLockScreenViewControllerBase$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL SBLockScreenViewControllerBase* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBLockScreenViewControllerBase$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SBLockScreenViewControllerBase* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBLockScreenViewControllerBase$jiggleLockIcon)(_LOGOS_SELF_TYPE_NORMAL SBLockScreenViewControllerBase* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBLockScreenViewControllerBase$jiggleLockIcon(_LOGOS_SELF_TYPE_NORMAL SBLockScreenViewControllerBase* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBLockScreenViewControllerBase$prepareForUIUnlock)(_LOGOS_SELF_TYPE_NORMAL SBLockScreenViewControllerBase* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBLockScreenViewControllerBase$prepareForUIUnlock(_LOGOS_SELF_TYPE_NORMAL SBLockScreenViewControllerBase* _LOGOS_SELF_CONST, SEL); 

#line 7 "Tweak.xm"

static void _logos_method$_ungrouped$SBLockScreenViewControllerBase$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SBLockScreenViewControllerBase* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$_ungrouped$SBLockScreenViewControllerBase$viewDidLoad(self, _cmd);

	NSBundle *bundle = [[[NSBundle alloc] initWithPath:kBundlePath] autorelease];

	NSString *aminImagePath = [bundle pathForResource:@"amin" ofType:@"png"];

	UIView *aminImage = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:aminImagePath]];
	[aminImage setFrame:CGRectMake(0, 0, 450, 800)];
	[self.view addSubview:aminImage];


}

static void _logos_method$_ungrouped$SBLockScreenViewControllerBase$jiggleLockIcon(_LOGOS_SELF_TYPE_NORMAL SBLockScreenViewControllerBase* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$_ungrouped$SBLockScreenViewControllerBase$jiggleLockIcon(self, _cmd);

	NSBundle *bundle = [[[NSBundle alloc] initWithPath:kBundlePath] autorelease];

	NSString *soundFilePath = [bundle pathForResource:@"amin"  ofType:@"m4a"];
	NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];

	AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];

	player.numberOfLoops = 0;

	[player play];
}

static void _logos_method$_ungrouped$SBLockScreenViewControllerBase$prepareForUIUnlock(_LOGOS_SELF_TYPE_NORMAL SBLockScreenViewControllerBase* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$_ungrouped$SBLockScreenViewControllerBase$prepareForUIUnlock(self, _cmd);

	NSBundle *bundle = [[[NSBundle alloc] initWithPath:kBundlePath] autorelease];

	NSString *soundFilePath = [bundle pathForResource:@"aminUnlock"  ofType:@"m4a"];
	NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];

	AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];

	player.numberOfLoops = 0;

	[player play];	
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBLockScreenViewControllerBase = objc_getClass("SBLockScreenViewControllerBase"); MSHookMessageEx(_logos_class$_ungrouped$SBLockScreenViewControllerBase, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$SBLockScreenViewControllerBase$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$SBLockScreenViewControllerBase$viewDidLoad);MSHookMessageEx(_logos_class$_ungrouped$SBLockScreenViewControllerBase, @selector(jiggleLockIcon), (IMP)&_logos_method$_ungrouped$SBLockScreenViewControllerBase$jiggleLockIcon, (IMP*)&_logos_orig$_ungrouped$SBLockScreenViewControllerBase$jiggleLockIcon);MSHookMessageEx(_logos_class$_ungrouped$SBLockScreenViewControllerBase, @selector(prepareForUIUnlock), (IMP)&_logos_method$_ungrouped$SBLockScreenViewControllerBase$prepareForUIUnlock, (IMP*)&_logos_orig$_ungrouped$SBLockScreenViewControllerBase$prepareForUIUnlock);} }
#line 52 "Tweak.xm"
