//
//  SecondViewController.h
//  test-modal-bug
//
//  Created by Eric Goldberg on 1/16/13.
//  Copyright (c) 2013 Eric Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sincerely/Sincerely.h"

@interface SecondViewController : UIViewController <SYSincerelyControllerDelegate>

- (IBAction)launchShipModal:(id)sender;

@end
