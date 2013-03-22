//
//  ViewController.h
//  Sample-EasyGaussianBlur
//
//  Created by STatsu on 13/03/22.
//  Copyright (c) 2013年 objc-Lovers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    __weak IBOutlet UIImageView *_imageView;
    __weak IBOutlet UILabel *_scaleLabel;
    __weak IBOutlet UILabel *_biasLabel;
    __weak IBOutlet UISlider *_scaleSlider;
    __weak IBOutlet UISlider *_biasSlider;
}

- (IBAction)toggleBlur:(UISwitch *)sender;
- (IBAction)changeScale:(UISlider *)sender;
- (IBAction)changeBias:(UISlider *)sender;
- (IBAction)changeMagFilter:(UISegmentedControl *)sender;

@end
