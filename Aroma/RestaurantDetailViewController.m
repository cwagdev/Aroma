//
//  RestaurantDetailViewController.m
//  Aroma
//
//  Created by Chris Wagner on 8/3/13.
//  Copyright (c) 2013 Razeware. All rights reserved.
//

#import "RestaurantDetailViewController.h"
#import "Restaurant.h"

@interface RestaurantDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *motdLabel;
@property (weak, nonatomic) IBOutlet UITextView *motdTextView;
@property (weak, nonatomic) IBOutlet UIButton *reserveATableButton;

@end

@implementation RestaurantDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [_imageView setImage:_restaurant.image];
    _motdLabel.text = _restaurant.motdHeader;
    _motdTextView.text = _restaurant.motdBody;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)reserveATable:(id)sender {

}

@end
