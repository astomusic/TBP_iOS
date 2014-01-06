//
//  DetailViewController.m
//  TBP
//
//  Created by SunJin, Choi on 2013. 12. 6..
//  Copyright (c) 2013년 NHNNEXT. All rights reserved.
//

#import "DetailViewController.h"
#import "UIImageView+WebCache.h"
#import "CustomCell2.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *DetailContent;
@property (weak, nonatomic) IBOutlet UILabel *DetailTitle;
@property (weak, nonatomic) IBOutlet UIImageView *DetailImage;

@end

@implementation DetailViewController
@synthesize recipeName;
@synthesize recipeContent;
@synthesize recipeImage;
@synthesize recipeComments;

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
    self.DetailTitle.text = recipeName;
    self.DetailContent.text = recipeContent;
    [self.DetailImage setImageWithURL:[NSURL URLWithString:recipeImage]];
	// Do any additional setup after loading the view.
    //NSLog(@"%@", [recipeComments count]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [recipeComments count];;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSArray* item = [recipeComments objectAtIndex:indexPath.row];
    
    CustomCell2 *myCell = [tableView dequeueReusableCellWithIdentifier:@"myCell2"];
    int no = indexPath.row;
    myCell.comment.text = [recipeComments[no] objectForKey:@"content"];
    
    return myCell;
}

@end
