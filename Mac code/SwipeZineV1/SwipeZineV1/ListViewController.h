//
//  ListViewController.h
//  SwipeZineV1
//
//  Created by SIPLMacMini4 on 28/02/13.
//  Copyright (c) 2013 Systematix. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ListViewController : NSViewController
@property(strong,nonatomic)NSMutableArray *listarry;
@property(strong,nonatomic)IBOutlet NSTextField *tittletext;
@property(strong,nonatomic)IBOutlet NSTextView *descriptiontextvew;
@property(strong,nonatomic)IBOutlet NSImageView *categoryimageview;

//for product
@property(strong,nonatomic)IBOutlet NSTextField *pricetxt;
@property(strong,nonatomic)IBOutlet NSTextField *shippingtxt;
@property(strong,nonatomic)IBOutlet NSTextField *categoryidtxt;

-(IBAction)chagepicture:(id)sender;
-(IBAction)Addcatecategory:(id)sender;
-(IBAction)deletecategory:(id)sender;
-(IBAction)Updatecategory:(id)sender;
-(IBAction)Showcategory:(id)sender;
-(IBAction)addproduct:(id)sender;


@end
