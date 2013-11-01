NoNibAllCode
============

An iOS program that does UI with only code.  No storyboards or nibs.


1. Create a new project of type 'Empty Application'

2. Change AppDelegate to create a Navigation Controller and add a top level view controller

<code>
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

</code>
