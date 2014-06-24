HCViewEasyMake
==============

Create, Add, Remove UIViews with less boilerplate code.

## Features
### Macros

```objective-c
#define HCViewOnceGetter(class, property, ivar, internalVar, block)
#define HCViewRelease(VIEW)
```

### Category methods
```objective-c
- (void)addSubviews:(NSArray *)subviews;
- (void)setSize:(CGSize)size;
- (void)setOrigin:(CGPoint)origin;
- (CGFloat)xPlusWidh;
- (CGFloat)yPlusHeight;
```

## Getter

### This is what we do now.

```objective-c
- (UILabel *)label
{
    if (!_label) {
        _label = ({
            UILabel *lbl = [[UILabel alloc] init];
            // you can add something for this label finally.. from here
              lbl.font = [UIFont systemFontOfSize:12];
              lbl.text = @"too much boiler plate code";
              [lbl sizeToFit];
            // to here
            lbl;
        });
    }

    return _label;
}

```

### You can simply do like this

```objective-c
HCViewOnceGetter(UILabel, label, _label, lbl, ^{
    lbl.font = [UIFont systemFontOfSize:12];
    lbl.text = @"clean and easy view creation";
    [lbl sizeToFit];
})
```

## release 

### Two lines; And we forget to call removeFromSuperView a lot;

```objective-c
[self.label removeFromSuperview];
self.label = nil;
```

### One line. And don't forget.

```objective-c
HCViewRelease(self.label)
```

## Full usage

```objective-c
@implementation HCExampleCell

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
    lbl.text = @"clean and easy view creation";
    [lbl sizeToFit];
})

HCViewOnceGetter(UIImageView, imgView, _imgView, imgV, ^{
    imgV.image = [UIImage imageNamed:@"someImage"];
    imgV.backgroundColor = [UIColor blackColor];
    [imgV setSize:CGSizeMake(50, 50)];
})

HCViewOnceGetter(UIButton, button, _button, btn, ^{
    [btn setTitle:@"Release Label and ImageView" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
})

- (void)touchButton:(id)sender
{
    HCViewRelease(self.label)
    HCViewRelease(self.imgView)
}

@end

```

### Looks simple and straight right?

### It was actually previously like this...

```objective-c
@implementation HCExampleCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.label];
        [self addSubview:self.imgView];
        [self addSubview:self.button];

        CGRect newFrame = self.label.frame;
        newFrame.origin = CGPointMake(10,10);
        self.label.frame = newFrame;

        newFrame = self.imgView.frame;
        newFrame.origin = CGPointMake(10, self.label.frame.origin.y + self.label.frame.size.height + 10);
        self.imgView.frame = newFrame;

        newFrame = self.button.frame;
        newFrame.origin = CGPointMake(self.imgView.frame.origin.x + self.imgView.frame.size.width+ 10, self.label.frame.origin.y + self.label.frame.size.height + 10);
        self.button.frame = newFrame;
    }
    return self;
}

- (UILabel *)label
{
    if (!_label) {
        _label = ({
            UILabel *lbl = [[UILabel alloc] init];
            lbl.font = [UIFont systemFontOfSize:12];
            lbl.text = @"clean and easy view creation";
            [lbl sizeToFit];
            lbl;
        });
    }

    return _label;
}

- (UIImageView *)imgView
{
    if (!_imgView) {
        _imgView = ({
            UIImageView *imgV = [[UIImageView alloc] init];
            imgV.image = [UIImage imageNamed:@"someImage"];
            imgV.backgroundColor = [UIColor blackColor];

            CGRect newFrame = imgV.frame;
            newFrame.size = CGSizeMake(50, 50);
            imgV.frame = newFrame;
            imgV;
        });
    }
    return _imgView;
}

- (UIButton *)button
{
    if (!_button) {
        _button = ({
            UIButton *btn = [[UIButton alloc] init];
            [btn setTitle:@"Release Label and ImageView" forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
            [btn sizeToFit];
            btn;
        });
    }
    return _button;
}

- (void)touchButton:(id)sender
{
    [self.label removeFromSuperview];
    self.label = nil;

    [self.imgView removeFromSuperview];
    self.imgView = nil;
}

@end

```

### So what do you prefer now?

## Contribution

Actually this is my first open-source contribution and I love to get yours too.

send me pull requests or give me an idea to make this better!
