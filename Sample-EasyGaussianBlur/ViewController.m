//
//  ViewController.m
//  Sample-EasyGaussianBlur
//
//  Created by STatsu on 13/03/22.
//  Copyright (c) 2013年 objc-Lovers. All rights reserved.
//

#import "ViewController.h"

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
    _imageView.layer.minificationFilter = kCAFilterTrilinear;
    
    _scaleLabel.text = [NSString stringWithFormat:@"%.2f", _scaleSlider.value];
    _biasLabel.text  = [NSString stringWithFormat:@"%.2f", _biasSlider.value];

    _animGaussianOn = [CABasicAnimation animationWithKeyPath:@"rasterizationScale"];
    _animGaussianOn.duration = 0.8;
    _animGaussianOn.fromValue = @1.0;
    _animGaussianOn.toValue = [NSNumber numberWithFloat:_scaleSlider.value];
    _animGaussianOn.fillMode = kCAFillModeForwards;
    _animGaussianOn.removedOnCompletion = NO;
    _animGaussianOn.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];

    _animGaussianOff = [CABasicAnimation animationWithKeyPath:@"rasterizationScale"];
    _animGaussianOff.duration = 0.8;
    _animGaussianOff.fromValue = @0.1;
    _animGaussianOff.toValue = @1.0;
    _animGaussianOff.fillMode = kCAFillModeForwards;
    _animGaussianOff.removedOnCompletion = NO;
    _animGaussianOff.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)toggleBlur:(UISwitch *)sender {
    _imageView.layer.shouldRasterize = YES;
    [_imageView.layer removeAllAnimations];
    if (sender.on) {
        _animGaussianOn.toValue = [NSNumber numberWithFloat:_scaleSlider.value];
        [_imageView.layer addAnimation:_animGaussianOn forKey:@"gaussianOn"];
    }else{
        _animGaussianOff.fromValue = [NSNumber numberWithFloat:_scaleSlider.value];
        [_imageView.layer addAnimation:_animGaussianOff forKey:@"gaussianOff"];
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

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if(anim == _animGaussianOff){
        _imageView.layer.shouldRasterize = NO;
        _imageView.layer.rasterizationScale = 1.0;
    }else{
        _imageView.layer.shouldRasterize = YES;
        _imageView.layer.rasterizationScale = _scaleSlider.value;
    }
}

@end
