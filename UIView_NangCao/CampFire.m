//
//  CampFire.m
//  UIView_NangCao
//
//  Created by Nguyễn Duy Kiều on 10/11/15.
//  Copyright © 2015 Nguyen Duy Kieu. All rights reserved.
//

#import "CampFire.h"

@interface CampFire ()
{
    UIImageView * fire;
}
@end

@implementation CampFire
-(void) loadView{
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blackColor]];
    self.edgesForExtendedLayout = UIRectEdgeNone ;
    [self burnFire];
}
-(void) burnFire {
    fire = [[UIImageView alloc] initWithFrame:self.view.bounds];
    NSMutableArray *images = [[NSMutableArray alloc] initWithCapacity:17];
    for (int i = 1; i < 18; i++)
    {
        NSString *firename ;
        if (i < 10) {
            firename = [NSString stringWithFormat:@"campFire0%d.gif",i];
        }
        else{
            firename = [NSString stringWithFormat:@"campFire%d.gif",i];
        }
        [images addObject:[UIImage imageNamed:firename]];
    }
    fire.animationImages =images;
    fire.animationDuration =1;
    fire.animationRepeatCount =0;
    [self.view addSubview:fire];
    [fire startAnimating];
}



@end
