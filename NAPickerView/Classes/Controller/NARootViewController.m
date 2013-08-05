//
//  NARootViewController.m
//  NAPickerView
//
//  Created by iNghia on 8/4/13.
//  Copyright (c) 2013 nghialv. All rights reserved.
//

#import "NARootViewController.h"
#import "NAPickerView.h"
#import "NACustomCell.h"

@interface NARootViewController () <NAPickerViewDelegate> {
    NSMutableArray *items;
    NSArray *items2;
    NSMutableArray *items3;
}

@end

@implementation NARootViewController

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
	// Do any additional setup after loading the view.
    items = [[NSMutableArray alloc] init];
    for (int i = 0; i < 30;  i++) {
        [items addObject:[NSString stringWithFormat:@"%d", i]];
    }
    // picker 1
    NAPickerView *pickerView = [[NAPickerView alloc] initWithFrame:CGRectMake(40.f, 10.f, 100.f, 200.f)
                                                          andItems:items
                                                       andDelegate:self];
    [pickerView setIndex:5];
    pickerView.backgroundColor = [UIColor blackColor];
    pickerView.cornerRadius = 8.f;
    pickerView.borderColor = [UIColor orangeColor];
    pickerView.borderWidth = 3.f;
    pickerView.showOverlay = NO;
    [self.view addSubview:pickerView];
    
    // picker 2
    items2 = @[@"Naruto", @"Kakashi", @"Sakura", @"Sasuke", @"Choji"];
    NAPickerView *pickerView2 = [[NAPickerView alloc] initWithFrame:CGRectMake(180.f, 10.f, 100.f, 200.f)
                                                          andItems:items2
                                                       andDelegate:self];
    [pickerView2 setIndex:3];
    pickerView2.backgroundColor = [UIColor blackColor];
    pickerView2.cornerRadius = 8.f;
    pickerView2.borderColor = [UIColor colorWithRed:0.f green:0.5f blue:0.5f alpha:1.f];
    pickerView2.borderWidth = 3.f;
    pickerView2.configureBlock = ^(NALabelCell *cell, NSString *item) {
        cell.textView.textAlignment = UITextAlignmentCenter;
        cell.textView.font = [UIFont systemFontOfSize:20];
        cell.textView.backgroundColor = [UIColor clearColor];
        cell.textView.textColor = [UIColor grayColor];
        [cell.textView setText:item];
    };
    pickerView2.highlightBlock = ^(NALabelCell *cell) {
        cell.textView.textColor = [UIColor blueColor];
    };
    [self.view addSubview:pickerView2];
    
    // picker3 with custom cell
    items3 = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5; i++) {
        NSString *title = [NSString stringWithFormat:@"Item %d", i];
        NSArray *obj = @[title, @"image.png"];
        [items3 addObject:obj];
    }
    NAPickerView *pickerView3 = [[NAPickerView alloc] initWithFrame:CGRectMake(40.f, 230.f, 250.f, 200.f)
                                                           andItems:items3
                                                   andCellClassName:@"NACustomCell"
                                                        andDelegate:self];
    [pickerView3 setIndex:3];
    pickerView3.backgroundColor = [UIColor blackColor];
    pickerView3.cornerRadius = 8.f;
    pickerView3.borderColor = [UIColor colorWithRed:0.f green:0.5f blue:0.5f alpha:1.f];
    pickerView3.borderWidth = 3.f;
    pickerView3.configureBlock = ^(NACustomCell *cell, NSArray *item) {
        NSString *title = (NSString *)[item objectAtIndex:0];
        NSString *imageName = (NSString *)[item objectAtIndex:1];
        [cell.avatar setImage:[UIImage imageNamed:imageName]];
        [cell.label setText:title];
    };
    pickerView3.highlightBlock = ^(NACustomCell *cell) {
        cell.label.textColor = [UIColor blueColor];
        cell.avatar.alpha = 1.0;
    };
    pickerView3.unhighlightBlock = ^(NACustomCell *cell) {
        cell.label.textColor = [UIColor grayColor];
        cell.avatar.alpha = 0.5f;
    };
    [self.view addSubview:pickerView3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didSelectedAtIndexDel:(NSInteger)index
{
    NSLog(@"selected: %@", (NSString *)[items objectAtIndex:index]);
}

@end
