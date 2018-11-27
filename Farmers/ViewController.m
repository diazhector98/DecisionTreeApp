//
//  ViewController.m
//  Farmers
//
//  Created by Hector Díaz Aceves on 10/11/18.
//  Copyright © 2018 UC Davis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIView *leftView;
@property (strong, nonatomic) UIView *rightView;
@property (strong, nonatomic) UIView *leftImageView;
@property (strong, nonatomic) UILabel *leftLabel;
@property (strong, nonatomic) UIView *rightImageView;
@property (strong, nonatomic) UILabel *rightLabel;
@property (strong, nonatomic) UILabel *infoLabel;
@property (strong, nonatomic) UIButton *selectButton;
@property (strong, nonatomic) UIButton *backButton;
@property (strong, nonatomic) UIView *pesticidesBackgroundView;

@property (nonatomic) BOOL leftSelected;
@property (nonatomic) BOOL rightSelected;
@property (nonatomic) CGRect leftViewOriginalFrame;
@property (nonatomic) CGRect rightViewOriginalFrame;
@property (nonatomic) CGRect leftImageOriginalFrame;
@property (nonatomic) CGRect leftLabelOriginalFrame;
@property (nonatomic) CGRect rightImageOriginalFrame;
@property (nonatomic) CGRect rightLabelOriginalFrame;
@property (nonatomic) CGRect centralImageFrame;
@property (nonatomic) CGRect backButtonOriginalFrame;

@end
@implementation ViewController

- (void) initializeUIElements {
    self.leftView = [[UIView alloc] init];
    self.rightView = [[UIView alloc] init];
    self.leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"foothill"]];
    self.leftLabel = [[UILabel alloc] init];
    self.rightImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"valley"]];
    self.rightLabel = [[UILabel alloc] init];
    self.infoLabel = [[UILabel alloc] init];
    self.selectButton = [[UIButton alloc] init];
    self.backButton = [[UIButton alloc] init];
    self.pesticidesBackgroundView = [[UIView alloc] init];
}

