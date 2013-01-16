//
//  SecondViewController.m
//  test-modal-bug
//
//  Created by Eric Goldberg on 1/16/13.
//  Copyright (c) 2013 Eric Goldberg. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)launchShipModal:(id)sender {
    NSArray* testImages = [NSArray arrayWithObject:[UIImage imageNamed:@"demo_image.png"]];
    SYSincerelyController* ctrl = [[SYSincerelyController alloc] initWithImages:testImages
                                                                        product:SYProductTypePostcard
                                                                 applicationKey:@"JDD6XZY1A1GVS8NUF848YZEKL2YUBXBSBN4VBJVA"
                                                                       delegate:self];
    if (ctrl) {
        ctrl.modalPresentationStyle = UIModalPresentationFormSheet;
        [self presentViewController:ctrl animated:YES completion:^{
            NSLog(@"Done");
        }];
    }
    else {
        NSLog(@"ERROR creating controller! Images nil?");
        NSLog(@"%@", testImages);
    }
}

#pragma mark - Sincerely controller delegate

- (void)sincerelyControllerDidFinish:(SYSincerelyController *)controller {
    NSLog(@"did-finish");
}
- (void)sincerelyControllerDidCancel:(SYSincerelyController *)controller {
    NSLog(@"did-cancel");
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (void)sincerelyControllerDidFailInitiationWithError:(NSError *)error {
    NSLog(@"did-fail-initiation");
    NSLog(@"%@", error);
}


@end
