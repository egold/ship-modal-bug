//
//  ViewController.h
//  test-modal-bug
//
//  Created by Eric Goldberg on 1/16/13.
//  Copyright (c) 2013 Eric Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sincerely/Sincerely.h"

@interface ViewController : UIViewController <SYSincerelyControllerDelegate>

- (IBAction)launchModal:(id)sender;
- (IBAction)launchModalDeprecated:(id)sender;

@end
