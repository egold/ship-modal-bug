//
//  ViewController.m
//  test-modal-bug
//
//  Created by Eric Goldberg on 1/16/13.
//  Copyright (c) 2013 Eric Goldberg. All rights reserved.
//

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@property (nonatomic) BOOL usingDeprecatedMode;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.usingDeprecatedMode = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)launchModal:(id)sender {
    _usingDeprecatedMode = NO;
    NSArray* testImages = [NSArray arrayWithObject:[UIImage imageNamed:@"demo_image.png"]];
    SYSincerelyController* ctrl = [[SYSincerelyController alloc] initWithImages:testImages
                                                                        product:SYProductTypePostcard
                                                                 applicationKey:@"JDD6XZY1A1GVS8NUF848YZEKL2YUBXBSBN4VBJVA"
                                                                       delegate:self];

    ctrl.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:ctrl animated:YES completion:NULL];
    
    [ctrl release];
}

- (IBAction)launchModalDeprecated:(id)sender {
    _usingDeprecatedMode = YES;
    NSArray* testImages = [NSArray arrayWithObject:[UIImage imageNamed:@"demo_image.png"]];
    SYSincerelyController* ctrl = [[SYSincerelyController alloc] initWithImages:testImages
                                                                        product:SYProductTypePostcard
                                                                 applicationKey:@"JDD6XZY1A1GVS8NUF848YZEKL2YUBXBSBN4VBJVA"
                                                                       delegate:self];

    ctrl.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentModalViewController:ctrl animated:YES];
    [ctrl release];
}

#pragma mark - Sincerely controller delegate

- (void)sincerelyControllerDidFinish:(SYSincerelyController *)controller {
    NSLog(@"did-finish");
    if (_usingDeprecatedMode) {
        [self dismissModalViewControllerAnimated:YES];
    }
    else {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}
- (void)sincerelyControllerDidCancel:(SYSincerelyController *)controller {
    NSLog(@"did-cancel");
    if (_usingDeprecatedMode) {
        [self dismissModalViewControllerAnimated:YES];
    }
    else {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

- (void)sincerelyControllerDidFailInitiationWithError:(NSError *)error {
    NSLog(@"did-fail-initiation");
    NSLog(@"%@", error);
}


@end

#pragma clang diagnostic pop
