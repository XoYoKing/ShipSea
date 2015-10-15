//
//  BootLogic.m
//  TechmasterApp
//
//  Created by techmaster on 9/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "BootLogic.h"
#import "MainScreen.h"


@implementation BootLogic
+ (void) boot: (UIWindow*) window
{
    MainScreen* mainScreen = [[MainScreen alloc] initWithStyle:UITableViewStyleGrouped];
    //--------- From this line, please customize your menu data -----------
   /*NSDictionary* basic = @{SECTION: @"CampFire", MENU: @[
                                    @{TITLE: @"Basic A", CLASS: @"BasicA"},
                                    @{TITLE: @"Basic B", CLASS: @"BasicB"}
                          ]};*/
    NSDictionary* fire = @{SECTION: @"Exam 1", MENU: @[
                                    @{TITLE: @"Camp Fire", CLASS: @"CampFire"}
                                  ]};
    NSDictionary* netedSpuare = @{SECTION: @"Exam 2", MENU: @[
                                    @{TITLE: @"NetedSpuare", CLASS: @"NetedSpuare"}
                             ]};
    NSDictionary* fly = @{SECTION: @"Exam 3", MENU: @[
                                       @{TITLE: @"Flying Bird ", CLASS: @"FlyingBird"}
                                       ]};
    NSDictionary* shipAndSea = @{SECTION: @"Exam 4", MENU: @[
                                  @{TITLE: @"Ship and Sea ", CLASS: @"SwingShip"}
                                  ]};
    
    mainScreen.menu = @[fire,netedSpuare,fly,shipAndSea];
    
    mainScreen.title = @"UIView Advanced";
    mainScreen.about = @"This is demo app ...";
    //--------- End of customization -----------
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController: mainScreen];
    
    window.rootViewController = nav;
}
@end
