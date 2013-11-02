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