- (void) setUIProperties {
    self.leftView.backgroundColor = [UIColor colorWithRed:0.99 green:0.87 blue:0.65 alpha:1.0];
    self.rightView.backgroundColor = [UIColor colorWithRed:0.96 green:0.72 blue:0.53 alpha:1.0];
    self.leftLabel.text = @"Foothills";
    self.leftLabel.font = [UIFont fontWithName:self.leftLabel.font.fontName size:30];
    self.leftLabel.textAlignment = NSTextAlignmentCenter;
    self.leftLabel.adjustsFontSizeToFitWidth = YES;
    self.rightLabel.text = @"Valley";
    self.rightLabel.font = [UIFont fontWithName:self.leftLabel.font.fontName size:30];
    self.rightLabel.textAlignment = NSTextAlignmentCenter;
    self.rightLabel.adjustsFontSizeToFitWidth = YES;
    self.infoLabel.text = @"Lorem ipsum dolor sit amet consectetur adipiscing, elit praesent tincidunt venenatis ante donec malesuada, dictumst posuere fermentum tempus pretium. Magna velit eros cursus sapien vulputate maecenas tristique lobortis nisi lectus euismod malesuada, morbi risus et viverra magnis mus facilisis nisl cubilia gravida platea. ";
    self.infoLabel.numberOfLines = 0;
    self.infoLabel.adjustsFontSizeToFitWidth = YES;
    self.infoLabel.alpha = 0;
    
    [self.selectButton setImage:[UIImage imageNamed:@"select"] forState:UIControlStateNormal];
    [self.selectButton addTarget:self action:@selector(selectButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.backButton setImage:[UIImage imageNamed:@"backOrange"] forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(backButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    self.pesticidesBackgroundView.backgroundColor = [UIColor colorWithRed:0.36 green:0.78 blue:0.69 alpha:1.0];
    [self.pesticidesBackgroundView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.leftView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.rightView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.leftImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.leftLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.rightImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.rightLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.infoLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.selectButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.backButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.pesticidesBackgroundView setTranslatesAutoresizingMaskIntoConstraints:NO];
}
- (void)setUIConstraints {
    [self.view addSubview:self.leftView];
    [self.view addSubview:self.rightView];
    [self.leftView addSubview:self.leftImageView];
    [self.leftView addSubview:self.leftLabel];
    [self.rightView addSubview:self.rightImageView];
    [self.rightView addSubview:self.rightLabel];
    [self.view addSubview:self.infoLabel];
    [self.view addSubview:self.selectButton];
    [self.view addSubview:self.backButton];
    [self.view addSubview:self.pesticidesBackgroundView];
    
    NSLayoutConstraint *leftLeftAnchor = [NSLayoutConstraint constraintWithItem:self.leftView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    NSLayoutConstraint *leftWidthAnchor = [NSLayoutConstraint constraintWithItem:self.leftView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0];
    NSLayoutConstraint *leftHeightAnchor = [NSLayoutConstraint constraintWithItem:self.leftView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    NSLayoutConstraint *leftTopAnchor = [NSLayoutConstraint constraintWithItem:self.leftView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    
    NSLayoutConstraint *rightRightAnchor = [NSLayoutConstraint constraintWithItem:self.rightView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    NSLayoutConstraint *rightWidthAnchor = [NSLayoutConstraint constraintWithItem:self.rightView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0];
    NSLayoutConstraint *rightHeightAnchor = [NSLayoutConstraint constraintWithItem:self.rightView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    NSLayoutConstraint *rightTopAnchor = [NSLayoutConstraint constraintWithItem:self.rightView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    
    NSLayoutConstraint *leftImageCenterXAnchor = [NSLayoutConstraint constraintWithItem:self.leftImageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.leftView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *leftImageCenterYAnchor = [NSLayoutConstraint constraintWithItem:self.leftImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.leftView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    NSLayoutConstraint *leftImageWidthAnchor = [NSLayoutConstraint constraintWithItem:self.leftImageView attribute:NSLayoutAttributeWidth relatedBy: NSLayoutRelationEqual toItem:self.leftView attribute:NSLayoutAttributeWidth multiplier:0.8 constant:0];
    NSLayoutConstraint *leftImageHeightAnchor = [NSLayoutConstraint constraintWithItem:self.leftImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.leftView attribute:NSLayoutAttributeWidth multiplier:0.8 constant:0];

    NSLayoutConstraint *leftLabelWidthAnchor = [NSLayoutConstraint constraintWithItem:self.leftLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.leftView attribute:NSLayoutAttributeWidth multiplier:0.8 constant:0];
    NSLayoutConstraint *leftLabelHeightAnchor = [NSLayoutConstraint constraintWithItem:self.leftLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.leftView attribute:NSLayoutAttributeWidth multiplier:0 constant:50];
    NSLayoutConstraint *leftLabelCenterXAnchor = [NSLayoutConstraint constraintWithItem:self.leftLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.leftView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *leftLabelTopAnchor = [NSLayoutConstraint constraintWithItem:self.leftLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.leftImageView attribute:NSLayoutAttributeBottom multiplier:1 constant:10];
    
    NSLayoutConstraint *rightImageCenterXAnchor = [NSLayoutConstraint constraintWithItem:self.rightImageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.rightView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *rightImageCenterYAnchor = [NSLayoutConstraint constraintWithItem:self.rightImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.rightView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    NSLayoutConstraint *rightImageWidthAnchor = [NSLayoutConstraint constraintWithItem:self.rightImageView attribute:NSLayoutAttributeWidth relatedBy: NSLayoutRelationEqual toItem:self.rightView attribute:NSLayoutAttributeWidth multiplier:0.8 constant:0];
    NSLayoutConstraint *rightImageHeightAnchor = [NSLayoutConstraint constraintWithItem:self.rightImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.rightView attribute:NSLayoutAttributeWidth multiplier:0.8 constant:0];
    
    NSLayoutConstraint *rightLabelWidthAnchor = [NSLayoutConstraint constraintWithItem:self.rightLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.rightView attribute:NSLayoutAttributeWidth multiplier:0.8 constant:0];
    NSLayoutConstraint *rightLabelHeightAnchor = [NSLayoutConstraint constraintWithItem:self.rightLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.rightView attribute:NSLayoutAttributeWidth multiplier:0 constant:50];
    NSLayoutConstraint *rightLabelCenterXAnchor = [NSLayoutConstraint constraintWithItem:self.rightLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.rightView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *rightLabelTopAnchor = [NSLayoutConstraint constraintWithItem:self.rightLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.rightImageView attribute:NSLayoutAttributeBottom multiplier:1 constant:10];
    
    NSLayoutConstraint *infoLabelTopAnchor = [NSLayoutConstraint constraintWithItem:self.infoLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:100 + self.view.frame.size.width / 2 * 0.8 + 50];
    NSLayoutConstraint *infoLabelCenterXAnchor = [NSLayoutConstraint constraintWithItem:self.infoLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *infoLabelHeightAnchor = [NSLayoutConstraint constraintWithItem:self.infoLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.30 constant:0];
    NSLayoutConstraint *infoLabelWidthAnchor = [NSLayoutConstraint constraintWithItem:self.infoLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.75 constant:0];
    
    NSLayoutConstraint *selectButtonTopAnchor = [NSLayoutConstraint constraintWithItem:self.selectButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:30];
    NSLayoutConstraint *selectButtonCenterXAnchor = [NSLayoutConstraint constraintWithItem:self.selectButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *selectButtonWidthAnchor = [NSLayoutConstraint constraintWithItem:self.selectButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0];
    NSLayoutConstraint *selectButtonHeightAnchor = [NSLayoutConstraint constraintWithItem:self.selectButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0 constant:50];
    
    NSLayoutConstraint *backButtonTopAnchor = [NSLayoutConstraint constraintWithItem:self.backButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:50];
    NSLayoutConstraint *backButtonLeftAnchor = [NSLayoutConstraint constraintWithItem:self.backButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    NSLayoutConstraint *backButtonWidthAnchor = [NSLayoutConstraint constraintWithItem:self.backButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0 constant:100];
    NSLayoutConstraint *backButtonHeightAnchor = [NSLayoutConstraint constraintWithItem:self.backButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0 constant:50];
    
    NSLayoutConstraint *pesticidesBackgroundWidthAnchor = [NSLayoutConstraint constraintWithItem:self.pesticidesBackgroundView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    NSLayoutConstraint *pesticidesBackgroundHeightAnchor = [NSLayoutConstraint constraintWithItem:self.pesticidesBackgroundView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.80 constant:0];
    NSLayoutConstraint *pesticidesBackgroundCenterXAnchor = [NSLayoutConstraint constraintWithItem:self.pesticidesBackgroundView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *pesticidesBackgroundTopAnchor = [NSLayoutConstraint constraintWithItem:self.pesticidesBackgroundView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    
    [self.view addConstraints:@[leftLeftAnchor, leftTopAnchor, leftWidthAnchor, leftHeightAnchor, rightRightAnchor, rightTopAnchor, rightWidthAnchor, rightHeightAnchor, infoLabelTopAnchor, infoLabelWidthAnchor, infoLabelHeightAnchor, infoLabelCenterXAnchor, selectButtonTopAnchor, selectButtonCenterXAnchor, selectButtonWidthAnchor, selectButtonHeightAnchor, backButtonLeftAnchor, backButtonTopAnchor, backButtonWidthAnchor, backButtonHeightAnchor, pesticidesBackgroundWidthAnchor, pesticidesBackgroundHeightAnchor, pesticidesBackgroundCenterXAnchor, pesticidesBackgroundTopAnchor]];
    [self.leftView addConstraints:@[leftImageWidthAnchor, leftImageHeightAnchor, leftImageCenterXAnchor, leftImageCenterYAnchor, leftLabelTopAnchor, leftLabelWidthAnchor, leftLabelHeightAnchor, leftLabelCenterXAnchor]];
    [self.rightView addConstraints:@[rightImageWidthAnchor, rightImageHeightAnchor,  rightImageCenterXAnchor, rightImageCenterYAnchor, rightLabelTopAnchor, rightLabelWidthAnchor, rightLabelHeightAnchor, rightLabelCenterXAnchor]];
}
- (void)addGestureRecognizers {
    UITapGestureRecognizer *leftRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectedLeft)];
    [self.leftView addGestureRecognizer:leftRecognizer];
    [self.leftView setUserInteractionEnabled:YES];
    UITapGestureRecognizer *rightRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectedRight)];
    [self.rightView addGestureRecognizer:rightRecognizer];
    [self.rightView setUserInteractionEnabled:YES];
}
- (void)selectedLeft {
    self.view.backgroundColor = [UIColor colorWithRed:0.99 green:0.87 blue:0.65 alpha:1.0];
    if (self.leftSelected){
        [self compressLeftView];
        self.leftSelected = false;
    } else {
        [self expandLeftView];
        self.leftSelected = true;
    }
}
- (void)expandLeftView {
    self.leftViewOriginalFrame = self.leftView.frame;
    self.rightViewOriginalFrame = self.rightView.frame;
    self.leftImageOriginalFrame = self.leftImageView.frame;
    self.leftLabelOriginalFrame = self.leftLabel.frame;
    self.rightImageOriginalFrame = self.rightImageView.frame;
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        CGRect newRightRect = self.rightView.frame;
        CGRect newLeftImageRect = self.leftImageView.frame;
        CGRect newLeftLabelRect = self.leftLabel.frame;
        CGRect newButtonRect = self.selectButton.frame;
        newRightRect.origin.x += self.view.frame.size.width / 2;
        newLeftImageRect.origin.y = self.view.frame.origin.y + 100;
        newLeftImageRect.origin.x = self.view.frame.size.width / 2 - newLeftImageRect.size.width / 2;
        newLeftLabelRect.origin.y = newLeftImageRect.origin.y + newLeftImageRect.size.height;
        newLeftLabelRect.origin.x = self.view.frame.size.width / 2 - newLeftLabelRect.size.width / 2;
        newButtonRect.origin.y -= 150;
        self.centralImageFrame = newLeftImageRect;
        self.selectButton.frame = newButtonRect;
        self.leftImageView.frame = newLeftImageRect;
        self.leftLabel.frame = newLeftLabelRect;
        self.rightView.frame = newRightRect;
        self.infoLabel.alpha = 1;
    } completion:nil];
}
- (void)compressLeftView {
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        CGRect newRightRect = self.rightView.frame;
        CGRect newLeftImageRect = self.leftImageView.frame;
        CGRect newLeftLabelRect = self.leftLabel.frame;
        CGRect newButtonRect = self.selectButton.frame;
        newLeftImageRect.origin.y = self.leftImageOriginalFrame.origin.y;
        newLeftImageRect.origin.x = self.leftImageOriginalFrame.origin.x;
        newRightRect.origin.x -= self.view.frame.size.width / 2;
        newLeftLabelRect.origin.x = self.leftLabelOriginalFrame.origin.x;
        newLeftLabelRect.origin.y = self.leftLabelOriginalFrame.origin.y;
        newButtonRect.origin.y += 150;
        self.selectButton.frame = newButtonRect;
        self.rightView.frame = newRightRect;
        self.leftImageView.frame = newLeftImageRect;
        self.leftLabel.frame = newLeftLabelRect;
        self.infoLabel.alpha = 0;
    } completion:nil];
}
- (void)selectedRight {
    self.view.backgroundColor = [UIColor colorWithRed:0.96 green:0.72 blue:0.53 alpha:1.0];
    if(self.rightSelected){
        [self compressRight];
        self.rightSelected = false;
    } else {
        [self expandRight];
        self.rightSelected = true;
    }
}
- (void)expandRight {
    self.rightImageOriginalFrame = self.rightImageView.frame;
    self.rightLabelOriginalFrame = self.rightLabel.frame;
    self.leftViewOriginalFrame = self.leftView.frame;
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        CGRect newLeftRect = self.leftView.frame;
        CGRect newRightImageRect = self.rightImageView.frame;
        CGRect newRightLabelRect = self.rightLabel.frame;
        CGRect newButtonRect = self.selectButton.frame;
        newRightImageRect.origin.y = self.view.frame.origin.y + 100;
        newRightImageRect.origin.x = 0 - newRightImageRect.size.width / 2;
        newRightLabelRect.origin.y = newRightImageRect.origin.y + newRightImageRect.size.height;
        newRightLabelRect.origin.x = 0 -  newRightLabelRect.size.width / 2;
        newLeftRect.origin.x -= self.view.frame.size.width / 2;
        newButtonRect.origin.y -= 150;
        self.selectButton.frame = newButtonRect;
        self.leftView.frame = newLeftRect;
        self.rightLabel.frame = newRightLabelRect;
        self.rightImageView.frame = newRightImageRect;
        self.infoLabel.alpha = 1;
    } completion:nil];
}
- (void)compressRight {
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        CGRect newLeftRect = self.leftView.frame;
        CGRect newRightImageRect = self.rightImageView.frame;
        CGRect newRightLabelRect = self.rightLabel.frame;
        CGRect newButtonRect = self.selectButton.frame;
        newRightImageRect.origin.y = self.rightImageOriginalFrame.origin.y;
        newRightImageRect.origin.x = self.rightImageOriginalFrame.origin.x;
        newLeftRect.origin.x += self.view.frame.size.width / 2;
        newRightLabelRect.origin.x = self.rightLabelOriginalFrame.origin.x;
        newRightLabelRect.origin.y = self.rightLabelOriginalFrame.origin.y;
        newButtonRect.origin.y += 150;
        self.selectButton.frame = newButtonRect;
        self.leftView.frame = newLeftRect;
        self.rightImageView.frame = newRightImageRect;
        self.rightLabel.frame = newRightLabelRect;
        self.infoLabel.alpha = 0;
    } completion:nil];
}
- (void)selectButtonPressed{
    self.backButtonOriginalFrame = self.backButton.frame;
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.3 options:UIViewAnimationOptionCurveEaseIn animations:^{
        if(self.leftSelected){
            CGRect newImageRect = CGRectMake(25, 40, 100, 100);
            CGRect newBackButtonRect = CGRectMake(200, 50, 150, 75);
            CGRect newPesticidesBackgroundRect = self.pesticidesBackgroundView.frame;
            newPesticidesBackgroundRect.origin.y = 200;
            self.leftImageView.frame = newImageRect;
            self.backButton.frame = newBackButtonRect;
            self.pesticidesBackgroundView.frame = newPesticidesBackgroundRect;
        } else {
            CGRect newImageRect = CGRectMake(25-self.view.frame.size.width / 2, 40, 100, 100);
            self.rightImageView.frame = newImageRect;
        }
    } completion:nil];
}
- (void)backButtonPressed {
    self.leftSelected = false;
    self.rightSelected = false;
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.3 options:UIViewAnimationOptionCurveEaseIn animations:^{
        CGRect newBackgroundRect = self.pesticidesBackgroundView.frame;
        newBackgroundRect.origin.y = self.view.frame.size.height;
        CGRect selectButtonRect = self.selectButton.frame;
        selectButtonRect.origin.y += 150;
        self.pesticidesBackgroundView.frame = newBackgroundRect;
        self.rightImageView.frame = self.rightImageOriginalFrame;
        self.leftImageView.frame = self.leftImageOriginalFrame;
        self.rightView.frame = self.rightViewOriginalFrame;
        self.leftLabel.frame = self.leftLabelOriginalFrame;
        self.selectButton.frame = selectButtonRect;
        self.backButton.frame = self.backButtonOriginalFrame;
        self.infoLabel.alpha = 0;
    } completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.leftSelected = false;
    self.rightSelected = false;
    [self initializeUIElements];
    [self setUIProperties];
    [self setUIConstraints];
    [self addGestureRecognizers];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
