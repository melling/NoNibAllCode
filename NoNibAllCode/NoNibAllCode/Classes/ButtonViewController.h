//
//  ButtonViewController.h
//  NoNibAllCode
//
//  Created by Michael Mellinger on 11/1/13.
//  Copyright (c) 2013 h4labs. All rights reserved.
//

@import UIKit;

@interface ButtonViewController : UIViewController

// Leave IBOutlet in case we ever switch to Storyboards
@property (strong, nonatomic) IBOutlet UIButton *transition1Btn;
@property (strong, nonatomic) IBOutlet UIButton *transition2Btn;
@property (strong, nonatomic) IBOutlet UIButton *transition3Btn;
@property (strong, nonatomic) IBOutlet UIButton *transition4Btn;
@end
