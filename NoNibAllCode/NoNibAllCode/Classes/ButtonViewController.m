//
//  ButtonViewController.m
//  NoNibAllCode
//
//  Created by Michael Mellinger on 11/1/13.
//  Copyright (c) 2013 h4labs. All rights reserved.
//

#import "ButtonViewController.h"

@interface ButtonViewController ()

@end

@implementation ButtonViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (UIButton *)createButton:(NSString *)title {
    UIButton *aBtn;

    aBtn = [[UIButton alloc] init];
    [aBtn setTitle:NSLocalizedString(title, @"Button Title") forState:UIControlStateNormal];
    aBtn.translatesAutoresizingMaskIntoConstraints = NO;

    aBtn.layer.borderWidth = 1.f;
    aBtn.layer.borderColor = [UIColor blackColor].CGColor;
    aBtn.layer.cornerRadius = 5.f;
    aBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
    aBtn.isAccessibilityElement = YES;
    aBtn.accessibilityLabel = title;
    
    return aBtn;
}

#pragma mark Button Actions

- (IBAction)transition1BtnAction:(UIButton *)sender {
    NSLog(@"Boom!");
}

- (IBAction)transition2BtnAction:(UIButton *)sender {
    NSLog(@"Boom!");
}

- (IBAction)transition3BtnAction:(UIButton *)sender {
    NSLog(@"Boom!");
}

- (IBAction)transition4BtnAction:(UIButton *)sender {
    NSLog(@"Boom!");
}

#pragma mark - Draw Screen

- (void)drawiPhoneScreen {
    
    self.transition1Btn = [self createButton:NSLocalizedString(@"Transition #1", @"")];
    [self.transition1Btn addTarget:self action:@selector(transition1BtnAction:) forControlEvents:UIControlEventTouchUpInside];

    self.transition2Btn = [self createButton:NSLocalizedString(@"Transition #2", @"")];
    [self.transition2Btn addTarget:self action:@selector(transition1BtnAction:) forControlEvents:UIControlEventTouchUpInside];

    self.transition3Btn = [self createButton:NSLocalizedString(@"Transition #3", @"")];
    [self.transition3Btn addTarget:self action:@selector(transition3BtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.transition4Btn = [self createButton:NSLocalizedString(@"Transition #4", @"")];
    [self.transition4Btn addTarget:self action:@selector(transition4BtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview: self.transition1Btn];
    [self.view addSubview: self.transition2Btn];
    [self.view addSubview: self.transition3Btn];
    [self.view addSubview: self.transition4Btn];
    
    // Just put all buttons in our view dictionary
    NSDictionary *viewDictionary = NSDictionaryOfVariableBindings(_transition1Btn, _transition2Btn, _transition3Btn, _transition4Btn);
    
    NSString *rowH1Constraint = @"H:|-15-[_transition1Btn(>=100)]-15-[_transition2Btn(==_transition1Btn)]-15-|";
    
    NSString *rowH2Constraint = @"H:|-15-[_transition3Btn(>=100)]-15-[_transition4Btn(==_transition1Btn)]-15-|";

    NSString *rowV1Constraint = @"V:|-175-[_transition1Btn(==50)]-50-[_transition3Btn(==_transition1Btn)]";
    
    NSString *rowV2Constraint = @"V:|-175-[_transition2Btn(==_transition1Btn)]-50-[_transition4Btn(==_transition1Btn)]";
    
    [self.view addConstraints: [NSLayoutConstraint
                                constraintsWithVisualFormat:rowH1Constraint
                                options:0
                                metrics:nil
                                views:viewDictionary]];

    [self.view addConstraints: [NSLayoutConstraint
                                constraintsWithVisualFormat:rowH2Constraint
                                options:0
                                metrics:nil
                                views:viewDictionary]];
    
    [self.view addConstraints: [NSLayoutConstraint
                                constraintsWithVisualFormat:rowV1Constraint
                                options:0
                                metrics:nil
                                views:viewDictionary]];

    [self.view addConstraints: [NSLayoutConstraint
                                constraintsWithVisualFormat:rowV2Constraint
                                options:0
                                metrics:nil
                                views:viewDictionary]];


}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self drawiPhoneScreen];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
