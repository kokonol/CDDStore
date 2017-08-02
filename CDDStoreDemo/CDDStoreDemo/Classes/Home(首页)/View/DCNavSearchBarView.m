//
//  DCNavSearchBarView.m
//  CDDMall
//
//  Created by apple on 2017/6/3.
//  Copyright © 2017年 RocketsChen. All rights reserved.
//

#import "DCNavSearchBarView.h"
#import "AppDelegate.h"
#import "ECPHotSearchWords.h"

// Controllers

// Models

// Views

// Vendors

// Categories

// Others

@interface DCNavSearchBarView ()

@end

@implementation DCNavSearchBarView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self setUpUI];
        
//        UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(searchClick)];
//        [self addGestureRecognizer:tapGesture];
    }
    
    [self setDefaultSearchKeyWord];
    return self;
}


- (void)setUpUI
{
    self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.1];
    
    _searchTextField = [[UITextField alloc]initWithFrame:CGRectZero];
    _searchTextField.font = PFR14Font;
    _searchTextField.textColor = [UIColor whiteColor];
    

    _voiceImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_voiceImageBtn setImage:[UIImage imageNamed:@"voice"] forState:UIControlStateNormal];
    [_voiceImageBtn addTarget:self action:@selector(voiceButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    _searchTextField = [[UITextField alloc]initWithFrame:CGRectZero];
    _searchTextField.font = PFR14Font;
    _searchTextField.textColor = [UIColor whiteColor];
//    _searchTextField.keyboardAppearance = UIKeyboardAppearanceAlert;
    _searchTextField.returnKeyType = UIReturnKeySearch;
    _searchTextField.delegate = self;
    
    [self addSubview:_searchTextField];
    [self addSubview:_voiceImageBtn];
    
}
    
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"点击了搜索");
    [_searchTextField resignFirstResponder];
    [self searchClick];
    return YES;
}
    
- (void)layoutSubviews
{
    [super layoutSubviews];
    _searchTextField.frame = CGRectMake(DCMargin, 0, self.dc_width, self.dc_height);
    [_searchTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.equalTo(self)setOffset:DCMargin];
        [make.right.equalTo(self)setOffset:DCMargin-40];
        make.top.equalTo(self);
        make.height.equalTo(self);
        
    }];
    
    [_voiceImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.right.equalTo(self)setOffset:-DCMargin];
        make.top.equalTo(self);
        make.height.equalTo(self);
    }];
    
    //设置边角
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(2, 2)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

#pragma mark - Intial
- (void)awakeFromNib {
    [super awakeFromNib];

}

#pragma mark - Setter Getter Methods

- (void)searchClick
{
    !_searchViewBlock ?: _searchViewBlock();
}
    
#pragma mark - 语音点击回调
- (void)voiceButtonClick {
    !_voiceButtonClickBlock ? : _voiceButtonClickBlock();
}

- (void) setDefaultSearchKeyWord {
    NSArray *hotWordsDataArray = ECPHotSearchWordsData;
    if(hotWordsDataArray != nil){
        int randomIndex = arc4random() % hotWordsDataArray.count;
        ECPHotSearchWords *hot = [hotWordsDataArray objectAtIndex:randomIndex];
        _searchTextField.text = hot.hotWords;
    }
}
@end
