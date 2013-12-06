//
//  DetailViewController.m
//  TBP
//
//  Created by SunJin, Choi on 2013. 12. 6..
//  Copyright (c) 2013년 NHNNEXT. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITableViewCell *DetailTitle;
//@property (nonatomic, strong) NSString *recipeName;

@end

@implementation DetailViewController
@synthesize recipeName;

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
    self.DetailTitle.textLabel.text = recipeName;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
