# NoNibAllCode

An iOS program that does UI with only code.  No storyboards or nibs.


1. Create a new project of type 'Empty Application'

2. Change AppDelegate to create a Navigation Controller and add a top level view controller

<pre>
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UINavigationController *navController = [[UINavigationController alloc] init];
    self.window.rootViewController = navController;
    // Do we want a tableview controller or regular uiviewcontroller?
    
//    UITableViewController *topLevelController = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    UIViewController *topLevelController = [[UIViewController alloc] init];
    topLevelController.view.backgroundColor = [UIColor greenColor];
    
    [navController addChildViewController: topLevelController];
    //    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;

}

</pre>

See git branch: Step_1

## Register custom UITableViewCell

3. Create custom UITableViewController for main nav.  Had to subclass UITableViewCell so I could register them.  Might be better to give in and use xib's for table cells?

[Setting style of UITableViewCell when using iOS 6 UITableView dequeueReusableCellWithIdentifier:forIndexPath:](http://stackoverflow.com/questions/13174972/setting-style-of-uitableviewcell-when-using-ios-6-uitableview-dequeuereusablecel)
<pre>
[self.tableView registerClass:[MainNavTableCell class] forCellReuseIdentifier:@"MainNavCell"];
</pre>

Here's what it looks like when we register a nib:

<pre>
  [self.tableView registerNib:[UINib nibWithNibName:@"MissedWordTableCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"MissedWordCell"];
</pre>

## Create Detail View Controllers

In MainNavTableViewController.m, add the following UITableViewController delegate method:
<pre>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.title = [NSString stringWithFormat:@"ViewController #%d", indexPath.row];
    vc.view.backgroundColor = self.viewControllerColors[indexPath.row]; // Add a little color
    [self.navigationController pushViewController:vc animated:YES];

}
</pre>

We are creating a new UIViewController instance on every selection and having the navigationController push it onto its stack.  What we want to do, of course, is create our own custom UIViewController subclasses.

See git branch: Step_2

## Autolayout

<pre>
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
</pre>

<pre>
// Using (id)sender is common but autocompletion is better with type

- (IBAction)transition1BtnAction:(UIButton *)sender { 
    NSLog(@"Button #1 Pressed");
}

- (IBAction)transition2BtnAction:(UIButton *)sender {
    NSLog(@"Button #2 Pressed");
}

- (IBAction)transition3BtnAction:(UIButton *)sender {
    NSLog(@"Button #3 Pressed");
}

- (IBAction)transition4BtnAction:(UIButton *)sender {
    NSLog(@"Button #4 Pressed");
}
</pre>

<pre>
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

</pre>


