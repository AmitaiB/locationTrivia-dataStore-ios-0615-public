//
//  FISAddLocationViewController.m
//  locationTrivia-dataStore
//
//  Created by Amitai Blickstein on 6/19/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "FISAddLocationViewController.h"
#import "FISLocation.h"
#import "FISLocationsTableViewController.h"
#import "FISLocationsDataManager.h"

@interface FISAddLocationViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeTextField;
- (IBAction)cancelButtonTapped:(id)sender;
- (IBAction)doneButtonTapped:(id)sender;

@end

@implementation FISAddLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

-(BOOL)inputIsValid
{
    BOOL hasName = self.nameTextField.text.length > 0;
    BOOL hasLatitude = self.latitudeTextField.text.length > 0;
    BOOL hasLongitude = self.longitudeTextField.text.length > 0;
    
    return hasName && hasLatitude && hasLongitude;
}

- (IBAction)cancelButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)doneButtonTapped:(id)sender {
    if (![self inputIsValid]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Invalid input" message:@"All fields required, dude." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okAction];
        
        [self presentViewController:alert animated:YES completion:nil];
        
        return;
    }
    
    
    FISLocation *newLocation = [[FISLocation alloc] initWithName:self.nameTextField.text latitude:@([self.latitudeTextField.text integerValue]) longitude:@([self.longitudeTextField.text integerValue])];
    
    FISLocationsDataManager *dataManager = [FISLocationsDataManager sharedLocationsDataManager];
    
    [dataManager.locations addObject:newLocation];
    
    [self dismissViewControllerAnimated:YES completion:nil];

}
@end
