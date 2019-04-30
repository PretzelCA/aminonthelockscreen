#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#define kBundlePath @"/Library/MobileSubstrate/DynamicLibraries/gq.skyenet.aminonthelockscreen.bundle"
@interface SBLockScreenViewControllerBase : UIViewController
@end

%hook SBLockScreenViewControllerBase
- (void)viewDidLoad {
	%orig;
	
	NSBundle *bundle = [[[NSBundle alloc] initWithPath:kBundlePath] autorelease];

	NSString *aminImagePath = [bundle pathForResource:@"amin" ofType:@"png"];

	UIView *aminImage = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:aminImagePath]];
	[aminImage setFrame:CGRectMake(0, 0, 450, 800)];
	[self.view addSubview:aminImage];


}

-(void)jiggleLockIcon {
	%orig;

	NSBundle *bundle = [[[NSBundle alloc] initWithPath:kBundlePath] autorelease];

	NSString *soundFilePath = [bundle pathForResource:@"amin"  ofType:@"m4a"];
	NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];

	AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];

	player.numberOfLoops = 0;

	[player play];
}

-(void)prepareForUIUnlock {
	%orig;

	NSBundle *bundle = [[[NSBundle alloc] initWithPath:kBundlePath] autorelease];

	NSString *soundFilePath = [bundle pathForResource:@"aminUnlock"  ofType:@"m4a"];
	NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];

	AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];

	player.numberOfLoops = 0;

	[player play];	
}
%end