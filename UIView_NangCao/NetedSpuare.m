//
//  NetedSpuare.m
//  UIView_NangCao
//
//  Created by Nguyễn Duy Kiều on 10/11/15.
//  Copyright © 2015 Nguyen Duy Kieu. All rights reserved.
//

#import "NetedSpuare.h"

@interface NetedSpuare ()

@end

@implementation NetedSpuare

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blackColor]];
    [self drawNetedSpuare];
    [self performSelector:@selector(rotateAllSpuare) withObject:nil afterDelay:2];
    
}
-(void) drawNetedSpuare{
    CGSize mainViewSize = self.view.bounds.size;
    CGFloat margin = 20;
    CGFloat recWidth = mainViewSize.width - margin * 2.0;
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    CGPoint center = CGPointMake(mainViewSize.width * 0.5,(mainViewSize.height + statusNavigationBarHeight) *0.5);
    for (int i = 0; i < 10; i ++) {
        UIView * spuare;
        if ( i % 2 == 0) {
            spuare = [self drawSpuareByWidth:recWidth andRotate:false atCenter:center];
        }else{
            spuare = [self drawSpuareByWidth:recWidth andRotate:true atCenter:center];
        }
        [self.view addSubview:spuare];
        recWidth = recWidth * 0.707; //0.707 =1 \can hai
    
    }
}
-(UIView*) drawSpuareByWidth: (CGFloat) width
                   andRotate: (BOOL) rotate
                    atCenter: (CGPoint) center{
    UIView *spuare  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, width)];
    spuare.center = center;
    spuare.backgroundColor = rotate ? [UIColor whiteColor] : [UIColor darkGrayColor];
    spuare.transform = rotate  ? CGAffineTransformMakeRotation(M_PI_4) : CGAffineTransformIdentity;
    return spuare;
}
-(void) rotateAllSpuare {
    [UIView animateWithDuration:2.0 animations:^{
        for (int i = 0; i < self.view.subviews.count; i ++ ) {
            if ( i % 2 == 0) {
                self.view.subviews[i].transform = CGAffineTransformMakeRotation(M_PI_4);
            }else{
                self.view.subviews[i].transform = CGAffineTransformIdentity;
            }
        }
    }];
}

@end
