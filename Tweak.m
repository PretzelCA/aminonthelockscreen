#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#define kBundlePath @"/Library/MobileSubstrate/DynamicLibraries/gq.skyenet.aminonthelockscreen.bundle"
@interface SBLockScreenViewControllerBase : UIViewController
@end

%group normal
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
%end

%group legacy
%hook SBLockScreenViewControllerBase
	- (void)viewWillAppear {
		%orig;
		
		NSBundle *bundle = [[[NSBundle alloc] initWithPath:kBundlePath] autorelease];

		NSString *aminImagePath = [bundle pathForResource:@"amin" ofType:@"png"];

		UIView *aminImage = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:aminImagePath]];
		[aminImage setFrame:CGRectMake(0, 0, 450, 800)];
		[self.view addSubview:aminImage];


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
%end

%group newSpringboard
%hook SBLockScreenLockingAndUnlocking
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
%end

%ctor {
	float version = [[[UIDevice currentDevice] systemVersion] floatValue];
	if (version >= 13) {
		%init(newSpringboard);
	}
	else if (version >= 11 && version < 13) {
		%init(normal);
	} else if (version < 11 && version >= 10) {
		%init(legacy);
	} else {
		// They should not be able to access this package but we should still do something
	}
}
