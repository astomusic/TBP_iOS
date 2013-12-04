//
//  SigninViewController.m
//  TBP
//
//  Created by SunJin, Choi on 2013. 11. 27..
//  Copyright (c) 2013년 NHNNEXT. All rights reserved.
//

#import "SigninViewController.h"
#import "DataModel.h"

@interface SigninViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userid;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *passwordconfirm;

@end

@implementation SigninViewController
{
    DataModel* _signinData;
}

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
    [self.view endEditing:YES];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
    [self.view addGestureRecognizer:tap];
    
    _signinData = [[DataModel alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dismissKeyboard:(UITapGestureRecognizer*)reg
{
    [self.view endEditing:YES];
}
- (IBAction)signinRegister:(id)sender {
    if([self.passwordconfirm.text isEqualToString:self.password.text] && [self.userid.text length]!=0) {
        [_signinData saveID:[_userid text] withPassword:[_password text]];
        NSLog(@"%@", _signinData);
    } else {
        NSLog(@"NOT CORRECT PASSWORDS");
    }
    
}

@end
