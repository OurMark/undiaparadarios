//
//  MenuViewController.m
//  UnDiaParaDar
//
//  Created by Facundo Menzella on 7/21/15.
//  Copyright (c) 2015 ITBA. All rights reserved.
//

#import "MenuViewController.h"
#import "Routing.h"
#import "RETableViewManager.h"
#import "MenuProfilePresenter.h"

@interface MenuViewController ()

@property (nonatomic, strong) id<Routing> routing;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RETableViewManager *tableViewManager;

@end

@implementation MenuViewController

#pragma mark - MenuViewController

- (instancetype)initWithRouting:(id<Routing>)routing
{
    self = [super init];
    if (self) {
        self.routing = routing;
    }
    return self;
}

- (void)loadView
{
    self.tableView = [[UITableView alloc] init];
    // we do not like this, but we do not have a better method yet
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [self initTableViewManager];
    [self registerAndBuildProfileSection];
}

#pragma mark - RETableViewManager

- (void)initTableViewManager
{
    self.tableViewManager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    // we do not like this, but we do not have a better method yet
    self.tableViewManager.style.defaultCellSelectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)registerAndBuildProfileSection
{
    RETableViewSection *profileSection = [RETableViewSection section];
    [self.tableViewManager addSection:profileSection];
    self.tableViewManager[@"MenuProfilePresenter"] = @"MenuProfileViewCell";
    
    MenuProfilePresenter *profilePresenter = [[MenuProfilePresenter alloc] init];
    [profileSection addItem:profilePresenter];
}

- (void)registerAndBuildMenuOptions
{
    // not done yet
}

@end
