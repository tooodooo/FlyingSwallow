//
//  Mixer.m
//  Mute
//
//  Created by Florian Pichler on 01.01.13.
//  Copyright (c) 2013 TILOA. All rights reserved.
//

#import "Mixer.h"
#import <AppleScriptObjC/AppleScriptObjC.h>

@interface NSObject (AppleScript)

- (NSNumber *)getVolume;
- (void)setDefaultInputVolume:(NSNumber *)volume;

@end


@interface Mixer () {
	NSAppleScript *getVolume;
	id defaultInput;

	double currentVolume;
}

@end

@implementation Mixer
@synthesize muted;
- (id)init {
    self = [super init];
    if (self) {
		defaultInput = NSClassFromString(@"DefaultInput");
        currentVolume = self.inputVolume;
        if (currentVolume == 0) {
            currentVolume = 0.5;
        }
		
    }
    return self;
}

- (void)setInputVolume:(double)inputVolume {
	[defaultInput setDefaultInputVolume:[NSNumber numberWithInt:round(inputVolume * 100)]];
}

- (double)inputVolume {
	NSNumber *volume = [defaultInput getVolume];
	return [volume doubleValue] / 100.0;
//    return 0.5;
}

- (void)mute {
	if (self.inputVolume != 0) {
		currentVolume = self.inputVolume;
		self.inputVolume = 0;
	}
}

- (void)unmute {
	if (self.inputVolume == 0) {
		self.inputVolume = currentVolume;
	}
}

- (BOOL)muted {
    if (self.inputVolume == 0) {
        muted = YES;
    } else {
        muted = NO;
    }
    return muted;
}



- (void)setMuted:(BOOL)_muted {
    muted = _muted;
}

@end
