//
//  TableViewController.m
//  TBP
//
//  Created by SunJin, Choi on 2013. 12. 4..
//  Copyright (c) 2013년 NHNNEXT. All rights reserved.
//

#import "TableViewController.h"
#import "DataModel.h"
#import "DetailViewController.h"

@interface TableViewController ()
{
    DataModel* _dataModel;
}

@end

@implementation TableViewController

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
    _dataModel = [[DataModel alloc]init];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Datasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataModel numberOfData];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary* item = [_dataModel objectAtIndex:indexPath.row];
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    cell.textLabel.text = [item objectForKey:@"text"];
    cell.detailTextLabel.text = [item objectForKey:@"image"];
    cell.imageView.image = [UIImage imageNamed:@"background.jpg"];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0];
    cell.detailTextLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:12.0];

//    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 200, 50)];
//    [button setTitle:@"test" forState:UIControlStateNormal];
//    [button setBackgroundColor:[UIColor redColor]];
//    
//    [cell.contentView addSubview:button];
//    [button addTarget:self action:@selector(link:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) { //first row
        return 140;
    }
    else {
        return 140;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"ShowDetail" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showIngredientsSegue"]){
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailViewController *destViewController = segue.destinationViewController;
        destViewController.recipeName = @"hihi";
    }
}

//-(IBAction)link:(id)sender
//{
//
//}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    NSLog(@"there");
//}
//
//-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
//{
//    NSLog(@"HIHI");
//    return YES;
//}

@end
