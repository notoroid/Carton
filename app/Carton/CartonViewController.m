//
//  CartonViewController.m
//  Carton
//
//  Created by Kaname Noto on 11/05/23.
//  Copyright 2011 Irimasu Densan Planning. All rights reserved.
//

#import "CartonViewController.h"

@implementation CartonViewController

@synthesize packageView=_packageView;
@synthesize packageSegment=_packageSegment;
@synthesize opacitySegment=_opacitySegment;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGSize layersize = self.packageView.frame.size;
        // self.packageView のframe プロパティを使ってCALayer の位置を計算する
    
    _layerPackage = [[CALayer alloc] init];
        // CALayer の初期化
    _layerPackage.bounds = CGRectMake(0,0, layersize.width , layersize.height );
        // サイズをbounds プロパティに格納
    _layerPackage.position = CGPointMake(layersize.width * .5f , layersize.height * .5f );
        //　位置は_packageView.layer 内の中央に配置
    [_packageView.layer addSublayer:_layerPackage];
        // _packageView.layer のサブレイヤーとして追加
    
    [_layerPackage release];
    
    [self updateCarton];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) updateCarton
{
    CGFloat scale = [[UIScreen mainScreen] respondsToSelector:NSSelectorFromString(@"scale")] ? [UIScreen mainScreen].scale : 1.0f;
        // スケールを判別
    NSString* fileName = self.packageSegment.selectedSegmentIndex == 0 ? (scale > 1.0f ? @"Package@2x.png" : @"Package.png") : (scale > 1.0f ? @"Package2@2x.png" : @"Package2.png");
        // イメージをUISegment の選択index に従って読み込む
    NSString* filePath = [NSString stringWithFormat:@"%@/%@",[[NSBundle mainBundle] resourcePath], fileName ]; // 絶対パスを得る
    
    // ファイルからイメージを作成する
    NSData* imageData = [[NSData alloc] initWithContentsOfFile:filePath];
    UIImage* image = [[UIImage alloc] initWithData:imageData];
    
    _layerPackage.contents = (id)[image CGImage];
        // 属性contents にイメージを設定(暗黙のアニメーションが開始)
    
    [image release];
    [imageData release];
}

- (IBAction) firedPackage:(id)sender
{
    // 柄が変更されたのでアップデートメソッドupdateCarton: を呼ぶ
    [self updateCarton];
}

- (IBAction) firedOpacity:(id)sender
{
    NSInteger selectedIndex = self.opacitySegment.selectedSegmentIndex;
    // 不透明度を設定
    switch (selectedIndex) {
    case 0:
        _layerPackage.opacity = 1.0f; // 属性opacity に値を設定(暗黙のアニメーションが開始)
        break;
    case 1:
        _layerPackage.opacity = .5f; // 属性opacity に値を設定(暗黙のアニメーションが開始)
        break;
    case 2:
        _layerPackage.opacity = .0f; // 属性opacity に値を設定(暗黙のアニメーションが開始)
        break;
    default:
        break;
    }
}

- (void)viewDidUnload
{
    // レイヤーを解放
    [_layerPackage release];
    _layerPackage = nil;
    
    // UI用インスタンスを解放
    self.packageView = nil;
    self.packageSegment = nil;
    self.opacitySegment = nil;
    
    [super viewDidUnload];
}

- (void)dealloc
{
    // レイヤーを解放
    [_layerPackage release];
    
    // UI用インスタンを解放
    [_packageSegment release];
    [_packageView release];
    [_opacitySegment release];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
