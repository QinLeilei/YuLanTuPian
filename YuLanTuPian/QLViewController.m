//
//  QLViewController.m
//  YuLanTuPian
//
//  Created by qianfeng on 14-12-31.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "QLViewController.h"

@interface QLViewController ()

@property (nonatomic,readwrite,retain) NSMutableArray *imageArray;
@property (nonatomic,readwrite,copy) NSArray *arr;
@property (retain, nonatomic) IBOutlet UISwitch *YeJian;
@property (retain, nonatomic) IBOutlet UIImageView *ImageView;
@property (retain, nonatomic) IBOutlet UILabel *Lable2;
@property (retain, nonatomic) IBOutlet UILabel *Lable3;
@property (retain, nonatomic) IBOutlet UISlider *slider;
@property (retain, nonatomic) IBOutlet UIStepper *stepper;
@property (retain, nonatomic) IBOutlet UILabel *Lable;


- (IBAction)Switch:(UISwitch *)sender;
- (IBAction)Stepper:(UIStepper *)sender;
- (IBAction)Slider:(UISlider *)sender;


@end

@implementation QLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *plistPath= [[NSBundle mainBundle]pathForResource:@"images" ofType:@"plist"];
    _arr = [[NSArray alloc]initWithContentsOfFile:plistPath];
    
    _Lable.text = @"白天模式";
    
//stepper事件
    _stepper.maximumValue = _arr.count;
    _stepper.minimumValue = 1;
    _stepper.stepValue = 1;
    [_stepper addTarget:self action:@selector(Stepper:) forControlEvents:UIControlEventValueChanged];
    
//slider事件
    _slider.maximumValue = _arr.count;
    _slider.minimumValue = 1;
    [_slider addTarget:self action:@selector(Slider:) forControlEvents:UIControlEventValueChanged];
    
    
//添加图片
	_ImageView.image = [UIImage imageNamed:[_arr[0] objectForKey:@"icon"]];
    _Lable3.text = [NSString stringWithFormat:@"1/16"];
    _Lable2.text = [_arr[0] objectForKey:@"title"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)Switch:(UISwitch *)sender {
   
    if (!sender.on) {
        self.view.backgroundColor = [UIColor grayColor];
        _Lable.text = @"夜间模式";
        
    }else{
        self.view.backgroundColor = [UIColor whiteColor];
        _Lable.text = @"白天模式";
    }
}
- (IBAction)Stepper:(UIStepper *)sender {
    NSInteger count = (int)sender.value;
    _Lable3.text = [NSString stringWithFormat:@"%ld/%.f",(long)count,sender.maximumValue];
    _ImageView.image = [UIImage imageNamed:[_arr[count-1]objectForKey:@"icon"]];
    _Lable2.text = [_arr[count-1]objectForKey:@"title"];
    
    _slider.value = count;
}
- (IBAction)Slider:(UISlider *)sender {
    NSInteger count = (int)sender.value;
    _Lable3.text = [NSString stringWithFormat:@"%ld/%.f",(long)count,sender.maximumValue];
    _ImageView.image = [UIImage imageNamed:[_arr[count-1]objectForKey:@"icon"]];
    _Lable2.text = [_arr[count-1]objectForKey:@"title"];
    
    _slider.value = count;
}
- (void)dealloc {
    [_YeJian release];
    [_ImageView release];
    [_Lable2 release];
    [_Lable3 release];
    [_slider release];
    [_stepper release];
    [_Lable release];
    [super dealloc];
}
@end












