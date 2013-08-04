//
//  ViewController.m
//  Aroma
//
//  Created by Chris Wagner on 8/3/13.
//  Copyright (c) 2013 Razeware. All rights reserved.
//

#import "MainViewController.h"
#import "RestaurantDetailService.h"
#import "Restaurant.h"
#import "RestaurantDetailViewController.h"

@interface MainViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation MainViewController {
    NSArray *_restaurants;
    NSMutableArray *_resaurantViewControllers;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _restaurants = [[RestaurantDetailService sharedService] restaurants];
    [self setupScrollView];    
}

- (void)setupScrollView {
    _resaurantViewControllers = [NSMutableArray array];
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width * _restaurants.count, self.view.frame.size.height);
    [_restaurants enumerateObjectsUsingBlock:^(Restaurant *restaurant, NSUInteger idx, BOOL *stop) {
        RestaurantDetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RestaurantDetailViewController"];
        detailViewController.restaurant = restaurant;
        detailViewController.view.frame = CGRectMake(self.view.frame.size.width * idx,
                                                     0,
                                                     detailViewController.view.frame.size.width,
                                                     detailViewController.view.frame.size.height);
        [_scrollView addSubview:detailViewController.view];
        [_resaurantViewControllers addObject:detailViewController];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Scroll view delegate methods

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger currentResaurantIndex = floor(scrollView.contentOffset.x / self.view.frame.size.width);
    Restaurant *currentRestaurant = [_restaurants objectAtIndex:currentResaurantIndex];
    self.navigationItem.title = currentRestaurant.name;
}


@end
