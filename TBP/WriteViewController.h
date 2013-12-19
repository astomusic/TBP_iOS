//
//  WriteViewController.h
//  TBP
//
//  Created by SunJin, Choi on 2013. 12. 18..
//  Copyright (c) 2013년 NHNNEXT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WriteViewController : UIViewController <UITextViewDelegate>
{
    UIImage* _internalImage;
}
@property (weak, nonatomic) IBOutlet UIImageView *writeImage;
@property (weak, nonatomic) IBOutlet UITextView *writeText;
- (void)prepareData:(UIImage*)image;
- (IBAction)onSendCilck:(id)sender;

@end