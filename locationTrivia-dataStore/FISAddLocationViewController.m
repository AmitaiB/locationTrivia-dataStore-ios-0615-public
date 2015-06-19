//
//  FISAddLocationViewController.m
//  locationTrivia-dataStore
//
//  Created by Amitai Blickstein on 6/18/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "FISAddLocationViewController.h"
#import "FISLocationsTableViewController.h"
#import "FISLocation.h"

@interface FISAddLocationViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeTextField;

- (IBAction)saveNewLocation:(id)sender;


@end

@implementation FISAddLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    FISLocationsTableViewController *destination = segue.destinationViewController;
    
//    UIBarButtonSystemItemSave
    
    
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
//}


//- (IBAction)nameTextFieldEntry:(id)sender {
//
//}
- (IBAction)saveNewLocation:(id)sender {
    NSString *newName = UITextFieldTextDidEndEditingNotification;
    NSNumber *newLat = [NSNumber numberWithFloat: [UITextFieldTextDidEndEditingNotification floatValue]];
    NSNumber *newLong = [NSNumber numberWithFloat:[UITextFieldTextDidEndEditingNotification floatValue]];
    FISLocation *newLocationToSave = [[FISLocation alloc] initWithName:newName latitude:newLat longitude:newLong];
    FISLocationsDataManager *listOf = [[FISLocationsDataManager alloc] init];
    [listOf.locations addObject:newLocationToSave];
}
@end
