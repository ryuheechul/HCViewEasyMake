//
//  HCViewController.m
//  HCViewEasyMake
//
//  Created by Ryu Heechul on 07/19/2014.
//  Copyright (c) 2014 Ryu Heechul. All rights reserved.
//

#import "HCViewController.h"

#import <HCViewEasyMake/UIView+HCViewEasyMake.h>

#define UICOUPONCELL_HEIGHT 100
#define UICOUPONCELL_MARGIN 10

@interface UICouponCell : UITableViewCell

@end

@interface UICouponCell ()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UIButton *button;

@end

@implementation UICouponCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubviews:@[self.label, self.imgView, self.button]];

        [self.label setOrigin:CGPointMake(10,10)];
        [self.imgView setOrigin:CGPointMake(10, self.label.yPlusHeight + 10)];
        [self.button setOrigin:CGPointMake(self.imgView.xPlusWidh + 10, self.label.yPlusHeight + 10)];

    }
    return self;
}

HCViewOnceGetter(UILabel, label, _label, lbl, ^{
    lbl.font = [UIFont systemFontOfSize:12];
    lbl.numberOfLines = 0;
    lbl.text = @"title";

     [lbl sizeToFit];

    lbl.backgroundColor = [UIColor lightGrayColor];
})

HCViewOnceGetter(UIImageView, imgView, _imgView, imgV, ^{
    imgV.image = [UIImage imageNamed:@"someImage"];
    [imgV setSize:CGSizeMake(50, 50)];
    imgV.backgroundColor = [UIColor yellowColor];
})

HCViewOnceGetter(UIButton, button, _button, btn, ^{
    [btn setTitle:@"delete button" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    btn.backgroundColor = [UIColor blueColor];
})

- (void)touchButton:(id)sender
{
    HCViewRelease(self.label)
    HCViewRelease(self.imgView)
}

@end

@interface HCViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@end

@implementation HCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UICOUPONCELL_HEIGHT;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = @"HCCouponCell";

    UICouponCell *cell = [[UICouponCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];

    return cell;
}
@end

