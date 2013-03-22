//
//  ViewController.m
//  Sample-EasyGaussianBlur
//
//  Created by STatsu on 13/03/22.
//  Copyright (c) 2013年 objc-Lovers. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _scaleLabel.text = [NSString stringWithFormat:@"%.2f", _scaleSlider.value];
    _biasLabel.text  = [NSString stringWithFormat:@"%.2f", _biasSlider.value];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)toggleBlur:(UISwitch *)sender {
    if (sender.on) {
        _imageView.layer.minificationFilter = kCAFilterTrilinear;
        _imageView.layer.shouldRasterize = YES;
        _imageView.layer.rasterizationScale = _scaleSlider.value;
    }else{
        _imageView.layer.shouldRasterize = NO;
    }
}

- (IBAction)changeScale:(UISlider *)sender {
    _imageView.layer.rasterizationScale = sender.value;
    _scaleLabel.text = [NSString stringWithFormat:@"%.2f", sender.value];
}

- (IBAction)changeBias:(UISlider *)sender {
    _imageView.layer.minificationFilterBias = sender.value;
    _biasLabel.text = [NSString stringWithFormat:@"%.2f", sender.value];
}

- (IBAction)changeMagFilter:(UISegmentedControl *)sender {
    _imageView.layer.magnificationFilter = sender.selectedSegmentIndex == 1 ? kCAFilterNearest : kCAFilterLinear;
}

- (void)viewDidUnload {
    _imageView = nil;
    _scaleLabel = nil;
    _biasLabel = nil;
    _scaleSlider = nil;
    _biasSlider = nil;
    [super viewDidUnload];
}

@end
