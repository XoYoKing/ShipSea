//
//  SwingShip.m
//  UIView_NangCao
//
//  Created by Nguyễn Duy Kiều on 10/15/15.
//  Copyright © 2015 Nguyen Duy Kieu. All rights reserved.
//

#import "SwingShip.h"
#import <AVFoundation/AVFoundation.h>

@interface SwingShip ()

@end

@implementation SwingShip
{
    UIImageView *ship;
    UIImageView *sea,*sea1;
    
    AVAudioPlayer *audioPlayer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self drawShipAndSea];
    [self animateShip];
    [self animateSea];
    [self playSong];
}
-(void) drawShipAndSea{
    sea = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"image_01"]];
    sea.frame = self.view.bounds;
    //self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view addSubview:sea];
    
    sea1 = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"image_02"]];
    sea1.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    //self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view addSubview:sea1];
    
    ship =  [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"Sailboat1.png"]];
    ship.center = CGPointMake(200, 400);
    [self.view addSubview:ship];
}
-(void) animateShip{
    [UIView animateWithDuration:1 animations:^{
        ship.transform = CGAffineTransformMakeRotation(-0.08);
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:1
                         animations:^{
                               ship.transform = CGAffineTransformMakeRotation(0.08);
                         }completion:^(BOOL finished) {
                             [self animateShip];
                         }];
    } ];
}
-(void) animateSea{
    [UIView animateWithDuration:10 animations:^{
        sea1.frame = CGRectMake(-self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        sea1.frame =self.view.bounds;
    } completion:^(BOOL finished) {
        sea.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        [UIView animateWithDuration:10 animations:^{
            sea.frame= self.view.bounds;
            sea1.frame = CGRectMake(-self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        } completion:^(BOOL finished) {
            sea1.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
            [self animateSea];
        }];
    }];
}
- (void) playSong {
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"nhac" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url
                                                         error:&error];
    [audioPlayer prepareToPlay];
    [audioPlayer play];
}
- (void) viewWillDisappear:(BOOL)animated {
    [audioPlayer stop];
}@end
