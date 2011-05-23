//
//  CartonViewController.h
//  Carton
//
//  Created by Kaname Noto on 11/05/23.
//  Copyright 2011 Irimasu Densan Planning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface CartonViewController : UIViewController
{
    CALayer* _layerPackage;
}

@property(nonatomic,retain) IBOutlet UIView* packageView;
@property(nonatomic,retain) IBOutlet UISegmentedControl* packageSegment;
@property(nonatomic,retain) IBOutlet UISegmentedControl* opacitySegment;

- (void) updateCarton; // 紙箱を更新する

- (IBAction) firedPackage:(id)sender;
- (IBAction) firedOpacity:(id)sender;

@end
