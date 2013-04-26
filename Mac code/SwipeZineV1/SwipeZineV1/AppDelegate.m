//
//  AppDelegate.m
//  SwipeZineV1
//
//  Created by SIPLMacMini4 on 28/02/13.
//  Copyright (c) 2013 Systematix. All rights reserved.
//

#import "AppDelegate.h"
#import "ListViewController.h"
#import <ParseOSX/Parse.h>

#import <QuartzCore/CoreAnimation.h>
#import <Quartz/Quartz.h>
#import "NSImage+Extras.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface  AppDelegate()


@property (nonatomic,strong) IBOutlet ListViewController *listview;
@end
static  int i=0;
@implementation AppDelegate
@synthesize currentview;
@synthesize spliteviewobj;
@synthesize menuView,mainview,currentsubview;
@synthesize addcategoryview,showcategoryview,listarry;
@synthesize tittletext,categoryimageview;
@synthesize descriptiontextvew,Showcategorytableview,showcategoryarry;
@synthesize categorysavebutton;
@synthesize categoryselectedid,categorydeletebutton,categoryupdatebutton,catagoryupdateidentifire,categoryfirstlbl,categorysecondlbl;
//for product
@synthesize addproductview,producttitletxt,productpricewtxt,productshippingpricetxt,productdescriptiontxtview,showproductview,productimgview,showproducttableview;
@synthesize showproductlistarry,productselectedid,categorycombobox,productupdateidentifire;
@synthesize loadingSpinner,alertidentifirestr,productfirstlbl,productsecondlbl;

//forpages
@synthesize addpagesview,showpageview,pagetittletxt,pagesubtittle,pagetextdescription,pagecategory,
pageheaderphoto,showpagelistarry,showpagetableview,pageidentifirestr,pageselectedid;
@synthesize pagedeletebtn,pagesavebtne,pageupdatebtn,pagecategorycbox,firstpagelbl,secondpagelbl;
@synthesize scroll,shareurl,shareurlstr;
@synthesize videoaudioarry,pagegalleryarry,pagetypeidstr;
//for photos
@synthesize photoscombobox,phottittle,photoimage,showphototableview,showphotolistarry,photodeletebtn,photosavebtn,photoupdatebtn,photoidentifirestr,photoradiobutton,photoradiobtnidentifirestr,photocomboboxarry,photocomboselectedid;
@synthesize photoselectedid,firstphotolbl,secondphotolbl;

///for video
@synthesize showvideoview,addvideoview,showvideoarr,videotitle,videocombobox,videotableview,savevideobtn
,updatevideobtn,deletevideobtn,videologinupdateidentifirestr,mMovieView,finalvideourl,videourlstr,videoradiobtnstr,videopagecategoryselectedid,videoselectedid,movie,firstvideolbl,secondvideolbl;
@synthesize sharevideourl,sharevideourlstr,audiovideocmbarry;

//for audio

@synthesize showaudioview,addaudioview,audiotableview,audiocmbbox,saveaudiobtn,updateaudiobtn,deleteaudiobtn,showaudioarry,audiotitle,audiologinupdateidentifirestr,audiocategorypageselectedid,audioradiobtnstr,audiourl,audiomovie,audioselectedidstr,audioradio,videoradio,firstaudiolbl,secondaudiolbl,audioext;
@synthesize shareaudiourl,shareaudiourlstr;
@synthesize audioposterimgview,videoposterimgview;
@synthesize audiovideogaleryselececcmbstr,audiovideogallery;
//for setting

@synthesize settsettingview,navbarbgcolorwell,navbattitlecolorwell,sidebarbgcolorwell,sidebartxtcolorwell,sidebaractivetxtcolorwell,listitembgcolorwell,listitemtxtcolorwell,articlebgcolorwell,articletxtcolorwell;
//for scroll view
@synthesize gallerycustumview,audiocustumview;
@synthesize pageaudiovideohallerylbl1,pageaudiovideogallerylbl2,audioscrollview,videoaudioidentifirescrrolstr,photoscrollview,deletephotovideoaudiostr,phototagvaluearry,audiotagvaluearry,videotagvaluearry;


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
}
-(CGFloat)splitView:(NSSplitView *)splitView constrainMaxCoordinate:(CGFloat)proposedMaximumPosition ofSubviewAt:(NSInteger)dividerIndex
{
    if (dividerIndex == 0)
        
        return 300.00;
    
    return YES;
}
-(CGFloat)splitView:(NSSplitView *)splitView constrainMinCoordinate:(CGFloat)proposedMinimumPosition ofSubviewAt:(NSInteger)dividerIndex
{
    if (dividerIndex == 0)
        
        return 300.0;
    
    return YES;
}

- (void)awakeFromNib
{
    [Parse setApplicationId:@"F2UZX9upb4V0MU13MLNqbN1GLLa2tOsgw2mJHbxO"
                  clientKey:@"3QegSkJAcFoQGEd22yl7cjLCKWhyc0g639YfNLCH"];
    [self Showcategorylist];
    CATransition *transition;
    NSView *contentView = [[self window] contentView];
    [contentView setWantsLayer:YES];
    [contentView addSubview:[self currentview]];
    transition = [CATransition animation];
    [transition setType:kCATransitionReveal];
    [transition setSubtype:kCATransitionFromLeft];
    NSDictionary *ani = [NSDictionary dictionaryWithObject:transition forKey:@"subviews"];
    [contentView setAnimations:ani];
    //self.audiovideocmbarry=[[NSMutableArray alloc]initWithObjects:@"Audio (with image gallery) & Full Article",@"Photo Gallery & Full Article",@"Video & Full Article",nil];
    if(self.spliteviewobj){
        if(i==0)
        {
        currentsubview=self.showcategoryview;
        [self.mainview addSubview:self.showcategoryview];
            i=1;
            tableviewidentifire=301;
        }
    }
    [self.categorysavebutton setHidden:YES];
}
//Category
-(IBAction)Showcategory:(id)sender
{
    [[self.mainview animator]replaceSubview:self.currentsubview with:self.showcategoryview];
    self.currentsubview=self.showcategoryview;
    [self Showcategorylist];
}
-(void)temp:(id)sender
{
   
}
-(IBAction)Addcatecategory:(id)sender
{
    self.tittletext.stringValue=@"";
    self.descriptiontextvew.string=@"";
    self.categoryimageview.image=nil;
    [[self.mainview animator]replaceSubview:self.currentsubview with:self.addcategoryview];
    [self.categoryupdatebutton setHidden:YES];
    [self.categorydeletebutton setHidden:YES];
    [self.categorysavebutton setHidden:NO];
    currentsubview=self.addcategoryview;
}

-(int)validationoncategory
{
   if([self.tittletext.stringValue length]==0)
   {
       return 1;
       
   }else
   {
  if([self.descriptiontextvew.string length]==0)
    {
        return 2;
    }
       else
       {
           PFQuery *query = [PFQuery queryWithClassName:@"Category"];
           [query whereKey:@"Title" equalTo:self.tittletext.stringValue];
           NSArray* findcategoryArray = [query findObjects];
           if([self.catagoryupdateidentifire isEqualToString:@"fromlogin"])
           {
             if([findcategoryArray count]!=0)
              {
               return 3;
             }
              else
              {
              return 0;
              }
           }
           else
           {
             if([self.catagoryupdateidentifire isEqualToString:@"fromupdate"])
             {
                 if([findcategoryArray count]!=0)
                 {
                     PFObject *bigObject=[findcategoryArray objectAtIndex:0];
                     NSString *objectId = bigObject.objectId;

                     if(![self.categoryselectedid isEqualToString:objectId])
                     {
                         return 3;
                     }
                     else
                         return 0;
                 }
             
             }else
             {
                 return 0;
             }
           }
       }
   }
    return 0;
}
-(void)categorysaveactivity
{ 
    self.tittletext.stringValue=[self.tittletext.stringValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    self.descriptiontextvew.string=[self.descriptiontextvew.string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    [loadingSpinner startAnimation:nil];
    self.catagoryupdateidentifire=@"fromlogin";
    int productvalue=[self validationoncategory];
    switch (productvalue)
    {
        case 1:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Fill Title"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 2:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Fill Description"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 3:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Category already avilable please insert other category"];
           
            
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        default:
        {
            NSImage *image=categoryimageview.image;
            NSData *imageData = [image TIFFRepresentation];
            NSBitmapImageRep* bitmap = [NSBitmapImageRep imageRepWithData: imageData];
            NSData* newData = [bitmap representationUsingType: NSPNGFileType properties: nil];
            PFFile *imageFile = [PFFile fileWithName:@"image.png" data:newData];
            [imageFile save];
            PFObject *categoryinsert = [PFObject objectWithClassName:@"Category"];
            [categoryinsert setObject:self.tittletext.stringValue forKey:@"Title"];
            [categoryinsert setObject:self.descriptiontextvew.string forKey:@"Description"];
            [categoryinsert setObject:imageFile forKey:@"ImageFile"];
            [categoryinsert save];
            [self Showcategorylist];
            [[self.mainview animator]replaceSubview:self.currentsubview with:self.showcategoryview];
            currentsubview=self.showcategoryview;
            self.tittletext.stringValue=@"";
            self.descriptiontextvew.string=@"";
            self.categoryimageview.image=nil;
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Category save"];
                     [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
    }
    [self stopactivity];
    
}
-(IBAction)Save:(id)sender
{
    loadingSpinner = [[NSProgressIndicator alloc] init];
    [loadingSpinner setFrame:NSMakeRect(485,200, 50, 50)];
    [loadingSpinner setStyle:NSProgressIndicatorSpinningStyle];
    [self.currentsubview addSubview:loadingSpinner];
    [NSThread detachNewThreadSelector:@selector(categorysaveactivity) toTarget:self withObject:nil];

}
-(int)checkcategoryavilabilityinprodct
{
    NSLog(@"selected category id is %@",self.categoryselectedid);
    PFQuery *query = [PFQuery queryWithClassName:@"Product"];
    [query whereKey:@"PcategoryId" equalTo:self.categoryselectedid];
    NSArray* findArray = [query findObjects];
    if([findArray count]!=0)
    {
        return 1;
    }else
    {
        PFQuery *query1 = [PFQuery queryWithClassName:@"Pages"];
        [query1 whereKey:@"PagecategoryId" equalTo:self.categoryselectedid];
        NSArray* findArray1 = [query1 findObjects];
        if([findArray1 count]!=0)
        {
            return 1;
        }
        else
        {
            PFQuery *query2 = [PFQuery queryWithClassName:@"Photos"];
            [query2 whereKey:@"categorypageid" equalTo:self.categoryselectedid];
            NSArray* findArray2 = [query2 findObjects];
            if([findArray2 count]!=0)
            {
                return 1;
            }
            else
            {
                PFQuery *query3 = [PFQuery queryWithClassName:@"Videos"];
                [query3 whereKey:@"Videocategorypageid" equalTo:self.categoryselectedid];
                NSArray* findArray3 = [query3 findObjects];
                if([findArray3 count]!=0)
                {
                    return 1;
                }
                else
                {
                    PFQuery *query4 = [PFQuery queryWithClassName:@"Audios"];
                    [query4 whereKey:@"Audiocategorypageid" equalTo:self.categoryselectedid];
                    NSArray* findArray4 = [query4 findObjects];
                    if([findArray4 count]!=0)
                    {
                        return 1;
                    }
                    else{
                    return 0;
                    }
                }
            }
               
        }
               }
    return 0;
}
- (void) alertDidEnd:(NSAlert *)a returnCode:(NSInteger)rc contextInfo:(void *)ci {
       switch(rc) {
            
        case NSAlertFirstButtonReturn:
            // "First" pressed
          
               if([self.alertidentifirestr isEqualToString:@"deletecategoryalert"])
               {
            loadingSpinner = [[NSProgressIndicator alloc] init];
            [loadingSpinner setFrame:NSMakeRect(485,200, 50, 50)];
            [loadingSpinner setStyle:NSProgressIndicatorSpinningStyle];
            [self.currentsubview addSubview:loadingSpinner];
            [NSThread detachNewThreadSelector:@selector(deletecategoryactivityindicator) toTarget:self withObject:nil];
               }
               else
               {
                   if([self.alertidentifirestr isEqualToString:@"deleteproductalert"])
                   {
                       loadingSpinner = [[NSProgressIndicator alloc] init];
                       [loadingSpinner setFrame:NSMakeRect(485,200, 50, 50)];
                       [loadingSpinner setStyle:NSProgressIndicatorSpinningStyle];
                       [self.currentsubview addSubview:loadingSpinner];
                       [NSThread detachNewThreadSelector:@selector(deleteproductactivity) toTarget:self withObject:nil];
                   }
                   else{
                        if([self.alertidentifirestr isEqualToString:@"deletepagealert"])
                       {
                           loadingSpinner = [[NSProgressIndicator alloc] init];
                           [loadingSpinner setFrame:NSMakeRect(600,200, 50, 50)];
                           [loadingSpinner setStyle:NSProgressIndicatorSpinningStyle];
                           [self.currentsubview addSubview:loadingSpinner];
                           [NSThread detachNewThreadSelector:@selector(deletepageactivity) toTarget:self withObject:nil];
                           
                       }
                       else
                           {
                               if([self.alertidentifirestr isEqualToString:@"deletephotoalert"])
                               {
                                   loadingSpinner = [[NSProgressIndicator alloc] init];
                                   [loadingSpinner setFrame:NSMakeRect(485,200, 50, 50)];
                                   [loadingSpinner setStyle:NSProgressIndicatorSpinningStyle];
                                   [self.currentsubview addSubview:loadingSpinner];
                                   [NSThread detachNewThreadSelector:@selector(deletephotoactivity) toTarget:self withObject:nil];
                                   
                               }
                               else{
                                   if([self.alertidentifirestr isEqualToString:@"deletevideoalert"])
                                   {
                                       loadingSpinner = [[NSProgressIndicator alloc] init];
                                       [loadingSpinner setFrame:NSMakeRect(485,200, 50, 50)];
                                       [loadingSpinner setStyle:NSProgressIndicatorSpinningStyle];
                                       [self.currentsubview addSubview:loadingSpinner];
                                       [NSThread detachNewThreadSelector:@selector(deletevideoactivity) toTarget:self withObject:nil];
                                       
                                   }
                                   else{
                                       
                                       if([self.alertidentifirestr isEqualToString:@"deleteaudioalert"])
                                       {
                                       loadingSpinner = [[NSProgressIndicator alloc] init];
                                       [loadingSpinner setFrame:NSMakeRect(485,200, 50, 50)];
                                       [loadingSpinner setStyle:NSProgressIndicatorSpinningStyle];
                                       [self.currentsubview addSubview:loadingSpinner];
                                       [NSThread detachNewThreadSelector:@selector(deleteaudioactivity) toTarget:self withObject:nil];
                                       }
                                       else{
                                           
                                           if([self.alertidentifirestr isEqualToString:@"deletephotoalertfrompage"])
                                           {
                                               loadingSpinner = [[NSProgressIndicator alloc] init];
                                               [loadingSpinner setFrame:NSMakeRect(600,200, 50, 50)];
                                               [loadingSpinner setStyle:NSProgressIndicatorSpinningStyle];
                                               [self.currentsubview addSubview:loadingSpinner];
                                               [NSThread detachNewThreadSelector:@selector(deletephotoactivityfrompage) toTarget:self withObject:nil];
                                           }
                                           else
                                           {
                                               
                                               if([self.alertidentifirestr isEqualToString:@"deletevideoalertfrompage"])
                                               {
                                                   loadingSpinner = [[NSProgressIndicator alloc] init];
                                                   [loadingSpinner setFrame:NSMakeRect(600,200, 50, 50)];
                                                   [loadingSpinner setStyle:NSProgressIndicatorSpinningStyle];
                                                   [self.currentsubview addSubview:loadingSpinner];
                                                   [NSThread detachNewThreadSelector:@selector(deletevideoactivityfrompage) toTarget:self withObject:nil];
                                               }
                                               
                                               else
                                               {
                                                   if([self.alertidentifirestr isEqualToString:@"deleteaudioalertfrompage"])
                                                   {
                                                       loadingSpinner = [[NSProgressIndicator alloc] init];
                                                       [loadingSpinner setFrame:NSMakeRect(600,200, 50, 50)];
                                                       [loadingSpinner setStyle:NSProgressIndicatorSpinningStyle];
                                                       [self.currentsubview addSubview:loadingSpinner];
                                                       [NSThread detachNewThreadSelector:@selector(deleteaudioactivityfrompage) toTarget:self withObject:nil];
                                                       
                                                   }
                                               }
                                               
                                           }
                                           
                                           
                                           
                                       }
                                   }
                                   
                               }
                               
                               
                           }
               
                   }
               }
            break;
        case NSAlertSecondButtonReturn:
            // "Second" pressed
            NSLog(@"Second pressed");
            break;
            // ...
    }
}

-(IBAction)deletecategory:(id)sender{
     self.alertidentifirestr=@"deletecategoryalert";
    NSAlert *alert=[[NSAlert alloc ]init];
    [alert setMessageText:@"Are you sure you want to delete category"];
    [alert addButtonWithTitle:@"Yes"];
    [alert addButtonWithTitle:@"No"];
    [alert beginSheetModalForWindow: _window modalDelegate: self
                     didEndSelector: @selector(alertDidEnd:returnCode:contextInfo:)
                        contextInfo: nil];
  
}
-(void)deletecategoryactivityindicator
{
    [loadingSpinner startAnimation:nil];
    int findinproduct=[self checkcategoryavilabilityinprodct];
    
    
    if(!findinproduct)
    {
        PFQuery *query = [PFQuery queryWithClassName:@"Category"];
        PFObject *categorydelete = [query getObjectWithId:self.categoryselectedid];
        [categorydelete deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
         {
             if (!error) {
                
                 NSLog(@"delete susscessfully");
                 [self Showcategorylist];
                 [[self.mainview animator]replaceSubview:self.currentsubview with:self.showcategoryview];
                 currentsubview=self.showcategoryview;
                 self.tittletext.stringValue=@"";
                 self.descriptiontextvew.string=@"";
                 self.categoryimageview.image=nil;
                 NSAlert *alert = [[NSAlert alloc] init];
                 [alert setAlertStyle:NSInformationalAlertStyle];
                 [alert setMessageText:@"Category has been deleted"];
                 [alert beginSheetModalForWindow:_window
                                   modalDelegate:self
                                  didEndSelector:@selector(ok)
                                     contextInfo:nil];
                 
             } else {
                 // There was an error saving the gameScore.
                 NSLog(@"Error during update data");
                 NSAlert *alert = [[NSAlert alloc] init];
                 [alert setAlertStyle:NSInformationalAlertStyle];
                 [alert setMessageText:@"Error"];
                 //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
                 
                 [alert beginSheetModalForWindow:_window
                                   modalDelegate:self
                  
                                  didEndSelector:@selector(ok)
                                     contextInfo:nil];
             }
         }
         ];
    }
    else{
        NSAlert *alert = [[NSAlert alloc] init];
        [alert setAlertStyle:NSInformationalAlertStyle];
        [alert setMessageText:@"This category will not delete because it is use in other table"];
        [alert beginSheetModalForWindow:_window
                          modalDelegate:self
                         didEndSelector:@selector(ok)
                            contextInfo:nil];
    }
     [self stopactivity];
}
-(void)updateactivityindicator
{
    self.tittletext.stringValue=[self.tittletext.stringValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    self.descriptiontextvew.string=[self.descriptiontextvew.string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    [loadingSpinner startAnimation:nil];
    self.catagoryupdateidentifire=@"fromupdate";
    int productvalue=[self validationoncategory];
    switch (productvalue)
    {
        case 1:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Fill Title"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 2:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Fill Description"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 3:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Category already avilable please insert other category"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
       
        default:
        {
            PFQuery *query = [PFQuery queryWithClassName:@"Category"];
            PFObject *categoryupdate = [query getObjectWithId:self.categoryselectedid];
            NSImage *image=self.categoryimageview.image;
            NSData *imageData = [image TIFFRepresentation];
            NSBitmapImageRep* bitmap = [NSBitmapImageRep imageRepWithData: imageData];
            NSData* newData = [bitmap representationUsingType: NSPNGFileType properties: nil];
            PFFile *imageFile = [PFFile fileWithName:@"image.png" data:newData];
            [imageFile save];
            [categoryupdate setObject:self.tittletext.stringValue forKey:@"Title"];
            [categoryupdate setObject:self.descriptiontextvew.string forKey:@"Description"];
            [categoryupdate setObject:imageFile forKey:@"ImageFile"];
            [categoryupdate saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (!error) {
                    // The gameScore saved successfully.
                    NSLog(@"Update succesfully");
                    [self Showcategorylist];
                    [[self.mainview animator]replaceSubview:self.currentsubview with:self.showcategoryview];
                    currentsubview=self.showcategoryview;
                    self.tittletext.stringValue=@"";
                    self.descriptiontextvew.string=@"";
                    self.categoryimageview.image=nil;
                    NSAlert *alert = [[NSAlert alloc] init];
                    [alert setAlertStyle:NSInformationalAlertStyle];
                    [alert setMessageText:@"Update Succesfull"];
                   
                    [alert beginSheetModalForWindow:_window
                                      modalDelegate:self
                     
                                     didEndSelector:@selector(ok)
                                        contextInfo:nil];
                    
                } else {
                    // There was an error saving the gameScore.
                    NSLog(@"Error during update data");
                }
            }];
        }
            break;
    }
 [self stopactivity];
}
-(void)stopactivity
{
    [loadingSpinner stopAnimation:nil];
    [loadingSpinner removeFromSuperview];
}
-(IBAction)Updatecategory:(id)sender
{
    loadingSpinner = [[NSProgressIndicator alloc] init];
    [loadingSpinner setFrame:NSMakeRect(485,200, 50, 50)];
    [loadingSpinner setStyle:NSProgressIndicatorSpinningStyle];
    [self.currentsubview addSubview:loadingSpinner];
     [NSThread detachNewThreadSelector:@selector(updateactivityindicator) toTarget:self withObject:nil];
    
}

//Actions fro product
-(IBAction)addProduct:(id)sender
{
    if([self.showcategoryarry count]!=0)
    {
    [self.updateproductbtn setHidden:YES];
    [self.deleteproductbtn setHidden:YES];
    [self.saveproductbtn setHidden:NO];
    [[self.mainview animator]replaceSubview:self.currentsubview with:self.addproductview];
    currentsubview=self.addproductview;
    self.producttitletxt.stringValue=@"";
    self.productdescriptiontxtview.string=@"";
    self.productpricewtxt.stringValue=@"";
    self.productshippingpricetxt.stringValue=@"";
    self.productimgview.image=nil;
    self.categorycombobox.stringValue=@"";
    }
    else{
        
        NSAlert *alert = [[NSAlert alloc] init];
        [alert setAlertStyle:NSInformationalAlertStyle];
        [alert setMessageText:@"Need to add atleast one category"];
        //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
        
        [alert beginSheetModalForWindow:_window
                          modalDelegate:self
         
                         didEndSelector:@selector(ok)
                            contextInfo:nil];
    }

    
}
-(void)Showproductlist
{
    tableviewidentifire=302;
    [self.showproducttableview setHidden:YES];
    PFQuery *query = [PFQuery queryWithClassName:@"Product"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            self.showproductlistarry=[[NSMutableArray alloc]initWithArray:objects];
            NSLog(@"Successfully retrieved %ld scores. %@", objects.count,objects);
            if([self.showcategoryarry count]==0)
            {
                [self.showproducttableview setHidden:YES];
                [self.productfirstlbl setHidden:NO];
                [self.productsecondlbl setHidden:NO];
                self.productfirstlbl.stringValue=@"Your Categories Are Looking Empty.";
                self.productsecondlbl.stringValue=@"Get Started by creating your first category";
            }
            else
            {
                if([self.showproductlistarry count]==0)
                {
                    [self.productfirstlbl setHidden:NO];
                    [self.productsecondlbl setHidden:NO];
                    [self.showproducttableview setHidden:YES];
                    self.productfirstlbl.stringValue=@"Your Products Are Looking Empty.";
                    self.productsecondlbl.stringValue=@"Get Started by creating your first product";
                    
                    
                }else{
                    [self.productfirstlbl setHidden:YES];
                    [self.productsecondlbl setHidden:YES];
                    [self.showproducttableview setHidden:NO];
                    [self.showproducttableview reloadData];
                    
                }
            }
            
        }else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Error from servere side"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
    }];
}
-(IBAction)showproduct:(id)sender
{   [self Showproductlist];
    [[self.mainview animator]replaceSubview:self.currentsubview with:self.showproductview];
    currentsubview=self.showproductview;
}
-(void)saveproductactivity
{
    self.producttitletxt.stringValue=[self.producttitletxt.stringValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    self.productshippingpricetxt.stringValue=[self.productshippingpricetxt.stringValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    self.productpricewtxt.stringValue=[self.productpricewtxt.stringValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    self.productdescriptiontxtview.string=[self.productdescriptiontxtview.string stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    self.categorycombobox.stringValue=[self.categorycombobox.stringValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    
    [loadingSpinner startAnimation:nil];
    self.productupdateidentifire=@"fromproductlogin";
    int productvalue=[self chekproduct];
    switch (productvalue)
    {
        case 1:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Fill Title"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 2:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Fill Description"];
                       [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 3:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Fill Price"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
			
            break;
        case 4:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Fill Shipping Price"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            
            break;
        case 5:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Select Category"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            
            break;
            
        case 6:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please enter numeric value in price"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            
            break;
        case 7:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please enter numeric value in shippping price"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            
            break;
        case 8:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Product already avilable please insert other Product"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
            
        default:
        {
            NSImage *image=self.productimgview.image;
            NSData *imageData = [image TIFFRepresentation];
            NSBitmapImageRep* bitmap = [NSBitmapImageRep imageRepWithData: imageData];
            NSData* newData = [bitmap representationUsingType: NSPNGFileType properties: nil];
            PFFile *imageFile = [PFFile fileWithName:@"image.png" data:newData];
            [imageFile save];
            PFObject *productinsert = [PFObject objectWithClassName:@"Product"];
            [productinsert setObject:self.producttitletxt.stringValue forKey:@"ProductTitle"];
            [productinsert setObject:self.productdescriptiontxtview.string forKey:@"ProductDescription"];
            [productinsert setObject:self.productpricewtxt.stringValue forKey:@"ProductPrice"];
            [productinsert setObject:self.productshippingpricetxt.stringValue forKey:@"ProductShippingprice"];
            [productinsert setObject:imageFile forKey:@"ProImageFile"];
            [productinsert setObject:self.categoryselectedid forKey:@"PcategoryId"];
            NSLog(@"value of product object is %@",productinsert);
            [productinsert save];
            self.producttitletxt.stringValue=@"";
            self.productdescriptiontxtview.string=@"";
            self.productpricewtxt.stringValue=@"";
            self.productshippingpricetxt.stringValue=@"";
            self.productimgview.image=nil;
            self.categorycombobox.stringValue=@"";
            
            [self Showproductlist];
            [[self.mainview animator]replaceSubview:self.currentsubview with:self.showproductview];
            currentsubview=self.showproductview;
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"New product has been added"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
            break;
        }
    }
    [self stopactivity];
}
-(IBAction)Saveproduct:(id)sender
{ loadingSpinner = [[NSProgressIndicator alloc] init];
    [loadingSpinner setFrame:NSMakeRect(485,200, 50, 50)];
    [loadingSpinner setStyle:NSProgressIndicatorSpinningStyle];
    [self.currentsubview addSubview:loadingSpinner];
    [NSThread detachNewThreadSelector:@selector(saveproductactivity) toTarget:self withObject:nil];
}


-(void)deleteproductactivity
{
    [loadingSpinner startAnimation:nil];
    PFQuery *query = [PFQuery queryWithClassName:@"Product"];
    PFObject *productdelete = [query getObjectWithId:self.productselectedid];
    NSLog(@"delete data is %@",productdelete);
    [productdelete deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
     {
         if (!error) {
             // The gameScore saved successfully.
             NSLog(@"delete susscessfully");
             [self Showproductlist];
             [[self.mainview animator]replaceSubview:self.currentsubview with:self.showproductview];
             currentsubview=self.showproductview;
             self.producttitletxt.stringValue=@"";
             self.productdescriptiontxtview.string=@"";
             self.productpricewtxt.stringValue=@"";
             self.productshippingpricetxt.stringValue=@"";
             self.productimgview.image=nil;
             NSAlert *alert = [[NSAlert alloc] init];
             [alert setAlertStyle:NSInformationalAlertStyle];
             [alert setMessageText:@"Product has been deleted"];
             [alert beginSheetModalForWindow:_window
                               modalDelegate:self
                              didEndSelector:@selector(ok)
                                 contextInfo:nil];
             
         } else {
             // There was an error saving the gameScore.
             NSLog(@"Error during update data");
         }
     }
     ];
    [self stopactivity];

}
-(IBAction)deleteproduct:(id)sender{
    self.alertidentifirestr=@"deleteproductalert";
    NSAlert *alert=[[NSAlert alloc ]init];
    [alert setMessageText:@"Are you sure you want to delete product"];
    [alert addButtonWithTitle:@"Yes"];
    [alert addButtonWithTitle:@"No"];
    [alert beginSheetModalForWindow: _window modalDelegate: self
                     didEndSelector: @selector(alertDidEnd:returnCode:contextInfo:)
                        contextInfo: nil];
 
    }
-(BOOL)checknumericvalue:(NSString*)str
{
    NSString *strMatchstring=@"\\b([0-9%_.+\\-]+)\\b";
    NSPredicate *textpredicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@", strMatchstring];
    
    if(![textpredicate evaluateWithObject:str])
    {
        return FALSE;
    }
    return TRUE;
}
-(int)chekproduct
{
    if([self.producttitletxt.stringValue length]==0)
    {
        return 1;
    }
    if([self.productdescriptiontxtview.string length]==0)
    {
        return 2;
    }
    if([self.productpricewtxt.stringValue length]==0)
    {
        return 3;
    }
    if([self.productshippingpricetxt.stringValue length]==0)
    {
        return 4;
    }
    if([self.categorycombobox.stringValue length]==0)
    {
        return 5;
    }
    if([self.productpricewtxt.stringValue length]!=0)
    {
        BOOL numericvalue  =[self checknumericvalue:self.productpricewtxt.stringValue];
        if(!numericvalue)
        return 6;
    }
    if([self.productshippingpricetxt.stringValue length]!=0)
    {
        BOOL numericvalue  =[self checknumericvalue:self.productshippingpricetxt.stringValue];
        if(!numericvalue)
            return 7;
        else{
            PFQuery *query = [PFQuery queryWithClassName:@"Product"];
            [query whereKey:@"ProductTitle" equalTo:self.producttitletxt.stringValue];
            NSArray* findproductArray = [query findObjects];
          
            
            
            if([self.productupdateidentifire isEqualToString:@"fromproductlogin"])
            {
                if([findproductArray count]!=0)
                {
                    return 8;
                }
                else
                {
                    return 0;
                }
            }
            else{
                
                if([self.productupdateidentifire isEqualToString:@"fromproductupdate"])
                {
                    if([findproductArray count]!=0)
                    {
                        PFObject *bigObject=[findproductArray objectAtIndex:0];
                        NSString *objectId = bigObject.objectId;
                        
                        if(![self.productselectedid isEqualToString:objectId])
                        {
                            return 8;
                        }
                        else
                            return 0;
                    }
                    
                }else
                {
                    return 0;
                }
            }
        }
    }
    return 0;
}
-(void)updateproductactivity
{
    self.producttitletxt.stringValue=[self.producttitletxt.stringValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    self.productshippingpricetxt.stringValue=[self.productshippingpricetxt.stringValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    self.productpricewtxt.stringValue=[self.productpricewtxt.stringValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    self.productdescriptiontxtview.string=[self.productdescriptiontxtview.string stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    self.categorycombobox.stringValue=[self.categorycombobox.stringValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    [loadingSpinner startAnimation:nil];
    self.productupdateidentifire=@"fromproductupdate";
    
    int productvalue=[self chekproduct];
    switch (productvalue)
    {
        case 1:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Fill Title"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 2:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Fill Description"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 3:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Fill Price"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
			
            break;
        case 4:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Fill Shipping Price"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            
            break;
        case 5:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Select Category"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            
            break;
        case 6:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please enter numeric value in price"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            
            break;
        case 7:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please enter numeric value in shippping price"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            
            break;
        case 8:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Product already avilable please insert other Product"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        default:
        {
            PFQuery *query = [PFQuery queryWithClassName:@"Product"];
            PFObject *productupdate = [query getObjectWithId:self.productselectedid];
            NSImage *image=self.productimgview.image;
            NSData *imageData = [image TIFFRepresentation];
            NSBitmapImageRep* bitmap = [NSBitmapImageRep imageRepWithData: imageData];
            NSData* newData = [bitmap representationUsingType: NSPNGFileType properties: nil];
            PFFile *imageFile = [PFFile fileWithName:@"image.png" data:newData];
            [imageFile save];
            [productupdate setObject:self.producttitletxt.stringValue forKey:@"ProductTitle"];
            [productupdate setObject:self.productdescriptiontxtview.string forKey:@"ProductDescription"];
            [productupdate setObject:self.productpricewtxt.stringValue forKey:@"ProductPrice"];
            [productupdate setObject:self.productshippingpricetxt.stringValue forKey:@"ProductShippingprice"];
            [productupdate setObject:imageFile forKey:@"ProImageFile"];
            NSLog(@"self.categoryselectedid %@",self.categoryselectedid);
            [productupdate setObject:self.categoryselectedid forKey:@"PcategoryId"];
            NSLog(@"value of product update is %@",productupdate);
            [productupdate saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (!error) {
                    // The gameScore saved successfully.
                    NSLog(@"Update succesfully");
                    [self Showproductlist];
                    [[self.mainview animator]replaceSubview:self.currentsubview with:self.showproductview];
                    currentsubview=self.showproductview;
                    self.producttitletxt.stringValue=@"";
                    self.productdescriptiontxtview.string=@"";
                    self.productpricewtxt.stringValue=@"";
                    self.productshippingpricetxt.stringValue=@"";
                    self.productimgview.image=nil;
                    NSAlert *alert = [[NSAlert alloc] init];
                    [alert setAlertStyle:NSInformationalAlertStyle];
                    [alert setMessageText:@"Product update Succesfull"];
                    
                    [alert beginSheetModalForWindow:_window
                                      modalDelegate:self
                     
                                     didEndSelector:@selector(ok)
                                        contextInfo:nil];
                    
                } else {
                    // There was an error saving the gameScore.
                    NSLog(@"Error during update data");
                    NSAlert *alert = [[NSAlert alloc] init];
                    [alert setAlertStyle:NSInformationalAlertStyle];
                    [alert setMessageText:@"Error during update data"];
                    //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
                    
                    [alert beginSheetModalForWindow:_window
                                      modalDelegate:self
                     
                                     didEndSelector:@selector(ok)
                                        contextInfo:nil];
                }
            }];
            
        }
            break;
    }
  
    [self stopactivity];
    
}
-(IBAction)updateproduct:(id)sender{
    loadingSpinner = [[NSProgressIndicator alloc] init];
    [loadingSpinner setFrame:NSMakeRect(485,200, 50, 50)];
    [loadingSpinner setStyle:NSProgressIndicatorSpinningStyle];
    [self.currentsubview addSubview:loadingSpinner];
    [NSThread detachNewThreadSelector:@selector(updateproductactivity) toTarget:self withObject:nil];
   }
-(void)ok
{
    
}

//for setting
-(IBAction)Addsetting:(id)sender{
    PFQuery *query = [PFQuery queryWithClassName:@"SwipeZineConfigs"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            NSMutableArray *temparry=[[NSMutableArray alloc]initWithArray:objects];
            if([temparry count]!=0)
            {
            PFObject *getObject=[temparry objectAtIndex:0];
            NSLog(@"value of get color object is %@",getObject);
            NSString *getnavbartitlecolorstr=[getObject objectForKey:@"NavBarTitleColor"];
            NSString *getnavbarbgcolorstr=[getObject objectForKey:@"NavBarBackgroundColor"];
            NSString *getsidebarcolorstr=[getObject objectForKey:@"SidebarBackgroundColor"];
            NSString *getsidebartxtcolorstr=[getObject objectForKey:@"SidebarTextColor"];
            NSString *getsidebaractivetxtcolorstr=[getObject objectForKey:@"SidebarActiveTextColor"];
            NSString *getlistitembgcolorstr=[getObject objectForKey:@"ListItemBackgroundColor"];
            NSString *getlistitemtxtcolorstr=[getObject objectForKey:@"ListItemTextColor"];
            NSString *getarticlebgcolorstr=[getObject objectForKey:@"ArticleBackgroundColor"];
            NSString *getarticletxtcolorstr=[getObject objectForKey:@"ArticleTextColor"];
            [self.navbattitlecolorwell setColor:[self colorWithHexColorString:getnavbartitlecolorstr]];
            [self.navbarbgcolorwell setColor:[self colorWithHexColorString:getnavbarbgcolorstr]];
            [self.sidebarbgcolorwell setColor:[self colorWithHexColorString:getsidebarcolorstr]];
            [self.sidebartxtcolorwell setColor:[self colorWithHexColorString:getsidebartxtcolorstr]];
            [self.sidebaractivetxtcolorwell setColor:[self colorWithHexColorString:getsidebaractivetxtcolorstr]];
            [self.listitembgcolorwell setColor:[self colorWithHexColorString:getlistitembgcolorstr]];
            [self.listitemtxtcolorwell setColor:[self colorWithHexColorString:getlistitemtxtcolorstr]];
            [self.articlebgcolorwell setColor:[self colorWithHexColorString:getarticlebgcolorstr]];
            [self.articletxtcolorwell setColor:[self colorWithHexColorString:getarticletxtcolorstr]];
            }
        }
        else
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Network Problem"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
    }];
    [[self.mainview animator]replaceSubview:self.currentsubview with:self.settsettingview];
    currentsubview=self.settsettingview;
}
+ (void)initialize {
    
        [[NSColorPanel sharedColorPanel] setShowsAlpha:YES];
    
}

- (NSColor*)colorWithHexColorString:(NSString*)inColorString
{
    NSColor* result = nil;
    unsigned colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != inColorString)
    {
        NSScanner* scanner = [NSScanner scannerWithString:inColorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    NSLog(@"value of color code is %u",colorCode);
    redByte = (unsigned char)(colorCode >> 16);
    greenByte = (unsigned char)(colorCode >> 8);
    blueByte = (unsigned char)(colorCode); // masks off high bits
    
    result = [NSColor
              colorWithCalibratedRed:(CGFloat)redByte / 0xff
              green:(CGFloat)greenByte / 0xff
              blue:(CGFloat)blueByte / 0xff
              alpha:1.0];
    return result;
}

-(int)checkonsetting
{
    return 0;
}
-(void)savesettingActivity
{
    
    [loadingSpinner startAnimation:nil];
    PFQuery *query = [PFQuery queryWithClassName:@"SwipeZineConfigs"];
    NSArray* temparry = [query findObjects];
    
    
    NSString* navbarbgcolorstr = [self hexadeimalstringfromcolor:self.navbarbgcolorwell.color];
    NSString *navbartitlecolorstr=[self hexadeimalstringfromcolor:self.navbattitlecolorwell.color];
    NSString *sidebarcolorstr=[self hexadeimalstringfromcolor:self.sidebarbgcolorwell.color];
    NSString *sidebartxtcolorstr=[self hexadeimalstringfromcolor:self.sidebartxtcolorwell.color];
    NSString *sidebaractivetxtcolorstr=[self hexadeimalstringfromcolor:self.sidebaractivetxtcolorwell.color];
    NSString *listitembgcolorstr=[self hexadeimalstringfromcolor:self.listitembgcolorwell.color];
    NSString *listitemtxtcolorstr=[self hexadeimalstringfromcolor:self.listitemtxtcolorwell.color];
    NSString *articlebgcolorstr=[self hexadeimalstringfromcolor:self.articlebgcolorwell.color];
    NSString *articletxtcolorstr=[self hexadeimalstringfromcolor:self.articletxtcolorwell.color];
    if([temparry count]!=0)
    {
        NSLog(@"query objecti index %@",[query getObjectWithId:[temparry objectAtIndex:0]]);
        PFObject *pagedelete = [temparry objectAtIndex:0];
        NSLog(@"delete data is %@",pagedelete);
        [pagedelete deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
         {
             if (!error) {
                 PFObject *insertcolorsetting = [PFObject objectWithClassName:@"SwipeZineConfigs"];
                 [insertcolorsetting setObject:navbartitlecolorstr forKey:@"NavBarTitleColor"];
                // [insertcolorsetting setObject:navbarbgcolorstr forKey:@"NavBarBackgroundColor"];
                 [insertcolorsetting setObject:@"13213B" forKey:@"NavBarBackgroundColor"];
                 [insertcolorsetting setObject:sidebarcolorstr forKey:@"SidebarBackgroundColor"];
                 [insertcolorsetting setObject:sidebartxtcolorstr forKey:@"SidebarTextColor"];
                // [insertcolorsetting setObject:sidebaractivetxtcolorstr forKey:@"SidebarActiveTextColor"];
                  [insertcolorsetting setObject:@"EF353D" forKey:@"SidebarActiveTextColor"];
                 [insertcolorsetting setObject: listitembgcolorstr forKey:@"ListItemBackgroundColor"];
                 [insertcolorsetting setObject:listitemtxtcolorstr forKey:@"ListItemTextColor"];
                 //[insertcolorsetting setObject:articlebgcolorstr forKey:@"ArticleBackgroundColor"];
                 [insertcolorsetting setObject:@"F5F5F5" forKey:@"ArticleBackgroundColor"];
                // [insertcolorsetting setObject:articletxtcolorstr forKey:@"ArticleTextColor"];
                 [insertcolorsetting setObject:@"464646" forKey:@"ArticleTextColor"];
                 [insertcolorsetting save];
                 NSAlert *alert = [[NSAlert alloc] init];
                 [alert setAlertStyle:NSInformationalAlertStyle];
                 [alert setMessageText:@"Color Setting hasbeen saved"];
                 [alert beginSheetModalForWindow:_window
                                   modalDelegate:self
                                  didEndSelector:@selector(ok)
                                     contextInfo:nil];
             }
             else{
                 NSAlert *alert = [[NSAlert alloc] init];
                 [alert setAlertStyle:NSInformationalAlertStyle];
                 [alert setMessageText:@"Connection failed"];
                 [alert beginSheetModalForWindow:_window
                                   modalDelegate:self
                                  didEndSelector:@selector(ok)
                                     contextInfo:nil];
             }
         }];
    }
    else{
        PFObject *insertcolorsetting = [PFObject objectWithClassName:@"SwipeZineConfigs"];
        [insertcolorsetting setObject:navbartitlecolorstr forKey:@"NavBarTitleColor"];
        [insertcolorsetting setObject:navbarbgcolorstr forKey:@"NavBarBackgroundColor"];
        [insertcolorsetting setObject:sidebarcolorstr forKey:@"SidebarBackgroundColor"];
        [insertcolorsetting setObject:sidebartxtcolorstr forKey:@"SidebarTextColor"];
        [insertcolorsetting setObject:sidebaractivetxtcolorstr forKey:@"SidebarActiveTextColor"];
        [insertcolorsetting setObject: listitembgcolorstr forKey:@"ListItemBackgroundColor"];
        [insertcolorsetting setObject:listitemtxtcolorstr forKey:@"ListItemTextColor"];
        [insertcolorsetting setObject:articlebgcolorstr forKey:@"ArticleBackgroundColor"];
        [insertcolorsetting setObject:articletxtcolorstr forKey:@"ArticleTextColor"];
        [insertcolorsetting save];
        NSAlert *alert = [[NSAlert alloc] init];
        [alert setAlertStyle:NSInformationalAlertStyle];
        [alert setMessageText:@"Color Setting hasbeen saved"];
        [alert beginSheetModalForWindow:_window
                          modalDelegate:self
                         didEndSelector:@selector(ok)
                            contextInfo:nil];
    }
    
    [self stopactivity];
}
-(IBAction)savesetting:(id)sender{
    loadingSpinner = [[NSProgressIndicator alloc] init];
    [loadingSpinner setFrame:NSMakeRect(335,205, 50, 50)];
    [loadingSpinner setStyle:NSProgressIndicatorSpinningStyle];
    [self.currentsubview addSubview:loadingSpinner];
    [NSThread detachNewThreadSelector:@selector(savesettingActivity) toTarget:self withObject:nil];
    
    
}

   // int settingcheck=[self checkonsetting];
        
             
//convert from color to hexadecimal string.
-(NSString*)hexadeimalstringfromcolor:(NSColor*)colortostr
{
    NSString *hecadecimalcolorstr=[NSString stringWithFormat:@"%02X%02X%02X",
     (int) (colortostr.redComponent * 0xFF), (int) (colortostr.greenComponent * 0xFF),
     (int) (colortostr.blueComponent * 0xFF)];

    return hecadecimalcolorstr;
}


//combobox
- (NSInteger)numberOfItemsInComboBox:(NSComboBox *)aComboBox
{
    // anArray is an NSArray variable containing the objects
    
    NSLog(@"%ld",[aComboBox tag]);
    if([aComboBox tag]==901||[aComboBox tag]==902)
    return [self.showcategoryarry count];
    if([aComboBox tag]==903||[aComboBox tag]==904||[aComboBox tag]==905)
        return [self.photocomboboxarry count];
    if([aComboBox tag]==906)
        return  [self.audiovideocmbarry count];
    
    return 0;
}

// Returns the object that corresponds to the item at the specified index in the combo box
- (id)comboBox:(NSComboBox *)aComboBox objectValueForItemAtIndex:(NSInteger)index
{
    NSString *cmbstr;
    PFObject *getObject;
    if([aComboBox tag]==901||[aComboBox tag]==902)
    {
    getObject=[self.showcategoryarry objectAtIndex:index];
    cmbstr= [getObject objectForKey:@"Title"];
    }
    if([aComboBox tag]==903)
    {
        getObject=[self.photocomboboxarry objectAtIndex:index];
       
        if([self.photoradiobtnidentifirestr isEqualToString:@"Category" ])
        {
        cmbstr= [getObject objectForKey:@"Title"];
        }else
        {
            if([self.photoradiobtnidentifirestr isEqualToString:@"Pages"])
            cmbstr= [getObject objectForKey:@"PageTitle"];
        }
            
    }
    if([aComboBox tag]==904)
    {
        getObject=[self.photocomboboxarry objectAtIndex:index];
        
        if([self.videoradiobtnstr isEqualToString:@"Category" ])
        {
            cmbstr= [getObject objectForKey:@"Title"];
        }else
        {
            if([self.videoradiobtnstr isEqualToString:@"Pages"])
                cmbstr= [getObject objectForKey:@"PageTitle"];
        }
    }
    if([aComboBox tag]==905)
    {
        getObject=[self.photocomboboxarry objectAtIndex:index];
        
        if([self.audioradiobtnstr isEqualToString:@"Category" ])
        {
            cmbstr= [getObject objectForKey:@"Title"];
        }else
        {
            if([self.audioradiobtnstr isEqualToString:@"Pages"])
                cmbstr=[getObject objectForKey:@"PageTitle"];
        }

    }
    if([aComboBox tag]==906)
    {
        getObject=[self.audiovideocmbarry objectAtIndex:index];
        cmbstr=[getObject objectForKey:@"PageTypevalue"];
    }
    return cmbstr;
}

- (void)comboBoxSelectionDidChange:(NSNotification *)notification {
    PFObject *getObject;
     if([[notification object]tag]==901||[[notification object]tag]==902)
     {
    getObject=[self.showcategoryarry objectAtIndex:[(NSComboBox *)[notification object] indexOfSelectedItem]];
   self.categoryselectedid = getObject.objectId;
     }
    if([[notification object]tag]==903)
    {
        getObject=[self.photocomboboxarry objectAtIndex:[(NSComboBox *)[notification object] indexOfSelectedItem]];
        self.photocomboselectedid=getObject.objectId;
    }
    if([[notification object]tag]==904)
    {
        getObject=[self.photocomboboxarry objectAtIndex:[(NSComboBox *)[notification object] indexOfSelectedItem]];
        
        self.videopagecategoryselectedid=getObject.objectId;
    }
    if([[notification object]tag]==905)
    {
        getObject=[self.photocomboboxarry objectAtIndex:[(NSComboBox *)[notification object] indexOfSelectedItem]];
        
        self.audiocategorypageselectedid=getObject.objectId;
    }
    if([[notification object]tag]==906)
    {
        //self.audiovideogaleryselececcmbstr=[self.audiovideocmbarry objectAtIndex:[(NSComboBox *)[notification object] indexOfSelectedItem]];
        getObject=[self.audiovideocmbarry objectAtIndex:[(NSComboBox *)[notification object] indexOfSelectedItem]];
        self.pagetypeidstr=getObject.objectId;
        self.audiovideogaleryselececcmbstr=[getObject objectForKey:@"PageTypevalue"];
        //PageTypevalue
        
        if([self.pageidentifirestr isEqualToString:@"fromupdate"])
        {
            
         [self getaudiovideogalleryonpage];
        }
        else
        {
           
        [self savepageandaddaudiovideophoto];
        }
        
    }
}
//get the audio video gallery
-(void)savepageandaddaudiovideophoto
{
/*  [self.audiocustumview setHidden:NO];
    [self.photoscrollview setHidden:NO];
    [self.audioscrollview setHidden:NO];
    [self.gallerycustumview setHidden:NO];
    [self.pageaudiovideogallerylbl2 setHidden:NO];
    [self.pageaudiovideohallerylbl1 setHidden:NO];*/
    
    if([self.audiovideogaleryselececcmbstr isEqualToString:@"Audio (with image gallery) & Full Article"])
    {
        while ([[gallerycustumview subviews] count] > 0)
            [[[gallerycustumview subviews] lastObject] removeFromSuperview];
        
        while ([[audiocustumview subviews] count] > 0)
            [[[audiocustumview subviews] lastObject] removeFromSuperview];
      
        int k = 100;
        NSButton *AddaudioButton = [[NSButton alloc] initWithFrame:NSMakeRect(0, self.audiocustumview.frame.origin.y, k, self.audiocustumview.frame.size.height)];
        [AddaudioButton setTitle: @"Add Audio"];
        [AddaudioButton setButtonType:NSMomentaryLightButton];
        [AddaudioButton setBezelStyle:NSRoundedBezelStyle];
        [AddaudioButton setTarget:self];
        [AddaudioButton setAction:@selector(addaudiofrompage)];
        [audiocustumview addSubview:AddaudioButton];
        
        
        
        NSButton *AddgalleryButton = [[NSButton alloc] initWithFrame:NSMakeRect(0, self.gallerycustumview.frame.origin.y, k, self.gallerycustumview.frame.size.height)];
        [AddgalleryButton setTitle: @"Add Photo"];
        [AddgalleryButton setButtonType:NSMomentaryLightButton];
        [AddgalleryButton setBezelStyle:NSRoundedBezelStyle];
        [AddgalleryButton setTarget:self];
        [AddgalleryButton setAction:@selector(addphotofrompage)];
        [gallerycustumview addSubview:AddgalleryButton];
        
        
        
        [self.audioscrollview setHidden:NO];
        [self.pageaudiovideogallerylbl2 setHidden:NO];
        [self.pageaudiovideohallerylbl1 setHidden:NO];
        [self.photoscrollview setHidden:NO];
        [self.gallerycustumview setHidden:NO];
        [self.audiocustumview setHidden:NO];
        
          
    }
     if([self.audiovideogaleryselececcmbstr isEqualToString:@"Photo Gallery & Full Article"])
    {
        [self.audioscrollview setHidden:YES];
        [self.pageaudiovideogallerylbl2 setHidden:YES];
        [self.pageaudiovideohallerylbl1 setHidden:NO];
        [self.photoscrollview setHidden:NO];
        [self.gallerycustumview setHidden:NO];
        [self.audiocustumview setHidden:YES];
        
        
        while ([[gallerycustumview subviews] count] > 0)
            [[[gallerycustumview subviews] lastObject] removeFromSuperview];
        
        while ([[audiocustumview subviews] count] > 0)
            [[[audiocustumview subviews] lastObject] removeFromSuperview];
        
        int k = 100;
        NSButton *AddgalleryButton = [[NSButton alloc] initWithFrame:NSMakeRect(0, self.gallerycustumview.frame.origin.y, k, self.gallerycustumview.frame.size.height)];
        [AddgalleryButton setTitle: @"Add Photo"];
        [AddgalleryButton setButtonType:NSMomentaryLightButton];
        [AddgalleryButton setBezelStyle:NSRoundedBezelStyle];
        [AddgalleryButton setTarget:self];
        [AddgalleryButton setAction:@selector(addphotofrompage)];
        [gallerycustumview addSubview:AddgalleryButton];
        
    }
    if([self.audiovideogaleryselececcmbstr isEqualToString:@"Video & Full Article"])
    {
        [self.audioscrollview setHidden:YES];
        [self.pageaudiovideogallerylbl2 setHidden:YES];
        [self.pageaudiovideohallerylbl1 setHidden:NO];
        [self.photoscrollview setHidden:NO];
        [self.gallerycustumview setHidden:NO];
        [self.audiocustumview setHidden:YES];
        while ([[gallerycustumview subviews] count] > 0)
            [[[gallerycustumview subviews] lastObject] removeFromSuperview];
        
        while ([[audiocustumview subviews] count] > 0)
            [[[audiocustumview subviews] lastObject] removeFromSuperview];
        
        int k = 100;
        NSButton *AddgalleryButton = [[NSButton alloc] initWithFrame:NSMakeRect(0, self.gallerycustumview.frame.origin.y, k, self.gallerycustumview.frame.size.height)];
        [AddgalleryButton setTitle: @"Add Video"];
        [AddgalleryButton setButtonType:NSMomentaryLightButton];
        [AddgalleryButton setBezelStyle:NSRoundedBezelStyle];
        [AddgalleryButton setTarget:self];
        [AddgalleryButton setAction:@selector(addvideofrompage)];
        [gallerycustumview addSubview:AddgalleryButton];
    }
    if([self.audiovideogaleryselececcmbstr isEqualToString:@"Single Photo & Full Article"])
    {
        
        while ([[audiocustumview subviews] count] > 0)
            [[[audiocustumview subviews] lastObject] removeFromSuperview];
        
        while ([[gallerycustumview subviews] count] > 0)
            [[[gallerycustumview subviews] lastObject] removeFromSuperview];
        [self.audioscrollview setHidden:YES];
        [self.pageaudiovideogallerylbl2 setHidden:YES];
        [self.pageaudiovideohallerylbl1 setHidden:YES];
        [self.photoscrollview setHidden:YES];
        [self.gallerycustumview setHidden:YES];
        [self.audiocustumview setHidden:YES];
        [self.pageaudiovideogallerylbl2 setHidden:YES];
    }

}
-(void)getaudiovideogalleryonpage
{
   // videoaudioarry
   // pagegalleryarry
    
    if([self.audiovideogaleryselececcmbstr isEqualToString:@"Audio (with image gallery) & Full Article"])
    {
        [self.audioscrollview setHidden:NO];
        [self.pageaudiovideogallerylbl2 setHidden:NO];
        [self.pageaudiovideohallerylbl1 setHidden:NO];
        [self.photoscrollview setHidden:NO];
        [self.gallerycustumview setHidden:NO];
        [self.audiocustumview setHidden:NO];
        self.pageaudiovideohallerylbl1.stringValue=@"Gallery";
        self.pageaudiovideogallerylbl2.stringValue=@"Audio";
        [self.pageaudiovideogallerylbl2 setHidden:NO];
        //get the data from audio and photos
        while ([[gallerycustumview subviews] count] > 0)
            [[[gallerycustumview subviews] lastObject] removeFromSuperview];
        
        while ([[audiocustumview subviews] count] > 0)
            [[[audiocustumview subviews] lastObject] removeFromSuperview];
         
        PFQuery *query = [PFQuery queryWithClassName:@"Audios"];
       [query whereKey:@"Audiocategorypageid" equalTo:self.pageselectedid];
       [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
               
                self.audiotagvaluearry=[[NSMutableArray alloc]init];
                NSLog(@"value of objects%lu",[objects count]);
                int j=0;
                int k = 100;
                audiocustumview.frame = CGRectMake(self.audiocustumview.frame.origin.x, self.audiocustumview.frame.origin.y, k, self.audiocustumview.frame.size.height);
                NSButton *AddaudioButton = [[NSButton alloc] initWithFrame:NSMakeRect(j, self.audiocustumview.frame.origin.y, k, self.audiocustumview.frame.size.height)];
                [AddaudioButton setTitle: @"Add Audio"];
                [AddaudioButton setButtonType:NSMomentaryLightButton]; 
                [AddaudioButton setBezelStyle:NSRoundedBezelStyle]; 
                [AddaudioButton setTarget:self];
                [AddaudioButton setAction:@selector(addaudiofrompage)];
                 [audiocustumview addSubview:AddaudioButton];
                
               for (int i = 0; i<[objects count]; i++)
                {
                    j = j+110;
                    k = k+110;
                    audiocustumview.frame = CGRectMake(self.audiocustumview.frame.origin.x, self.audiocustumview.frame.origin.y, k, self.audiocustumview.frame.size.height);
                    QTMovieView  *moviewview = [[QTMovieView alloc]initWithFrame:CGRectMake(j, 2, 100, 80)];
                    PFObject *getObject=[objects objectAtIndex:i];
                    PFFile *imageFile = [getObject objectForKey:@"AudioUrl"];
                   
                    NSData *audiodata = [imageFile getData];
                    QTDataReference *dataReference=nil;
                    dataReference =
                    [QTDataReference dataReferenceWithReferenceToData:audiodata
                                                                 name:@"Audio.wav"
                                                             MIMEType:nil];
                    self.movie = nil;
                    self.movie = [[QTMovie alloc] initWithDataReference:dataReference error:&error];
                    if (self.movie) {
                        [self.movie setAttribute:[NSNumber numberWithBool:YES] forKey:QTMovieEditableAttribute];
                        [self setMovie:self.movie];
                        [moviewview setMovie:self.movie];
                    }
                    
                    PFFile *posterimg=[getObject objectForKey:@"Audioposterimage"];
                    NSData *posterimgdata = [posterimg getData];
                    NSImageView  *posterimgView = [[NSImageView alloc]initWithFrame:CGRectMake(j,18, 100, 60)];
                    NSImage *img = [[NSImage alloc] initWithData:posterimgdata];
                    posterimgView.image =img;
                  
                    NSButton *delteaudioButton = [[NSButton alloc] initWithFrame:NSMakeRect(j,20, 100, 80)];
                    [delteaudioButton setTarget:self];
                    
                    int tagevalue=1200+i;
                    [delteaudioButton setTag:tagevalue];
                    [delteaudioButton setAction:@selector(deleteaudiofrompage:)];
                    [delteaudioButton setTransparent:YES];
                    
                   // [gallerycustumview addSubview:moviewview];
                    
                    
                    NSString *tagvaluestr = [[NSString alloc] initWithFormat:@"%d",tagevalue];
                    NSMutableDictionary *temptagdic=[[NSMutableDictionary alloc]init];
                    [temptagdic setObject:getObject forKey:@"PFObjectvalue"];
                    [temptagdic setObject:tagvaluestr forKey:@"tagvalue"];
                    [temptagdic setObject:@"Audios" forKey:@"Photoaudiovideoidentifire"];
                    [self.audiotagvaluearry addObject:temptagdic];
                    
                    [audiocustumview addSubview:moviewview];
                    [audiocustumview addSubview:posterimgView];
                    [audiocustumview addSubview:delteaudioButton];
                   
                    
                }
             }
            }];
        
        PFQuery *queryforgallery = [PFQuery queryWithClassName:@"Photos"];
        [queryforgallery whereKey:@"categorypageid" equalTo:self.pageselectedid];
        [queryforgallery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                int j=0;
                int k = 100;
                self.phototagvaluearry=[[NSMutableArray alloc]init];
                gallerycustumview.frame = CGRectMake(self.gallerycustumview.frame.origin.x, self.gallerycustumview.frame.origin.y, k, self.gallerycustumview.frame.size.height);
                NSButton *AddgalleryButton = [[NSButton alloc] initWithFrame:NSMakeRect(j, self.gallerycustumview.frame.origin.y, k, self.gallerycustumview.frame.size.height)];
                [AddgalleryButton setTitle: @"Add Photo"];
                [AddgalleryButton setButtonType:NSMomentaryLightButton];
                [AddgalleryButton setBezelStyle:NSRoundedBezelStyle];
                [AddgalleryButton setTarget:self];
                [AddgalleryButton setAction:@selector(addphotofrompage)];
                [gallerycustumview addSubview:AddgalleryButton];
                
                
                for (int i = 0; i<[objects count]; i++)
                {
                    j = j+110;
                    k = k+110;
                    gallerycustumview.frame = CGRectMake(self.gallerycustumview.frame.origin.x, self.gallerycustumview.frame.origin.y, k, self.gallerycustumview.frame.size.height);
                    NSImageView  *galleryimgView = [[NSImageView alloc]initWithFrame:CGRectMake(j, 2, 100, 80)];
                    
                    PFObject *getObject=[objects objectAtIndex:i];
                    PFFile *imageFile = [getObject objectForKey:@"PhotoImageFile"];
                    NSData *imgdata = [imageFile getData];
                    NSImage *img = [[NSImage alloc] initWithData:imgdata];
                    galleryimgView.image =img;
                    
                    NSButton *deltephotobButton = [[NSButton alloc] initWithFrame:NSMakeRect(j, 2, 100, 80)];
                    [deltephotobButton setTarget:self];
                    int tagevalue=1200+i;
                    [deltephotobButton setTag:tagevalue];
                    [deltephotobButton setAction:@selector(deletephotosfrompage:)];
                    [deltephotobButton setTransparent:YES];
                    NSString *tagvaluestr = [[NSString alloc] initWithFormat:@"%d",tagevalue];
                    NSMutableDictionary *temptagdic=[[NSMutableDictionary alloc]init];
                    [temptagdic setObject:getObject forKey:@"PFObjectvalue"];
                    [temptagdic setObject:tagvaluestr forKey:@"tagvalue"];
                    [temptagdic setObject:@"Photos" forKey:@"Photoaudiovideoidentifire"];
                    [self.phototagvaluearry addObject:temptagdic];
                    [gallerycustumview addSubview:deltephotobButton];
                    [gallerycustumview addSubview:galleryimgView];
                }
            }
        }];

    }
    if([self.audiovideogaleryselececcmbstr isEqualToString:@"Photo Gallery & Full Article"])
    {
        [self.audioscrollview setHidden:YES];
        [self.pageaudiovideogallerylbl2 setHidden:YES];
        [self.pageaudiovideohallerylbl1 setHidden:NO];
        [self.photoscrollview setHidden:NO];
        [self.gallerycustumview setHidden:NO];
        [self.audiocustumview setHidden:YES];
        self.pageaudiovideohallerylbl1.stringValue=@"Gallery";
        //[self.audioscrollview setHidden:YES];
    while ([[audiocustumview subviews] count] > 0)
            [[[audiocustumview subviews] lastObject] removeFromSuperview];
        
    while ([[gallerycustumview subviews] count] > 0)
        [[[gallerycustumview subviews] lastObject] removeFromSuperview];
        
     
        PFQuery *queryforgallery = [PFQuery queryWithClassName:@"Photos"];
        [queryforgallery whereKey:@"categorypageid" equalTo:self.pageselectedid];
        [queryforgallery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
               
                self.phototagvaluearry=[[NSMutableArray alloc]init];
                NSLog(@"value of objects%lu",[objects count]);
                NSLog(@"value of object %@",objects);
                int j=0;
                int k = 100;
              gallerycustumview.frame = CGRectMake(self.gallerycustumview.frame.origin.x, self.gallerycustumview.frame.origin.y, k, self.gallerycustumview.frame.size.height);
                NSButton *AddgalleryButton = [[NSButton alloc] initWithFrame:NSMakeRect(j, self.gallerycustumview.frame.origin.y, k, self.gallerycustumview.frame.size.height)];
                             
                [AddgalleryButton setTitle: @"Add Photo"];
                [AddgalleryButton setButtonType:NSMomentaryLightButton];
                [AddgalleryButton setBezelStyle:NSRoundedBezelStyle];
                [AddgalleryButton setTarget:self];
                [AddgalleryButton setAction:@selector(addphotofrompage)];
                [gallerycustumview addSubview:AddgalleryButton];
                
                
                
                for (int i = 0; i<[objects count]; i++)
                {
                    j = j+110;
                    k = k+110;
                    gallerycustumview.frame = CGRectMake(self.gallerycustumview.frame.origin.x, self.gallerycustumview.frame.origin.y, k, self.gallerycustumview.frame.size.height);
                  NSImageView  *galleryimgView = [[NSImageView alloc]initWithFrame:CGRectMake(j, 2, 100, 80)];
                    
                    PFObject *getObject=[objects objectAtIndex:i];
                    PFFile *imageFile = [getObject objectForKey:@"PhotoImageFile"];
                    NSData *imgdata = [imageFile getData];
                    NSImage *img = [[NSImage alloc] initWithData:imgdata];
                    galleryimgView.image =img;
                    
                   
                    
                    NSButton *deltephotobButton = [[NSButton alloc] initWithFrame:NSMakeRect(j, 2, 100, 80)];
                    [deltephotobButton setTarget:self];
                    
                    int tagevalue=1200+i;
                    [deltephotobButton setTag:tagevalue];
                    [deltephotobButton setAction:@selector(deletephotosfrompage:)];
                    [deltephotobButton setTransparent:YES];
                     [gallerycustumview addSubview:deltephotobButton];
                    [gallerycustumview addSubview:galleryimgView];
                    NSString *tagvaluestr = [[NSString alloc] initWithFormat:@"%d",tagevalue];
                    NSMutableDictionary *temptagdic=[[NSMutableDictionary alloc]init];
                    [temptagdic setObject:getObject forKey:@"PFObjectvalue"];
                    [temptagdic setObject:tagvaluestr forKey:@"tagvalue"];
                    [temptagdic setObject:@"Photos" forKey:@"Photoaudiovideoidentifire"];
                    [self.phototagvaluearry addObject:temptagdic];
                
                }
                
            }
        }];
        
    }
    if([self.audiovideogaleryselececcmbstr isEqualToString:@"Video & Full Article"])
    {
        //get the data from video
        while ([[audiocustumview subviews] count] > 0)
            [[[audiocustumview subviews] lastObject] removeFromSuperview];
        
        while ([[gallerycustumview subviews] count] > 0)
            [[[gallerycustumview subviews] lastObject] removeFromSuperview];
       // [self addvideofrompage];
        [self.audioscrollview setHidden:YES];
        self.pageaudiovideohallerylbl1.stringValue=@"Video";
        [self.audioscrollview setHidden:YES];
        [self.pageaudiovideogallerylbl2 setHidden:YES];
        [self.pageaudiovideohallerylbl1 setHidden:NO];
        [self.photoscrollview setHidden:NO];
        [self.gallerycustumview setHidden:NO];
        [self.audiocustumview setHidden:YES];
        [self.pageaudiovideogallerylbl2 setHidden:YES];
        
        
        
        
        PFQuery *query = [PFQuery queryWithClassName:@"Videos"];
        [query whereKey:@"Videocategorypageid" equalTo:self.pageselectedid];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                
                
                int j=0;
                int k = 100;
                self.videotagvaluearry=[[NSMutableArray alloc]init];
                gallerycustumview.frame = CGRectMake(self.gallerycustumview.frame.origin.x, self.gallerycustumview.frame.origin.y, k, self.gallerycustumview.frame.size.height);
                NSButton *AddvideoButton = [[NSButton alloc] initWithFrame:NSMakeRect(j, self.gallerycustumview.frame.origin.y, k, self.gallerycustumview.frame.size.height)];
                [AddvideoButton setTitle: @"Add Video"];
                [AddvideoButton setButtonType:NSMomentaryLightButton];
                [AddvideoButton setBezelStyle:NSRoundedBezelStyle];
                [AddvideoButton setTarget:self];
                [AddvideoButton setAction:@selector(addvideofrompage)];
                [gallerycustumview addSubview:AddvideoButton];
               
                
                for (int i = 0; i<[objects count]; i++)
                {
                    j = j+110;
                    k = k+110;
                    gallerycustumview.frame = CGRectMake(self.gallerycustumview.frame.origin.x, self.gallerycustumview.frame.origin.y, k, self.gallerycustumview.frame.size.height);
                    QTMovieView  *moviewview = [[QTMovieView alloc]initWithFrame:CGRectMake(j, 2, 100, 80)];
                    
                    PFObject *getObject=[objects objectAtIndex:i];
                    PFFile *imageFile = [getObject objectForKey:@"VideoUrl"];
                    NSData *videodata = [imageFile getData];
                    
                    self.movie = nil;
                    self.movie = [QTMovie movieWithData:videodata error:&error];
                    if (self.movie) {
                        [self.movie setAttribute:[NSNumber numberWithBool:YES] forKey:QTMovieEditableAttribute];
                        [self setMovie:self.movie];
                        [moviewview setMovie:self.movie];
                    }
                    
                    //NSImage *img = [[NSImage alloc] initWithData:imgdata];
                   // galleryimgView.image =img;
                    //galleryimgView.tag=201+i;
                    
                    NSButton *deltevideoButton = [[NSButton alloc] initWithFrame:NSMakeRect(j,20, 100, 80)];
                    [deltevideoButton setTarget:self];
                    
                    int tagevalue=1200+i;
                    [deltevideoButton setTag:tagevalue];
                    [deltevideoButton setAction:@selector(deletevideofrompage:)];
                    [deltevideoButton setTransparent:YES];
                    
                    [gallerycustumview addSubview:moviewview];
                    [gallerycustumview addSubview:deltevideoButton];
                    
                    NSString *tagvaluestr = [[NSString alloc] initWithFormat:@"%d",tagevalue];
                    NSMutableDictionary *temptagdic=[[NSMutableDictionary alloc]init];
                    [temptagdic setObject:getObject forKey:@"PFObjectvalue"];
                    [temptagdic setObject:tagvaluestr forKey:@"tagvalue"];
                    [temptagdic setObject:@"Videos" forKey:@"Photoaudiovideoidentifire"];
                    [self.videotagvaluearry addObject:temptagdic];
                   
                    
                }
            }
        }];
    }
    
    if([self.audiovideogaleryselececcmbstr isEqualToString:@"Single Photo & Full Article"])
    {
        
        while ([[audiocustumview subviews] count] > 0)
            [[[audiocustumview subviews] lastObject] removeFromSuperview];
        
        while ([[gallerycustumview subviews] count] > 0)
            [[[gallerycustumview subviews] lastObject] removeFromSuperview];
         [self.audioscrollview setHidden:YES];
         [self.pageaudiovideogallerylbl2 setHidden:YES];
         [self.pageaudiovideohallerylbl1 setHidden:YES];
         [self.photoscrollview setHidden:YES];
         [self.gallerycustumview setHidden:YES];
         [self.audiocustumview setHidden:YES];
         [self.pageaudiovideogallerylbl2 setHidden:YES];
    }
    //[self stopactivity];
}
//delete audio from page
-(void)deleteaudiofrompage:(id)sender
{
      NSButton *test =(NSButton*)sender;
    NSLog(@"tag value of delte ted audio is %ld",[test tag]);
     if([self.audiovideogaleryselececcmbstr isEqualToString:@"Audio (with image gallery) & Full Article"])
    {
        NSLog(@"photodeletagvalue array is %@ ",self.audiotagvaluearry);
        for (int i=0; i<[self.audiotagvaluearry count]; i++) {
            NSMutableDictionary *getobject=[self.audiotagvaluearry objectAtIndex:i];
            // int phototag=[[getobject objectForKey:@"tagvalue"] intValue];
            NSLog(@"deleted tag value is %@",[getobject objectForKey:@"tagvalue"]);
            if([[getobject objectForKey:@"tagvalue"] intValue]==[test tag])
            {
                self.alertidentifirestr=@"deleteaudioalertfrompage";
                NSMutableDictionary *deletvideoobject=[self.audiotagvaluearry objectAtIndex:i];
                PFObject *getObject=[deletvideoobject objectForKey:@"PFObjectvalue"];
                NSLog(@"value of get object is %@  object id is %@",getObject,getObject.objectId);
                self.audioselectedidstr = getObject.objectId;
                NSAlert *alert=[[NSAlert alloc ]init];
                [alert setMessageText:@"Are you sure you want to delete this Audio"];
                [alert addButtonWithTitle:@"Yes"];
                [alert addButtonWithTitle:@"No"];
                [alert beginSheetModalForWindow: _window modalDelegate: self
                                 didEndSelector: @selector(alertDidEnd:returnCode:contextInfo:)
                                    contextInfo: nil];
            }
            
        }
        
    }

}
-(void)deleteaudioactivityfrompage
{
    [loadingSpinner startAnimation:nil];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Audios"];
    PFObject *audiodelete = [query getObjectWithId:self.audioselectedidstr];
    NSLog(@"delete photos selected id is %@",self.audioselectedidstr
          );
    NSLog(@"delete data is %@",audiodelete);
    [audiodelete deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
     {
         if (!error) {
             [self getaudiovideogalleryonpage];
             NSAlert *alert = [[NSAlert alloc] init];
             [alert setAlertStyle:NSInformationalAlertStyle];
             [alert setMessageText:@"Audio has been deleted"];
             [alert beginSheetModalForWindow:_window
                               modalDelegate:self
                              didEndSelector:@selector(ok)
                                 contextInfo:nil];
             
         }
     }];
    [self stopactivity];

}


-(void)deletevideofrompage:(id)sender
{
    NSButton *test =(NSButton*)sender;
    NSLog(@"test%ld",[test tag]);
    if([self.audiovideogaleryselececcmbstr isEqualToString:@"Video & Full Article"])
    {
            NSLog(@"photodeletagvalue array is %@ ",self.videotagvaluearry);
            for (int i=0; i<[self.videotagvaluearry count]; i++) {
                NSMutableDictionary *getobject=[self.videotagvaluearry objectAtIndex:i];
                // int phototag=[[getobject objectForKey:@"tagvalue"] intValue];
                NSLog(@"deleted tag value is %@",[getobject objectForKey:@"tagvalue"]);
                if([[getobject objectForKey:@"tagvalue"] intValue]==[test tag])
                {
                    self.alertidentifirestr=@"deletevideoalertfrompage";
                    NSMutableDictionary *deletvideoobject=[self.videotagvaluearry objectAtIndex:i];
                    PFObject *getObject=[deletvideoobject objectForKey:@"PFObjectvalue"];
                    NSLog(@"value of get object is %@  object id is %@",getObject,getObject.objectId);
                    self.videoselectedid = getObject.objectId;
                    NSAlert *alert=[[NSAlert alloc ]init];
                    [alert setMessageText:@"Are you sure you want to delete this Video"];
                    [alert addButtonWithTitle:@"Yes"];
                    [alert addButtonWithTitle:@"No"];
                    [alert beginSheetModalForWindow: _window modalDelegate: self
                                     didEndSelector: @selector(alertDidEnd:returnCode:contextInfo:)
                                        contextInfo: nil];
                }
                
            }
     
        }
   
}

-(void)deletevideoactivityfrompage
{
    [loadingSpinner startAnimation:nil];
   
    PFQuery *query = [PFQuery queryWithClassName:@"Videos"];
    PFObject *photodelete = [query getObjectWithId:self.videoselectedid];
    NSLog(@"delete photos selected id is %@",self.videoselectedid);
    NSLog(@"delete data is %@",photodelete);
    [photodelete deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
     {
         if (!error) {
             [self getaudiovideogalleryonpage];
             NSAlert *alert = [[NSAlert alloc] init];
             [alert setAlertStyle:NSInformationalAlertStyle];
             [alert setMessageText:@"Video has been deleted"];
             [alert beginSheetModalForWindow:_window
                               modalDelegate:self
                              didEndSelector:@selector(ok)
                                 contextInfo:nil];
             
         }
     }];
     [self stopactivity];
}

-(void)deletephotosfrompage:(id)sender
{
    NSButton *test =(NSButton*)sender;
    NSLog(@"test%ld",[test tag]);
    if([self.audiovideogaleryselececcmbstr isEqualToString:@"Photo Gallery & Full Article"]||[self.audiovideogaleryselececcmbstr isEqualToString:@"Audio (with image gallery) & Full Article"])
    {
        NSLog(@"photodeletagvalue array is tag%@ ",self.phototagvaluearry);
        for (int i=0; i<[self.phototagvaluearry count]; i++) {
             NSMutableDictionary *getobject=[self.phototagvaluearry objectAtIndex:i];
           // int phototag=[[getobject objectForKey:@"tagvalue"] intValue];
            NSLog(@"deleted tag value is %@",[getobject objectForKey:@"tagvalue"]);
            if([[getobject objectForKey:@"tagvalue"] intValue]==[test tag])
            {
                self.alertidentifirestr=@"deletephotoalertfrompage";
                NSMutableDictionary *deletvideoobject=[self.phototagvaluearry objectAtIndex:i];
                PFObject *getObject=[deletvideoobject objectForKey:@"PFObjectvalue"];
                self.photoselectedid = getObject.objectId;
                NSAlert *alert=[[NSAlert alloc ]init];
                [alert setMessageText:@"Are you sure you want to delete this photo"];
                [alert addButtonWithTitle:@"Yes"];
                [alert addButtonWithTitle:@"No"];
                [alert beginSheetModalForWindow: _window modalDelegate: self
                                 didEndSelector: @selector(alertDidEnd:returnCode:contextInfo:)
                                    contextInfo: nil];
            }
            
        }
    }
}



//delte photos from page
-(void)deletephotoactivityfrompage
{
    [loadingSpinner startAnimation:nil];
       PFQuery *query = [PFQuery queryWithClassName:@"Photos"];
    PFObject *photodelete = [query getObjectWithId:self.photoselectedid];
    NSLog(@"delete photos selected id is %@",self.photoselectedid);
    NSLog(@"delete data is %@",photodelete);
    [photodelete deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
     {
         if (!error) {
             [self getaudiovideogalleryonpage];
             NSAlert *alert = [[NSAlert alloc] init];
             [alert setAlertStyle:NSInformationalAlertStyle];
             [alert setMessageText:@"Photo has been deleted"];
             [alert beginSheetModalForWindow:_window
                               modalDelegate:self
                              didEndSelector:@selector(ok)
                                 contextInfo:nil];
         }
     }];
    [self stopactivity];
}

-(void)addphotofrompage
{
    if([self.pageidentifirestr isEqualToString:@"fromlogin"])
    {    self.videoaudioidentifirescrrolstr=@"gotophotos";
        loadingSpinner = [[NSProgressIndicator alloc] init];
        [loadingSpinner setFrame:NSMakeRect(600,200, 50, 50)];
        [loadingSpinner setStyle:NSProgressIndicatorSpinningStyle];
        [self.currentsubview addSubview:loadingSpinner];
        [NSThread detachNewThreadSelector:@selector(savepageactivity) toTarget:self withObject:nil];
    }
    if([self.pageidentifirestr isEqualToString:@"fromupdate"])
        {
            [self Addphotos:nil];
        }
}

-(void)addvideofrompage
{
   if([self.pageidentifirestr isEqualToString:@"fromlogin"])
   {
       self.videoaudioidentifirescrrolstr=@"gotovideo";
       loadingSpinner = [[NSProgressIndicator alloc] init];
       [loadingSpinner setFrame:NSMakeRect(600,200, 50, 50)];
       [loadingSpinner setStyle:NSProgressIndicatorSpinningStyle];
       [self.currentsubview addSubview:loadingSpinner];
       [NSThread detachNewThreadSelector:@selector(savepageactivity) toTarget:self withObject:nil];
   }
    if([self.pageidentifirestr isEqualToString:@"fromupdate"])
    {
       // [[self.mainview animator]replaceSubview:self.currentsubview with:self.addvideoview];
        //self.currentsubview=self.addvideoview;
        [self Addvideo:nil];
    }

    
}
-(void)addaudiofrompage
{
    //=======
   if([self.pageidentifirestr isEqualToString:@"fromlogin"])
    {
        self.videoaudioidentifirescrrolstr=@"gotoaudio";
        loadingSpinner = [[NSProgressIndicator alloc] init];
        [loadingSpinner setFrame:NSMakeRect(600,200, 50, 50)];
        [loadingSpinner setStyle:NSProgressIndicatorSpinningStyle];
        [self.currentsubview addSubview:loadingSpinner];
        [NSThread detachNewThreadSelector:@selector(savepageactivity) toTarget:self withObject:nil];
    }
    if([self.pageidentifirestr isEqualToString:@"fromupdate"])
    {
        [self Addaudio:nil];
    }
}


//delete the audiovideo and photo from page

/*-(void)deletephotosfrompage
{
    //self.photoselectedid
   self.deletephotovideoaudiostr=@"deletephotofrompage";
    [self deletephotos:nil];
}
-(void)deleteaudiofrompage
{
    //self.audioselectedidstr
    self.deletephotovideoaudiostr=@"deleteaudiofrompage";
    [self deleteaudio:nil];
}
-(void)deletevideofrompage
{
    //self.videoselectedid
    self.deletephotovideoaudiostr=@"deletevideofrompage";
    [self Deletevideo:nil];
}*/




//page methode
-(IBAction)Showpage:(id)sender{
    [[self.mainview animator]replaceSubview:self.currentsubview with:self.showpageview];
    self.currentsubview=self.showpageview;
    [self showpagelist];
}
-(void)showpagelist
{
    tableviewidentifire=303;
    [self.showpagetableview setHidden:YES];
   
    PFQuery *query = [PFQuery queryWithClassName:@"Pages"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            self.showpagelistarry=[[NSMutableArray alloc]initWithArray:objects];
            NSLog(@"Successfully retrieved %ld scores. %@", objects.count,objects);
            if([self.showcategoryarry count]==0)
            {
                [self.showpagetableview setHidden:YES];
                [self.firstpagelbl setHidden:NO];
                [self.secondpagelbl setHidden:NO];
                self.firstpagelbl.stringValue=@"Your Categories Are Looking Empty.";
                self.secondpagelbl.stringValue=@"Get Started by creating your first category";
            }
            else
            {
                if([self.showpagelistarry count]==0)
                {
                    [self.firstpagelbl setHidden:NO];
                    [self.secondpagelbl setHidden:NO];
                    [self.showpagetableview setHidden:YES];
                    self.firstpagelbl.stringValue=@"Your Pages Are Looking Empty.";
                    self.secondpagelbl.stringValue=@"Get Started by creating your first page";
                    
                    
                }else{
                    [self.firstpagelbl setHidden:YES];
                    [self.secondpagelbl setHidden:YES];
                    [self.showpagetableview setHidden:NO];
                    [self.showpagetableview reloadData];
                    
                }
            }

            
        }else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Error from servere side"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
    }];
}

-(IBAction)Savepage:(id)sender
{ loadingSpinner = [[NSProgressIndicator alloc] init];
    [loadingSpinner setFrame:NSMakeRect(600,200, 50, 50)];
    [loadingSpinner setStyle:NSProgressIndicatorSpinningStyle];
    [self.currentsubview addSubview:loadingSpinner];
    [NSThread detachNewThreadSelector:@selector(savepageactivity) toTarget:self withObject:nil];
    self.videoaudioidentifirescrrolstr=@"gotoshowpage";
}
-(void)savepageactivity
{
    self.pagetittletxt.stringValue=[self.pagetittletxt.stringValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    self.pagesubtittle.stringValue=[self.pagesubtittle.stringValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    self.pagetextdescription.string=[self.pagetextdescription.string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    self.pagecategorycbox.stringValue=[self.pagecategorycbox.stringValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    self.shareurl.stringValue=[self.shareurl.stringValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    self.audiovideogallery.stringValue=[self.audiovideogallery.stringValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    [loadingSpinner startAnimation:nil];
    //self.productupdateidentifire=@"fromproductlogin";
    int pagevalue= [self chekonpage];
    switch (pagevalue)
    {
        case 1:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Fill Title"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 2:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Fill Subtitle"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 3:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Fill Text"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
			
            break;
        case 4:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Select Category"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 5:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Page already avilable please insert other page"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
            
        case 6:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Url is invalid please select a valid Url"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
            
        case 7:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please select page type"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 8:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please select header photo"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
            
        default:
        {
            NSImage *image=self.pageheaderphoto.image;
            NSData *imageData = [image TIFFRepresentation];
            NSBitmapImageRep* bitmap = [NSBitmapImageRep    imageRepWithData: imageData];
            NSData* newData = [bitmap representationUsingType: NSPNGFileType properties: nil];
            PFFile *imageFile = [PFFile fileWithName:@"image.png" data:newData];
            [imageFile save];
            PFObject *pageinsert = [PFObject objectWithClassName:@"Pages"];
            [pageinsert setObject:self.pagetittletxt.stringValue forKey:@"PageTitle"];
            [pageinsert setObject:self.pagetextdescription.string forKey:@"PageText"];
            [pageinsert setObject:self.pagesubtittle.stringValue forKey:@"Pagesubtitle"];
            [pageinsert setObject:imageFile forKey:@"PageImageFile"];
            [pageinsert setObject:self.categoryselectedid forKey:@"PagecategoryId"];
            [pageinsert setObject:self.pagetypeidstr forKey:@"PageType"];
            if([self.shareurlstr length]!=0)
            [pageinsert setObject:self.shareurlstr forKey:@"ShareUrl"];
            else
            [pageinsert setObject:@"N/A" forKey:@"ShareUrl"];
            [pageinsert save];
            self.pagetittletxt.stringValue=@"";
            self.pagetextdescription.string=@"";
            self.pagesubtittle.stringValue=@"";
            self.pageheaderphoto.image=nil;
            self.pagecategorycbox.stringValue=@"";
            self.shareurl.stringValue=@"";
            self.shareurl=nil;
            
            [self showpagelist];
            
            NSLog(@"value of videoaudio %@",self.videoaudioidentifirescrrolstr);
            if([self.videoaudioidentifirescrrolstr isEqualToString:@"gotophotos"])
            {
             [self Addphotos:nil];
            }
            if([self.videoaudioidentifirescrrolstr isEqualToString:@"gotovideo"])
            {
                [self Addvideo:nil];
            }
            if([self.videoaudioidentifirescrrolstr isEqualToString:@"gotoaudio"])
            {
                [self Addaudio:nil];
            }
            if([self.videoaudioidentifirescrrolstr isEqualToString:@"gotoshowpage"])
            {
            [[self.mainview animator]replaceSubview:self.currentsubview with:self.showpageview];
            currentsubview=self.showpageview;
            }
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"New page has been added"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
            break;
        }
    }
    [self stopactivity];
}
-(int)chekonpage
{
    if([self.pagetittletxt.stringValue length]==0)
    {
        return 1;
    }
    if([self.pagesubtittle.stringValue length]==0)
    {
        return 2;
    }
    if([self.pagetextdescription.string length]==0)
    {
        return 3;
    }
    if([self.pagecategorycbox.stringValue length]==0)
    {
        return 4;
    }
    if([self.audiovideogallery.stringValue length]==0)
    {
        return 7;
    }
    if(self.pageheaderphoto.image==nil)
    {
        return 8;
    }
    if([self.shareurl.stringValue length]!=0)
    {
        NSURL *candidateURL = [NSURL URLWithString:self.shareurl.stringValue];
       if(![self.shareurl.stringValue isEqualToString:@"N/A"])
       {
        if (candidateURL && candidateURL.scheme && candidateURL.host) {
            
            NSURL *candidateURL = [NSURL URLWithString:self.shareurl.stringValue];
            if (candidateURL && candidateURL.scheme && candidateURL.host) {
                NSString *url = self.shareurl.stringValue;
                
                NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5.0];
                NSHTTPURLResponse* response = nil;
                NSError* error = nil;
                [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
                NSLog(@"statusCode = %ld", [response statusCode]);
                
                if ([response statusCode] == 404)
                    return 6;
                else
                    self.shareurlstr=self.shareurl.stringValue;
            }
        }
        else{
            return 6;
        }
       }
    }
        PFQuery *query = [PFQuery queryWithClassName:@"Pages"];
        [query whereKey:@"PageTitle" equalTo:self.pagetittletxt.stringValue];
        NSArray* findproductArray = [query findObjects];
    //from login
        if([self.pageidentifirestr isEqualToString:@"fromlogin"])
        {
            if([findproductArray count]!=0)
            {
                return 5;
            }
        }
                   //for updation
            if([self.pageidentifirestr isEqualToString:@"fromupdate"])
            {
                if([findproductArray count]!=0)
                {
                    PFObject *bigObject=[findproductArray objectAtIndex:0];
                    NSString *objectId = bigObject.objectId;
                    
                    if(![self.pageselectedid isEqualToString:objectId])
                    {
                        return 5;
                    }
                  
                }
                
            }
       
    return 0;
}
-(int)checkpageavailabilityinothertable
{
    PFQuery *query1 = [PFQuery queryWithClassName:@"Photos"];
    [query1 whereKey:@"categorypageid" equalTo:self.pageselectedid];
    NSArray* findArray1 = [query1 findObjects];
    if([findArray1 count]!=0)
    {
        return 1;
    }
    else
    { PFQuery *query2 = [PFQuery queryWithClassName:@"Videos"];
        [query2 whereKey:@"Videocategorypageid" equalTo:self.pageselectedid];
        NSArray* findArray2 = [query2 findObjects];
        if([findArray2 count]!=0)
        {
            return 1;
        }
        else{
            PFQuery *query3 = [PFQuery queryWithClassName:@"Audios"];
            [query3 whereKey:@"Audiocategorypageid" equalTo:self.pageselectedid];
            NSArray* findArray3= [query3 findObjects];
            if([findArray3 count]!=0)
            {
                return 1;
            }
            else
                return 0;
            
            return 0;
        }
        
    }
    return 0;
}
-(void)deletepageactivity
{
    int checkpage=[self checkpageavailabilityinothertable];
    if(!checkpage)
    {
    [loadingSpinner startAnimation:nil];
    PFQuery *query = [PFQuery queryWithClassName:@"Pages"];
    PFObject *pagedelete = [query getObjectWithId:self.pageselectedid];
    NSLog(@"delete data is %@",pagedelete);
    [pagedelete deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
     {
         if (!error) {
             // The gameScore saved successfully.
             NSLog(@"delete susscessfully");
             [self showpagelist];
             [[self.mainview animator]replaceSubview:self.currentsubview with:self.showpageview];
             currentsubview=self.showpageview;
             self.pagetittletxt.stringValue=@"";
             self.pagetextdescription.string=@"";
             self.pagesubtittle.stringValue=@"";
             self.pageheaderphoto.image=nil;
             NSAlert *alert = [[NSAlert alloc] init];
             [alert setAlertStyle:NSInformationalAlertStyle];
             [alert setMessageText:@"Page has been deleted"];
             [alert beginSheetModalForWindow:_window
                               modalDelegate:self
                              didEndSelector:@selector(ok)
                                 contextInfo:nil];
         } else {
             // There was an error saving the gameScore.
             NSAlert *alert = [[NSAlert alloc] init];
             [alert setAlertStyle:NSInformationalAlertStyle];
             [alert setMessageText:@"Error"];
             [alert beginSheetModalForWindow:_window
                               modalDelegate:self
                              didEndSelector:@selector(ok)
                                 contextInfo:nil];
         }
     }
     ];
    }
    else{
        NSAlert *alert = [[NSAlert alloc] init];
        [alert setAlertStyle:NSInformationalAlertStyle];
        [alert setMessageText:@"This Page can not deleted because it is use in other table"];
        [alert beginSheetModalForWindow:_window
                          modalDelegate:self
                         didEndSelector:@selector(ok)
                            contextInfo:nil];
    }
    [self stopactivity];
}
-(IBAction)deletepage:(id)sender
{
    self.alertidentifirestr=@"deletepagealert";
    NSAlert *alert=[[NSAlert alloc ]init];
    [alert setMessageText:@"Are you sure you want to delete this page"];
    [alert addButtonWithTitle:@"Yes"];
    [alert addButtonWithTitle:@"No"];
    [alert beginSheetModalForWindow: _window modalDelegate: self
                     didEndSelector: @selector(alertDidEnd:returnCode:contextInfo:)
                        contextInfo: nil];
}
-(IBAction)Updatepage:(id)sender
{
    
    loadingSpinner = [[NSProgressIndicator alloc] init];
    [loadingSpinner setFrame:NSMakeRect(485,200, 50, 50)];
    [loadingSpinner setStyle:NSProgressIndicatorSpinningStyle];
    [self.currentsubview addSubview:loadingSpinner];
    [NSThread detachNewThreadSelector:@selector(updatepageactivity) toTarget:self withObject:nil];
}
-(void)updatepageactivity
{    self.pagetittletxt.stringValue=[self.pagetittletxt.stringValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    self.pagesubtittle.stringValue=[self.pagesubtittle.stringValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    self.pagetextdescription.string=[self.pagetextdescription.string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    self.pagecategorycbox.stringValue=[self.pagecategorycbox.stringValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    self.shareurl.stringValue=[self.shareurl.stringValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    [loadingSpinner startAnimation:nil];
    self.pageidentifirestr=@"fromupdate";
    int pagevalue=[self chekonpage];
    switch (pagevalue)
    {
        case 1:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Fill Title"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 2:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Fill Subtitle"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
        break;
        case 3:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Fill Text"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
			
            break;
        case 4:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Select Category"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 5:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Page already avilable please insert other page"];
            
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 6:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Url is invalid please select a valid Url"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 7:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please select page type"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 8:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please select header photo"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        
            

        default:
        {
            PFQuery *query = [PFQuery queryWithClassName:@"Pages"];
            PFObject *pageupdate = [query getObjectWithId:self.pageselectedid];
            NSImage *image=self.pageheaderphoto.image;
            NSData *imageData = [image TIFFRepresentation];
            NSBitmapImageRep* bitmap = [NSBitmapImageRep imageRepWithData: imageData];
            NSData* newData = [bitmap representationUsingType: NSPNGFileType properties: nil];
            PFFile *imageFile = [PFFile fileWithName:@"image.png" data:newData];
            [imageFile save];
            [pageupdate setObject:self.pagetittletxt.stringValue forKey:@"PageTitle"];
            [pageupdate setObject:self.pagetextdescription.string forKey:@"PageText"];
            [pageupdate setObject:self.pagesubtittle.stringValue forKey:@"Pagesubtitle"];
            
            if([self.shareurlstr length]!=0)
                [pageupdate setObject:self.shareurlstr forKey:@"ShareUrl"];
            else
                [pageupdate setObject:@"N/A" forKey:@"ShareUrl"];
                     
            [pageupdate setObject:imageFile forKey:@"PageImageFile"];
            [pageupdate setObject:self.pagetypeidstr forKey:@"PageType"];
            [pageupdate setObject:self.categoryselectedid forKey:@"PagecategoryId"];
            [pageupdate saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (!error) {
                  
                    [self showpagelist];
                    [[self.mainview animator]replaceSubview:self.currentsubview with:self.showpageview];
                    currentsubview=self.showpageview;
                    self.pagetittletxt.stringValue=@"";
                    self.pagetextdescription.string=@"";
                    self.pagesubtittle.stringValue=@"";
                    self.pageheaderphoto.image=nil;
                    self.pagecategorycbox.stringValue=@"";
                    NSAlert *alert = [[NSAlert alloc] init];
                    [alert setAlertStyle:NSInformationalAlertStyle];
                    [alert setMessageText:@"Page update Succesfull"];
                    [alert beginSheetModalForWindow:_window
                                      modalDelegate:self
                     
                                     didEndSelector:@selector(ok)
                                        contextInfo:nil];
                } else {
                    // There was an error saving the gameScore.
                    NSLog(@"Error during update data");
                    NSAlert *alert = [[NSAlert alloc] init];
                    [alert setAlertStyle:NSInformationalAlertStyle];
                    [alert setMessageText:@"Error during update data"];
                  
                    
                    [alert beginSheetModalForWindow:_window
                                      modalDelegate:self
                     
                                     didEndSelector:@selector(ok)
                                        contextInfo:nil];
                }
            }];
            
        }
            break;
    }
    [self stopactivity];
  }
-(IBAction)addpage:(id)sender
{
    if([self.showcategoryarry count]!=0)
    {
       [self.pagedeletebtn setHidden:YES];
       [self.pageupdatebtn setHidden:YES];
       [self.pagesavebtne setHidden:NO];
       [[self.mainview animator]replaceSubview:self.currentsubview with:self.addpagesview];
        currentsubview=self.addpagesview;
        self.pagetittletxt.stringValue=@"";
        self.pagesubtittle.stringValue=@"";
        self.pagetextdescription.string=@"";
        self.pageheaderphoto.image=nil;
        self.pagecategorycbox.stringValue=@"";
        self.shareurl.stringValue=@"";
        self.shareurlstr=nil;
        self.pageidentifirestr=@"fromlogin";
        [self.audioscrollview setHidden:YES];
        self.audiovideogallery.stringValue=@"";
        [self.pageaudiovideogallerylbl2 setHidden:YES];
        [self.pageaudiovideohallerylbl1 setHidden:YES];
        [self.photoscrollview setHidden:YES];
        [self.gallerycustumview setHidden:YES];
        [self.audiocustumview setHidden:YES];
        [self recallshowpagetype];
    }
    else{
        
        NSAlert *alert = [[NSAlert alloc] init];
        [alert setAlertStyle:NSInformationalAlertStyle];
        [alert setMessageText:@"Need to add atleast one category"];
        //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
        [alert beginSheetModalForWindow:_window
                          modalDelegate:self
                         didEndSelector:@selector(ok)
                            contextInfo:nil];
    }

}

//for photos
-(void)Showphotolist
{
     [self.showphototableview setHidden:YES];
    PFQuery *query = [PFQuery queryWithClassName:@"Photos"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            self.showphotolistarry=[[NSMutableArray alloc]initWithArray:objects];
            NSLog(@"Successfully retrieved %ld scores. %@", objects.count,objects);
           
            if([self.showcategoryarry count]==0)
            {
                [self.showphototableview setHidden:YES];
                [self.firstphotolbl setHidden:NO];
                [self.secondphotolbl setHidden:NO];
                self.firstphotolbl.stringValue=@"Your Categories Are Looking Empty.";
                self.secondphotolbl.stringValue=@"Get Started by creating your first category";
            }
            else
            {
                if([self.showphotolistarry count]==0)
                {
                    [self.firstphotolbl setHidden:NO];
                    [self.secondphotolbl setHidden:NO];
                    [self.showphototableview setHidden:YES];
                    self.firstphotolbl.stringValue=@"Your Photos Are Looking Empty.";
                    self.secondphotolbl.stringValue=@"Get Started by creating your first photo";
                    
                    
                }else{
                    [self.firstphotolbl setHidden:YES];
                    [self.secondphotolbl setHidden:YES];
                    [self.showphototableview setHidden:NO];
                    [self.showphototableview reloadData];
                    
                }
            }
        
        }else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Error from servere side"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
    }];
    
}

//for video

-(IBAction)Showphotos:(id)sender{
    [[self.mainview animator]replaceSubview:self.currentsubview with:self.showphotoview];
    self.currentsubview=self.showphotoview;
    [self Showphotolist];
}
-(void)recallshowpage
{
    PFQuery *query = [PFQuery queryWithClassName:@"Pages"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            self.showpagelistarry=[[NSMutableArray alloc]initWithArray:objects];
            
        }else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];

}-(void)recallshowpagetype
{
    PFQuery *query = [PFQuery queryWithClassName:@"PagesType"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            self.audiovideocmbarry=[[NSMutableArray alloc]initWithArray:objects];
            
        }else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}
-(IBAction)Addphotos:(id)sender{
     self.photocomboboxarry=[[NSMutableArray alloc]initWithArray:self.showcategoryarry];
    self.photoradiobtnidentifirestr=@"Category";
    [self recallshowpage];
    self.phottittle.stringValue=@"";
    self.photoimage.image=nil;
    self.photoscombobox.stringValue=@"";
    [self.photoradiobutton selectCellWithTag:601];
    if([self.showcategoryarry count]!=0||[self.showpagelistarry count]!=0)
    {
        [self.photoradiobutton selectCellWithTag:601];
    [[self.mainview animator]replaceSubview:self.currentsubview with:self.addphotoview];
    [self.photoupdatebtn setHidden:YES];
    [self.photodeletebtn setHidden:YES];
    [self.photosavebtn setHidden:NO];
    currentsubview=self.addphotoview;
    
    }
    else{
        NSAlert *alert = [[NSAlert alloc] init];
        [alert setAlertStyle:NSInformationalAlertStyle];
        [alert setMessageText:@"First you need to add atleast one Category or one Page"];
        [alert beginSheetModalForWindow:_window
                          modalDelegate:self
         
                         didEndSelector:@selector(ok)
                            contextInfo:nil];
    }
}
-(int)checkonphoto
{
    NSLog(@"value of image is %@",self.photoimage.image);
    if([self.phottittle.stringValue length]==0)
    {
        return 1;
    }
    if([self.photoscombobox.stringValue length]==0)
    {
        return 2;
    }
    
    if(self.photoimage.image==nil)
    {
        return 3;
    }
    else{
        PFQuery *query = [PFQuery queryWithClassName:@"Photos"];
        [query whereKey:@"PhotoTitle" equalTo:self.phottittle.stringValue];
        NSArray* findproductArray = [query findObjects];
        if([self.photoidentifirestr isEqualToString:@"fromphotologin"])
        {
            if([findproductArray count]!=0)
            {
                return 4;
            }
            else
            {
                return 0;
            }
        }
        if([self.photoidentifirestr isEqualToString:@"fromphotoupdate"])
        {
            if([findproductArray count]!=0)
             {
                PFObject *bigObject=[findproductArray objectAtIndex:0];
                NSString *objectId = bigObject.objectId;
                 if(![self.photoselectedid isEqualToString:objectId])
                        {
                            return 4;
                        }
                        else
                            return 0;
                }
              else
                {
                    return 0;
                }
            }
            
        }
    return 0;
}
-(void)savephotoactivity
{
    self.phottittle.stringValue=[self.phottittle.stringValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
      
    self.photoscombobox.stringValue=[self.photoscombobox.stringValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    
    
    [loadingSpinner startAnimation:nil];
   self.photoidentifirestr=@"fromphotologin";
    int productvalue=[self checkonphoto];
    switch (productvalue)
    {
        case 1:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Fill Title"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 2:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please select category or pages"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 3:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please select photo"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
           break;
        case 4:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Image Title already available please chose other title"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
            
        default:
        {
            NSImage *image=self.photoimage.image;
            NSData *imageData = [image TIFFRepresentation];
            NSBitmapImageRep* bitmap = [NSBitmapImageRep imageRepWithData: imageData];
            NSData* newData = [bitmap representationUsingType: NSPNGFileType properties: nil];
            if([newData length]==0){
                    NSAlert *alert = [[NSAlert alloc] init];
                    [alert setAlertStyle:NSInformationalAlertStyle];
                    [alert setMessageText:@"Please remove space between photo name!"];
                    [alert beginSheetModalForWindow:_window
                                      modalDelegate:self
                                     didEndSelector:@selector(ok)
                                        contextInfo:nil];
               }else {
                if([newData length]<10485760)
                {
            PFFile *imageFile = [PFFile fileWithName:@"image.png" data:newData];
            [imageFile save];
            PFObject *photoinsert = [PFObject objectWithClassName:@"Photos"];
            [photoinsert setObject:self.phottittle.stringValue forKey:@"PhotoTitle"];
            [photoinsert setObject:imageFile forKey:@"PhotoImageFile"];
            [photoinsert setObject:self.photoradiobtnidentifirestr forKey:@"comboboxtype"];
            [photoinsert setObject:self.photocomboselectedid forKey:@"categorypageid"];
           
            [photoinsert save];
            self.phottittle.stringValue=@"";
            self.photoimage.image=nil;
            self.photoscombobox.stringValue=@"";
            
            [self Showphotolist];
            [[self.mainview animator]replaceSubview:self.currentsubview with:self.showphotoview];
            currentsubview=self.showphotoview;
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"New photos has been added"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
            break;
        }
               }}}
    [self stopactivity];

}
-(IBAction)savephotos:(id)Sender{
    loadingSpinner = [[NSProgressIndicator alloc] init];
    [loadingSpinner setFrame:NSMakeRect(485,200, 50, 50)];
    [loadingSpinner setStyle:NSProgressIndicatorSpinningStyle];
    [self.currentsubview addSubview:loadingSpinner];
    [NSThread detachNewThreadSelector:@selector(savephotoactivity) toTarget:self withObject:nil];
    
}
-(void)deletephotoactivity
{
    [loadingSpinner startAnimation:nil];
    PFQuery *query = [PFQuery queryWithClassName:@"Photos"];
    PFObject *photodelete = [query getObjectWithId:self.photoselectedid];
    NSLog(@"delete data is %@",photodelete);
    [photodelete deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
     {
         if (!error) {
             // The gameScore saved successfully.
             [self Showphotolist];
            
             if([self.deletephotovideoaudiostr isEqualToString:@"deletephotofrompage"])
                 {
                     [[self.mainview animator]replaceSubview:self.currentsubview with:self.addpagesview];
                     currentsubview=self.addpagesview;
                 }
                 else
                 {
             [[self.mainview animator]replaceSubview:self.currentsubview with:self.showphotoview];
             currentsubview=self.showphotoview;
                 }
             self.phottittle.stringValue=@"";
             self.photoimage.image=nil;
             NSAlert *alert = [[NSAlert alloc] init];
             [alert setAlertStyle:NSInformationalAlertStyle];
             [alert setMessageText:@"Photo has been deleted"];
             [alert beginSheetModalForWindow:_window
                               modalDelegate:self
                              didEndSelector:@selector(ok)
                                 contextInfo:nil];
         } else {
             // There was an error saving the gameScore.
             NSAlert *alert = [[NSAlert alloc] init];
             [alert setAlertStyle:NSInformationalAlertStyle];
             [alert setMessageText:@"Error"];
             [alert beginSheetModalForWindow:_window
                               modalDelegate:self
                              didEndSelector:@selector(ok)
                                 contextInfo:nil];
         }
     }
     ];
    [self stopactivity];
}

-(IBAction)deletephotos:(id)sender{
    self.alertidentifirestr=@"deletephotoalert";
    NSAlert *alert=[[NSAlert alloc ]init];
    [alert setMessageText:@"Are you sure you want to delete this photo"];
    [alert addButtonWithTitle:@"Yes"];
    [alert addButtonWithTitle:@"No"];
    [alert beginSheetModalForWindow: _window modalDelegate: self
                     didEndSelector: @selector(alertDidEnd:returnCode:contextInfo:)
                        contextInfo: nil];
}
-(void)updatephotoactivity
{
    self.phottittle.stringValue=[self.phottittle.stringValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    self.photoscombobox.stringValue=[self.photoscombobox.stringValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    [loadingSpinner startAnimation:nil];
    self.photoidentifirestr=@"fromphotoupdate";
    int photovalue=[self checkonphoto];
    switch (photovalue)
    {
        case 1:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Fill Title"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 2:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Selcet category or pages"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
          
        break;
        case 3:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please select Photo"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 4:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Image Title already available please chose other title"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        default:
        {
            PFQuery *query = [PFQuery queryWithClassName:@"Photos"];
            PFObject *photoupdate = [query getObjectWithId:self.photoselectedid];
            NSImage *image=self.photoimage.image;
            NSData *imageData = [image TIFFRepresentation];
            NSBitmapImageRep* bitmap = [NSBitmapImageRep imageRepWithData: imageData];
            NSData* newData = [bitmap representationUsingType: NSPNGFileType properties: nil];
            
            if([newData length]==0){
                NSAlert *alert = [[NSAlert alloc] init];
                [alert setAlertStyle:NSInformationalAlertStyle];
                [alert setMessageText:@"Please remove space between photo name!"];
                [alert beginSheetModalForWindow:_window
                                  modalDelegate:self
                                 didEndSelector:@selector(ok)
                                    contextInfo:nil];
            }else {
                if([newData length]<10485760)
                {

            PFFile *imageFile = [PFFile fileWithName:@"image.png" data:newData];
            [imageFile save];
            [photoupdate setObject:self.phottittle.stringValue forKey:@"PhotoTitle"];
            [photoupdate setObject:imageFile forKey:@"PhotoImageFile"];
            [photoupdate setObject:self.photoradiobtnidentifirestr forKey:@"comboboxtype"];
            [photoupdate setObject:self.photocomboselectedid forKey:@"categorypageid"];
            NSLog(@"value of product update is %@",photoupdate);
            [photoupdate saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
                if (!error) {
                    NSLog(@"Update succesfully");
                    [self Showphotolist];
                    [[self.mainview animator]replaceSubview:self.currentsubview with:self.showphotoview];
                    currentsubview=self.showphotoview;
                    self.phottittle.stringValue=@"";
                    self.photoimage.image=nil;
                    self.photoscombobox.stringValue=@"";
                    NSAlert *alert = [[NSAlert alloc] init];
                    [alert setAlertStyle:NSInformationalAlertStyle];
                    [alert setMessageText:@"Photo update Succesfully"];
                    [alert beginSheetModalForWindow:_window
                                      modalDelegate:self
                     
                                     didEndSelector:@selector(ok)
                                        contextInfo:nil];
                } else {
                    // There was an error saving the gameScore.
                    NSAlert *alert = [[NSAlert alloc] init];
                    [alert setAlertStyle:NSInformationalAlertStyle];
                    [alert setMessageText:@"Error during update data"];
                    [alert beginSheetModalForWindow:_window
                                      modalDelegate:self
                                     didEndSelector:@selector(ok)
                                        contextInfo:nil];
                }
            }];
            
        }
            break;
            }}}
    [self stopactivity];

    
}
-(IBAction)updatephotos:(id)sender{
    loadingSpinner = [[NSProgressIndicator alloc] init];
    [loadingSpinner setFrame:NSMakeRect(485,200, 50, 50)];
    [loadingSpinner setStyle:NSProgressIndicatorSpinningStyle];
    [self.currentsubview addSubview:loadingSpinner];
    [NSThread detachNewThreadSelector:@selector(updatephotoactivity) toTarget:self withObject:nil];
    
}
-(IBAction)photoradiobtn:(NSMatrix*)sender
{
    NSInteger tag = [[sender selectedCell] tag];
    NSLog(@"value of radio button is %ld", tag);
   self.photoscombobox.stringValue=@"";
    if(tag==601)
    {
        self.photocomboboxarry=[[NSMutableArray alloc]initWithArray:self.showcategoryarry];
        self.photoradiobtnidentifirestr=@"Category";
        if([self.photocomboboxarry count]==0)
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"At this time no any category add"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
    }
    if(tag==602)
    {
        
        self.photocomboboxarry=[[NSMutableArray alloc]initWithArray:self.showpagelistarry];
    self.photoradiobtnidentifirestr=@"Pages";
        if([self.photocomboboxarry count]==0)
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"No Pages Exist. Please add Page first"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
    }
    NSLog(@"value of array is %@",self.photocomboboxarry);
    NSLog(@"value of array is %@",self.showpagelistarry);
    
    
}

//videos action
- (BOOL)readFromURL:(NSURL *)absoluteURL ofType:(NSString *)typeName error:(NSError **)outError
{
    QTMovie *newMovie = [QTMovie movieWithURL:absoluteURL error:outError];
    if (newMovie) {
        [newMovie setAttribute:[NSNumber numberWithBool:YES] forKey:QTMovieEditableAttribute];
        
        [self setMovie:newMovie];
    }
    
    return (newMovie != nil);
}


-(IBAction)Addvideo:(id)sender{
       
    self.photocomboboxarry=[[NSMutableArray alloc]initWithArray:self.showcategoryarry];
   self.videoradiobtnstr=@"Category";
    [self recallshowpage];
    self.videotitle.stringValue=@"";
    self.movie=nil;
    self.videoposterimgview.image=nil;
    self.sharevideourlstr=@"";
    self.sharevideourl.stringValue=@"";
    [self.mMovieView setMovie:self.movie];
    self.photoscombobox.stringValue=@"";
    self.videocombobox.stringValue=@"";
    if([self.showcategoryarry count]!=0||[self.showpagelistarry count]!=0)
    {
        [self.videoradio selectCellWithTag:603];
        [[self.mainview animator]replaceSubview:self.currentsubview with:self.addvideoview];
        [self.updatevideobtn setHidden:YES];
        [self.deletevideobtn setHidden:YES];
        [self.savevideobtn setHidden:NO];
        currentsubview=self.addvideoview;
    }
    else{
        NSAlert *alert = [[NSAlert alloc] init];
        [alert setAlertStyle:NSInformationalAlertStyle];
        [alert setMessageText:@"First you need to add atleast one Category or one Page"];
        [alert beginSheetModalForWindow:_window
                          modalDelegate:self
         
                         didEndSelector:@selector(ok)
                            contextInfo:nil];
    }

}
-(IBAction)chagevideo:(id)sender
{
    NSArray* fileTypes = [[NSArray alloc] initWithObjects:@"mov", @"Mov", nil];
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setCanChooseFiles:YES];
    [panel setCanChooseDirectories:NO];
    [panel setAllowsMultipleSelection:NO]; // yes if more than one dir is allowed
    [panel setAllowedFileTypes:fileTypes];
    NSInteger clicked = [panel runModal];
    if (clicked == NSFileHandlingPanelOKButton) {
        for (NSURL *url in [panel URLs]) {
            NSLog(@"value of url is %@",url);
            self.videourlstr=[url absoluteString];
           // NSData* data = [self.videourlstr dataUsingEncoding:NSUTF8StringEncoding];
            self.movie = nil;
            NSError *error;
            self.movie = [QTMovie movieWithURL:url error:&error];
            //self.movie = [QTMovie movieWithData:data error:&error];
            if (self.movie) {
                [self.movie setAttribute:[NSNumber numberWithBool:YES] forKey:QTMovieEditableAttribute];
                [self setMovie:self.movie];
                [mMovieView setMovie:self.movie];
                NSLog(@"inside movi alue is %@",self.movie);
                self.videoposterimgview.image = [self.movie posterImage];
            }
        }
    }
    
    
}
-(int)checkonvideo
{
    if([self.videotitle.stringValue length]==0)
    {
        return 1;
    }
    if([self.videocombobox.stringValue length]==0)
    {
        return 2;
    }
    if([self.videourlstr length]==0)
    {
        return 3;
    }
    if([self.sharevideourl.stringValue length]!=0)
    {
        NSLog(@"string bvalue is %@",self.sharevideourl.stringValue);
        if(![self.sharevideourl.stringValue isEqualToString:@"N/A"])
        {
        NSURL *candidateURL = [NSURL URLWithString:self.sharevideourl.stringValue];
        if (candidateURL && candidateURL.scheme && candidateURL.host) {
            NSString *url = self.sharevideourl.stringValue;
            
            NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5.0];
            NSHTTPURLResponse* response = nil;
            NSError* error = nil;
            [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
            NSLog(@"statusCode = %ld", [response statusCode]);
            
            if ([response statusCode] == 404)
                return 5;
            else
                self.sharevideourlstr=self.sharevideourl.stringValue;
        }
              else{
             return 5;
        }
        }
    }
        PFQuery *query = [PFQuery queryWithClassName:@"Videos"];
        [query whereKey:@"VideoTitle" equalTo:self.videotitle.stringValue];
        NSArray* findproductArray = [query findObjects];
        if([self.videologinupdateidentifirestr isEqualToString:@"fromvideologin"])
        {
            if([findproductArray count]!=0)
            {
                return 4;
            }
        }
        if([self.videologinupdateidentifirestr isEqualToString:@"fromvideoupdate"])
        {
               if([findproductArray count]!=0)
               {
                   PFObject *bigObject=[findproductArray objectAtIndex:0];
                   NSString *objectId = bigObject.objectId;
                   if(![self.videoselectedid isEqualToString:objectId])
                   {
                       return 4;
                   }
                  
               }
        }
        
   
   
    return 0;
}
-(void)savevideoactivity
{
    self.videotitle.stringValue=[self.videotitle.stringValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    self.videocombobox.stringValue=[self.videocombobox.stringValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];

    [loadingSpinner startAnimation:nil];
    self.videologinupdateidentifirestr=@"fromvideologin";
    int videovalue= [self checkonvideo];
    switch (videovalue)
    {
        case 1:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Fill Title"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 2:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Select category or page item from dropdown list"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        
        case 3:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please select video"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 4:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Video title already avilable please give other title."];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 5:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Url is invalid please select a valid Url"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        default:
        {
            //save wali
            NSURL *url = [NSURL URLWithString:[self.videourlstr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            NSData *videoData = [NSData dataWithContentsOfURL:url];
            NSLog(@"%lu",[videoData length]);
            if([videoData length]==0){
                NSAlert *alert = [[NSAlert alloc] init];
                [alert setAlertStyle:NSInformationalAlertStyle];
                [alert setMessageText:@"Please remove space between video name!"];
                [alert beginSheetModalForWindow:_window
                                  modalDelegate:self
                                 didEndSelector:@selector(ok)
                                    contextInfo:nil];
            }else{
            if([videoData length]<10485760)
            {
                PFFile *imageFile = [PFFile fileWithName:@"Video.mov" data:videoData];
                [imageFile save];
                NSImage *image=self.videoposterimgview.image;
                NSData *imageData = [image TIFFRepresentation];
                NSBitmapImageRep* bitmap = [NSBitmapImageRep imageRepWithData: imageData];
                NSData* newData = [bitmap representationUsingType: NSPNGFileType properties: nil];
                PFFile *imageFile1 = [PFFile fileWithName:@"image.png" data:newData];
                [imageFile1 save];
                
                PFObject *Videoinsert = [PFObject objectWithClassName:@"Videos"];
                [Videoinsert setObject:self.videotitle.stringValue forKey:@"VideoTitle"];
                [Videoinsert setObject:imageFile forKey:@"VideoUrl"];
                [Videoinsert setObject:self.videoradiobtnstr forKey:@"Videocomboboxtype"];
                [Videoinsert setObject:self.videopagecategoryselectedid forKey:@"Videocategorypageid"];
                [Videoinsert setObject:imageFile1 forKey:@"Videoposterimage"];
                
                                
                if([self.sharevideourlstr length]!=0)
                [Videoinsert setObject:self.sharevideourlstr forKey:@"ExternalvideoUrl"];
                else
                [Videoinsert setObject:@"N/A" forKey:@"ExternalvideoUrl"];
                [Videoinsert save];
                self.videotitle.stringValue=@"";
                self.videocombobox.stringValue=@"";
                self.sharevideourl.stringValue=@"";
                self.sharevideourlstr=nil;
                [self showvideolist];
                [[self.mainview animator]replaceSubview:self.currentsubview with:self.showvideoview];
                currentsubview=self.showvideoview;
                NSAlert *alert = [[NSAlert alloc] init];
                [alert setAlertStyle:NSInformationalAlertStyle];
                [alert setMessageText:@"New Video has been added"];
                [alert beginSheetModalForWindow:_window
                                  modalDelegate:self
                                 didEndSelector:@selector(ok)
                                    contextInfo:nil];
             }
            else{
                NSAlert *alert = [[NSAlert alloc] init];
                [alert setAlertStyle:NSInformationalAlertStyle];
                [alert setMessageText:@"Video size should be less than 10 MB."];
                [alert beginSheetModalForWindow:_window
                                  modalDelegate:self
                                 didEndSelector:@selector(ok)
                                    contextInfo:nil];
            }
            }
        }
    }
        [self stopactivity];
}
-(void)showvideolist
{
    [self.videotableview setHidden:YES];
    PFQuery *query = [PFQuery queryWithClassName:@"Videos"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
           
            self.showvideoarr=[[NSMutableArray alloc]initWithArray:objects];
         
            if([self.showcategoryarry count]==0)
            {
                [self.videotableview setHidden:YES];
                [self.firstvideolbl setHidden:NO];
                [self.secondvideolbl setHidden:NO];
                self.firstvideolbl.stringValue=@"Your Categories Are Looking Empty.";
                self.secondvideolbl.stringValue=@"Get Started by creating your first category";
            }
            else
            {
                if([self.showvideoarr count]==0)
                {
                    [self.firstvideolbl setHidden:NO];
                    [self.secondvideolbl setHidden:NO];
                    [self.videotableview setHidden:YES];
                    self.firstvideolbl.stringValue=@"Your Videos Are Looking Empty.";
                    self.secondvideolbl.stringValue=@"Get Started by creating your first Video";
                    
                    
                }else{
                    [self.firstvideolbl setHidden:YES];
                    [self.secondvideolbl setHidden:YES];
                    [self.videotableview setHidden:NO];
                    [self.videotableview reloadData];
                    
                }
            }

           
        }else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Error from servere side"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
    }];
}
-(IBAction)selectvideoradio:(id)sender
{
     NSInteger tag = [[sender selectedCell] tag];
    self.videocombobox.stringValue=@"";
     if(tag==603)
     {
       self.photocomboboxarry=[[NSMutableArray alloc]initWithArray:self.showcategoryarry];
       self.videoradiobtnstr=@"Category";
         if([self.photocomboboxarry count]==0)
         {
             NSAlert *alert = [[NSAlert alloc] init];
             [alert setAlertStyle:NSInformationalAlertStyle];
             [alert setMessageText:@"At this time no any category add"];
             [alert beginSheetModalForWindow:_window
                               modalDelegate:self
                              didEndSelector:@selector(ok)
                                 contextInfo:nil];
         }
     }
    if(tag==604)
    {
        self.photocomboboxarry=[[NSMutableArray alloc]initWithArray:self.showpagelistarry];
        self.videoradiobtnstr=@"Pages";
        if([self.photocomboboxarry count]==0)
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"No Pages Exist. Please add Page first"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
    }
}
-(IBAction)Savevideo:(id)sender{
    loadingSpinner = [[NSProgressIndicator alloc] init];
    [loadingSpinner setFrame:NSMakeRect(485,200, 50, 50)];
    [loadingSpinner setStyle:NSProgressIndicatorSpinningStyle];
    [self.currentsubview addSubview:loadingSpinner];
    [NSThread detachNewThreadSelector:@selector(savevideoactivity) toTarget:self withObject:nil];
}
-(void)deletevideoactivity
{
    [loadingSpinner startAnimation:nil];
    PFQuery *query = [PFQuery queryWithClassName:@"Videos"];
    PFObject *videodelte = [query getObjectWithId:self.videoselectedid];
    NSLog(@"delete data is %@",videodelte);
    [videodelte deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
     {
         if (!error) {
             // The gameScore saved successfully.
             
             [self showvideolist];
             
             if([self.deletephotovideoaudiostr isEqualToString:@"deletevideofrompage"])
             {
                 [[self.mainview animator]replaceSubview:self.currentsubview with:self.addpagesview];
                 currentsubview=self.addpagesview;
             }
             else{
                 [[self.mainview animator]replaceSubview:self.currentsubview with:self.showvideoview];
                 currentsubview=self.showvideoview;
                 self.videotitle.stringValue=@"";
                 self.videocombobox.stringValue=@"";
                 self.videourlstr=nil;
                 //self.photoimage.image=nil;
                 NSAlert *alert = [[NSAlert alloc] init];
                 [alert setAlertStyle:NSInformationalAlertStyle];
                 [alert setMessageText:@"Video has been deleted"];
                 [alert beginSheetModalForWindow:_window
                                   modalDelegate:self
                                  didEndSelector:@selector(ok)
                                     contextInfo:nil];
             }
                     
         } else {
             // There was an error saving the gameScore.
             NSAlert *alert = [[NSAlert alloc] init];
             [alert setAlertStyle:NSInformationalAlertStyle];
             [alert setMessageText:@"Error"];
             [alert beginSheetModalForWindow:_window
                               modalDelegate:self
                              didEndSelector:@selector(ok)
                                 contextInfo:nil];
         }
     }
     ];
    [self stopactivity];

}
-(IBAction)Deletevideo:(id)sender{
    
    self.alertidentifirestr=@"deletevideoalert";
    NSAlert *alert=[[NSAlert alloc ]init];
    [alert setMessageText:@"Are you sure you want to delete this video"];
    [alert addButtonWithTitle:@"Yes"];
    [alert addButtonWithTitle:@"No"];
    [alert beginSheetModalForWindow: _window modalDelegate: self
                     didEndSelector: @selector(alertDidEnd:returnCode:contextInfo:)
                        contextInfo: nil];

}
-(IBAction)Updatevideo:(id)sender{
    loadingSpinner = [[NSProgressIndicator alloc] init];
    [loadingSpinner setFrame:NSMakeRect(485,200, 50, 50)];
    [loadingSpinner setStyle:NSProgressIndicatorSpinningStyle];
    [self.currentsubview addSubview:loadingSpinner];
    [NSThread detachNewThreadSelector:@selector(updatevideoactivity) toTarget:self withObject:nil];
    
}
-(void)updatevideoactivity
{
    self.videotitle.stringValue=[self.videotitle.stringValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    self.videocombobox.stringValue=[self.videocombobox.stringValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    [loadingSpinner startAnimation:nil];
    self.videologinupdateidentifirestr=@"fromvideoupdate";
      int videovalue=[self checkonvideo];
    switch (videovalue)
    {
        case 1:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Fill Title"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 2:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Select category or page item from dropdown list"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 3:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please select video"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;

        case 4:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Video title already avilable please give other title."];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
            
        case 5:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Url is invalid please select a valid Url"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
    
            break;
        default:
        {
            NSURL *url = [NSURL URLWithString:[self.videourlstr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            NSData *videoData = [NSData dataWithContentsOfURL:url];
            NSLog(@"%lu",[videoData length]);
            if([videoData length]==0){
                NSAlert *alert = [[NSAlert alloc] init];
                [alert setAlertStyle:NSInformationalAlertStyle];
                [alert setMessageText:@"Please remove space between video name!"];
                [alert beginSheetModalForWindow:_window
                                  modalDelegate:self
                                 didEndSelector:@selector(ok)
                                    contextInfo:nil];
                
            }else{
            if([videoData length]<10485760)
            {
                PFQuery *query = [PFQuery queryWithClassName:@"Videos"];
                PFObject *videoupdate = [query getObjectWithId:self.videoselectedid];
                PFFile *imageFile = [PFFile fileWithName:@"Video.mov" data:videoData];
                [imageFile save];
                
                NSImage *image=self.videoposterimgview.image;
                NSData *imageData = [image TIFFRepresentation];
                NSBitmapImageRep* bitmap = [NSBitmapImageRep imageRepWithData: imageData];
                NSData* newData = [bitmap representationUsingType: NSPNGFileType properties: nil];
                PFFile *imageFile1 = [PFFile fileWithName:@"image.png" data:newData];
                [imageFile1 save];
                
                 [videoupdate setObject:self.videotitle.stringValue forKey:@"VideoTitle"];
                 [videoupdate setObject:imageFile forKey:@"VideoUrl"];
                [videoupdate setObject:self.videoradiobtnstr forKey:@"Videocomboboxtype"];
                [videoupdate setObject:self.videopagecategoryselectedid forKey:@"Videocategorypageid"];
                [videoupdate setObject:imageFile1 forKey:@"Videoposterimage"];
                
                if([self.sharevideourlstr length]!=0)
                [videoupdate setObject:self.sharevideourlstr forKey:@"ExternalvideoUrl"];
                else
                [videoupdate setObject:@"N/A" forKey:@"ExternalvideoUrl"];
                [videoupdate saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    if (!error) {
                        self.videotitle.stringValue=@"";
                        self.videocombobox.stringValue=@"";
                        [self showvideolist];
                        [[self.mainview animator]replaceSubview:self.currentsubview with:self.showvideoview];
                        currentsubview=self.showvideoview;
                        NSAlert *alert = [[NSAlert alloc] init];
                        [alert setAlertStyle:NSInformationalAlertStyle];
                        [alert setMessageText:@"Video has been Updated"];
                        [alert beginSheetModalForWindow:_window
                                          modalDelegate:self
                                         didEndSelector:@selector(ok)
                                            contextInfo:nil];

                    }
                    else
                 {
                         NSAlert *alert = [[NSAlert alloc] init];
                         [alert setAlertStyle:NSInformationalAlertStyle];
                         [alert setMessageText:@"Error during updation."];
                         [alert beginSheetModalForWindow:_window
                                           modalDelegate:self
                          
                                          didEndSelector:@selector(ok)
                                             contextInfo:nil];
                 }
                }];
            }
            else
            {
                NSAlert *alert = [[NSAlert alloc] init];
                [alert setAlertStyle:NSInformationalAlertStyle];
                [alert setMessageText:@"Video size should be less than 10 MB."];
                [alert beginSheetModalForWindow:_window
                                  modalDelegate:self
                 
                                 didEndSelector:@selector(ok)
                                    contextInfo:nil];
            }
        }
        }
    }
    [self stopactivity];
}

//for audio
-(void)showaudiolist
{
    [self.audiotableview setHidden:YES];
    PFQuery *query = [PFQuery queryWithClassName:@"Audios"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            self.movie=nil;
            self.audiourl=nil;
            self.showaudioarry=[[NSMutableArray alloc]initWithArray:objects];
            NSLog(@"video array is %@",self.showaudioarry);
            
            
            
            
            if([self.showcategoryarry count]==0)
            {
                [self.audiotableview setHidden:YES];
                [self.firstaudiolbl setHidden:NO];
                [self.secondaudiolbl setHidden:NO];
                self.firstaudiolbl.stringValue=@"Your Categories Are Looking Empty.";
                self.secondaudiolbl.stringValue=@"Get Started by creating your first category";
            }
            else
            {
                if([self.showaudioarry count]==0)
                {
                    [self.firstaudiolbl setHidden:NO];
                    [self.secondaudiolbl setHidden:NO];
                    [self.audiotableview setHidden:YES];
                    self.firstaudiolbl.stringValue=@"Your Audioes Are Looking Empty.";
                    self.secondaudiolbl.stringValue=@"Get Started by creating your first Audio";
                    
                    
                }else{
                    [self.firstaudiolbl setHidden:YES];
                    [self.secondaudiolbl setHidden:YES];
                    [self.audiotableview setHidden:NO];
                    [self.audiotableview reloadData];
                    
                }
            }
           
        }else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Error from servere side"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
    }];
}

-(IBAction)showaudio:(id)sender{
    [self showaudiolist];
    [[self.mainview animator]replaceSubview:self.currentsubview with:self.showaudioview];
    self.currentsubview=self.showaudioview;
    
}
-(IBAction)Addaudio:(id)sender
{
    self.photocomboboxarry=[[NSMutableArray alloc]initWithArray:self.showcategoryarry];
    self.audioradiobtnstr=@"Category";
    [self recallshowpage];
    self.audiotitle.stringValue=@"";
    self.audiocmbbox.stringValue=@"";
    self.movie=nil;
    self.audioposterimgview.image=nil;
    [self.audiomovie setMovie:self.movie];
    self.shareaudiourlstr=@"";
    self.shareaudiourl.stringValue=@"";
    if([self.showcategoryarry count]!=0||[self.showpagelistarry count]!=0)
    {
        [[self.mainview animator]replaceSubview:self.currentsubview with:self.addaudioview];
        [self.updateaudiobtn setHidden:YES];
        [self.deleteaudiobtn setHidden:YES];
        [self.saveaudiobtn setHidden:NO];
        currentsubview=self.addaudioview;
        
        
        self.audiourl=nil;
        [self.audioradio selectCellWithTag:605];
        NSLog(@"value of show cate gory arran yis %@",self.showcategoryarry);
    }
    else{
        NSAlert *alert = [[NSAlert alloc] init];
        [alert setAlertStyle:NSInformationalAlertStyle];
        [alert setMessageText:@"First you need to add atleast one Category or one Page"];
        [alert beginSheetModalForWindow:_window
                          modalDelegate:self
         
                         didEndSelector:@selector(ok)
                            contextInfo:nil];
    }
}
-(int)checkonaudio
{
    if([self.audiotitle.stringValue length]==0)
    {
        return 1;
    }
    if([self.audiocmbbox.stringValue length]==0)
    {
        return 2;
    }
    if([self.audiourl length]==0)
    {
        return 3;
    }
    if(self.audioposterimgview.image==nil)
    {
        return 6;
    }
    if([self.shareaudiourl.stringValue length]!=0)
    {
          if(![self.shareaudiourl.stringValue isEqualToString:@"N/A"])
          {
        NSURL *candidateURL = [NSURL URLWithString:self.shareaudiourl.stringValue];
        if (candidateURL && candidateURL.scheme && candidateURL.host) {
            
            NSURL *candidateURL = [NSURL URLWithString:self.shareaudiourl.stringValue];
            if (candidateURL && candidateURL.scheme && candidateURL.host) {
                NSString *url = self.shareaudiourl.stringValue;
                
                NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5.0];
                NSHTTPURLResponse* response = nil;
                NSError* error = nil;
                [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
                NSLog(@"statusCode = %ld", [response statusCode]);
                
                if ([response statusCode] == 404)
                    return 5;
                else
                    self.shareaudiourlstr=self.shareaudiourl.stringValue;
            }
      
        }
        else{
            return 5;
        }
          }
    }
   
        PFQuery *query = [PFQuery queryWithClassName:@"Audios"];
        [query whereKey:@"AudioTitle" equalTo:self.audiotitle.stringValue];
        NSArray* findproductArray = [query findObjects];
        if([self.audiologinupdateidentifirestr
            isEqualToString:@"fromaudiologin"])
        {
            if([findproductArray count]!=0)
            {
                return 4;
            }
        }
        if([self.audiologinupdateidentifirestr isEqualToString:@"fromaudioupdate"])
        {
            if([findproductArray count]!=0)
            {
                PFObject *bigObject=[findproductArray objectAtIndex:0];
                NSString *objectId = bigObject.objectId;
                if(![self.audioselectedidstr isEqualToString:objectId])
                {
                    return 4;
                }
               
            }
        }
           
    return 0;
}

-(void)saveaudioactivity
{
    self.audiotitle.stringValue=[self.audiotitle.stringValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    self.audiocmbbox.stringValue=[self.audiocmbbox.stringValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    [loadingSpinner startAnimation:nil];
    self.audiologinupdateidentifirestr=@"fromaudiologin";
    int audiovalue= [self checkonaudio];
    switch (audiovalue)
    {
        case 1:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Fill Title"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 2:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Select category or page item from dropdown list"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 3:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please select audio"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;

        case 4:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Audio title already avilable please give other title."];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 5:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Url is invalid please select a valid Url"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 6:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Select audio poster image"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        default:
        {
            NSURL *url = [NSURL URLWithString:[self.audiourl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            NSData *audioData = [NSData dataWithContentsOfURL:url];
            NSLog(@"%lu",[audioData length]);
            if ([audioData length]==0) {
                NSAlert *alert = [[NSAlert alloc] init];
                [alert setAlertStyle:NSInformationalAlertStyle];
                [alert setMessageText:@"Please remove space between audio name!"];
                [alert beginSheetModalForWindow:_window
                                  modalDelegate:self
                                 didEndSelector:@selector(ok)
                                    contextInfo:nil];
            }else{
            if([audioData length]<10485760)
            {
                PFFile *imageFile=nil;
                if([audioext isEqualToString:@"wav"]){
                imageFile = [PFFile fileWithName:@"Audio.wav" data:audioData];
                }else if([audioext isEqualToString:@"aif"]){
                 imageFile = [PFFile fileWithName:@"Audio.aif" data:audioData];
                }else if([audioext isEqualToString:@"mp3"]){
                imageFile = [PFFile fileWithName:@"Audio.mp3" data:audioData];
                }
                [imageFile save];
                
                NSImage *image=self.audioposterimgview.image;
                NSData *imageData = [image TIFFRepresentation];
                NSBitmapImageRep* bitmap = [NSBitmapImageRep imageRepWithData: imageData];
                NSData* newData = [bitmap representationUsingType: NSPNGFileType properties: nil];
                PFFile *imageFile1 = [PFFile fileWithName:@"image.png" data:newData];
                [imageFile1 save];
                
                PFObject *audioinsert = [PFObject objectWithClassName:@"Audios"];
                [audioinsert setObject:self.audiotitle.stringValue forKey:@"AudioTitle"];
                [audioinsert setObject:imageFile forKey:@"AudioUrl"];
                [audioinsert setObject:self.audioradiobtnstr forKey:@"Audiocomboboxtype"];
                [audioinsert setObject:self.audioext forKey:@"Audioformattype"];
                [audioinsert setObject:self.audiocategorypageselectedid forKey:@"Audiocategorypageid"];
                [audioinsert setObject:imageFile1 forKey:@"Audioposterimage"];

                
                if([self.shareaudiourlstr length]!=0)
                [audioinsert setObject:self.shareaudiourlstr forKey:@"AudioexternalUrl"];
                else
                [audioinsert setObject:@"N/A" forKey:@"AudioexternalUrl"];
                
                [audioinsert save];
                self.audiotitle.stringValue=@"";
                self.audiocmbbox.stringValue=@"";
                self.audiourl=nil;
                self.shareaudiourlstr=nil;
                self.shareaudiourl.stringValue=@"";
                [self showaudiolist];
                [[self.mainview animator]replaceSubview:self.currentsubview with:self.showaudioview];
                currentsubview=self.showaudioview;
                NSAlert *alert = [[NSAlert alloc] init];
                [alert setAlertStyle:NSInformationalAlertStyle];
                [alert setMessageText:@"New Audio has been added"];
                [alert beginSheetModalForWindow:_window
                                  modalDelegate:self
                                 didEndSelector:@selector(ok)
                                    contextInfo:nil];
                
            }
            else{
                NSAlert *alert = [[NSAlert alloc] init];
                [alert setAlertStyle:NSInformationalAlertStyle];
                [alert setMessageText:@"Video size should be less than 10 MB."];
                [alert beginSheetModalForWindow:_window
                                  modalDelegate:self
                                 didEndSelector:@selector(ok)
                                    contextInfo:nil];
            }
        }
        }
    }
    [self stopactivity];

}
-(IBAction)saveaudio:(id)sender{
   
    loadingSpinner = [[NSProgressIndicator alloc] init];
    [loadingSpinner setFrame:NSMakeRect(485,200, 50, 50)];
    [loadingSpinner setStyle:NSProgressIndicatorSpinningStyle];
    [self.currentsubview addSubview:loadingSpinner];
    [NSThread detachNewThreadSelector:@selector(saveaudioactivity) toTarget:self withObject:nil];
}

-(void)deleteaudioactivity
{
    [loadingSpinner startAnimation:nil];
    PFQuery *query = [PFQuery queryWithClassName:@"Audios"];
    PFObject *audiodelte = [query getObjectWithId:self.audioselectedidstr];
    NSLog(@"delete data is %@",audiodelte);
    [audiodelte deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
     {
         if (!error) {
             // The gameScore saved successfully.
             [self showaudiolist];
             if([self.deletephotovideoaudiostr isEqualToString:@"deleteaudiofrompage"])
             {
                 [[self.mainview animator]replaceSubview:self.currentsubview with:self.addpagesview];
                 currentsubview=self.addpagesview;
             }
             else
             {
             [[self.mainview animator]replaceSubview:self.currentsubview with:self.showaudioview];
             currentsubview=self.showaudioview;
             self.audiotitle.stringValue=@"";
             self.audiocmbbox.stringValue=@"";
             }
             //self.photoimage.image=nil;
             NSAlert *alert = [[NSAlert alloc] init];
             [alert setAlertStyle:NSInformationalAlertStyle];
             [alert setMessageText:@"Audio has been deleted"];
             [alert beginSheetModalForWindow:_window
                               modalDelegate:self
                              didEndSelector:@selector(ok)
                                 contextInfo:nil];
         } else {
             // There was an error saving the gameScore.
             NSAlert *alert = [[NSAlert alloc] init];
             [alert setAlertStyle:NSInformationalAlertStyle];
             [alert setMessageText:@"Error"];
             [alert beginSheetModalForWindow:_window
                               modalDelegate:self
                              didEndSelector:@selector(ok)
                                 contextInfo:nil];
         }
     }
     ];
    [self stopactivity];
}
-(IBAction)deleteaudio:(id)sender{

    self.alertidentifirestr=@"deleteaudioalert";
    NSAlert *alert=[[NSAlert alloc ]init];
    [alert setMessageText:@"Are you sure you want to delete this audio"];
    [alert addButtonWithTitle:@"Yes"];
    [alert addButtonWithTitle:@"No"];
    [alert beginSheetModalForWindow: _window modalDelegate: self
                     didEndSelector: @selector(alertDidEnd:returnCode:contextInfo:)
                        contextInfo: nil];
}
-(void)updateaudioactivity
{
    self.audiotitle.stringValue=[self.audiotitle.stringValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    self.audiocmbbox.stringValue=[self.audiocmbbox.stringValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    [loadingSpinner startAnimation:nil];
    self.audiologinupdateidentifirestr=@"fromaudioupdate";
    int audiovalue=[self checkonaudio];
    switch (audiovalue)
    {
        case 1:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Fill Title"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 2:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please Select category or page item from dropdown list"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 3:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Please select audio"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;

        case 4:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Audio title already avilable please give other title."];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 5:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Url is invalid please select a valid Url"];
            //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
            
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
             
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        case 6:
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"Select audio poster image"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
            break;
        default:
        {
            NSURL *url = [NSURL URLWithString:[self.audiourl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            NSData *videoData = [NSData dataWithContentsOfURL:url];
            NSLog(@"%lu",[videoData length]);
            if([videoData length]==0){
                NSAlert *alert = [[NSAlert alloc] init];
                [alert setAlertStyle:NSInformationalAlertStyle];
                [alert setMessageText:@"Please remove space between audio name!"];
                [alert beginSheetModalForWindow:_window
                                  modalDelegate:self
                                 didEndSelector:@selector(ok)
                                    contextInfo:nil];
            }else{
            if([videoData length]<10485760)
            {
                PFQuery *query = [PFQuery queryWithClassName:@"Audios"];
                PFObject *audioupdate = [query getObjectWithId:self.audioselectedidstr];
                PFFile *imageFile=nil;
                if([audioext isEqualToString:@"wav"]){
                imageFile = [PFFile fileWithName:@"Audio.wav" data:videoData];
                }else if([audioext isEqualToString:@"aif"]){
                imageFile = [PFFile fileWithName:@"Audio.aif" data:videoData];
                }else if([audioext isEqualToString:@"mp3"]){
                imageFile = [PFFile fileWithName:@"Audio.mp3" data:videoData];
                }
                [imageFile save];
                NSImage *image=self.audioposterimgview.image;
                NSData *imageData = [image TIFFRepresentation];
                NSBitmapImageRep* bitmap = [NSBitmapImageRep imageRepWithData: imageData];
                NSData* newData = [bitmap representationUsingType: NSPNGFileType properties: nil];
                PFFile *imageFile1 = [PFFile fileWithName:@"image.png" data:newData];
                [imageFile1 save];
                
                
                [audioupdate setObject:self.audiotitle.stringValue forKey:@"AudioTitle"];
                [audioupdate setObject:imageFile forKey:@"AudioUrl"];
                [audioupdate setObject:self.audioradiobtnstr forKey:@"Audiocomboboxtype"];
                [audioupdate setObject:self.audioext forKey:@"Audioformattype"];
                [audioupdate setObject:self.audiocategorypageselectedid forKey:@"Audiocategorypageid"];
                [audioupdate setObject:imageFile1 forKey:@"Audioposterimage"];
                
                if([self.shareaudiourlstr length]!=0)
                    [audioupdate setObject:self.shareaudiourlstr forKey:@"AudioexternalUrl"];
                else
                    [audioupdate setObject:@"N/A" forKey:@"AudioexternalUrl"];
                
                
                [audioupdate saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    if (!error) {
                        self.audiotitle.stringValue=@"";
                        self.audiocmbbox.stringValue=@"";
                        [self showaudiolist];
                        [[self.mainview animator]replaceSubview:self.currentsubview with:self.showaudioview];
                        currentsubview=self.showaudioview;
                        self.audiourl=nil;
                        NSAlert *alert = [[NSAlert alloc] init];
                        [alert setAlertStyle:NSInformationalAlertStyle];
                        [alert setMessageText:@"Audio has been Updated"];
                        [alert beginSheetModalForWindow:_window
                                          modalDelegate:self
                                         didEndSelector:@selector(ok)
                                            contextInfo:nil];
                        
                    }
                    else
                    {
                        NSAlert *alert = [[NSAlert alloc] init];
                        [alert setAlertStyle:NSInformationalAlertStyle];
                        [alert setMessageText:@"Error during updation."];
                        [alert beginSheetModalForWindow:_window
                                          modalDelegate:self
                         
                                         didEndSelector:@selector(ok)
                                            contextInfo:nil];
                    }
                }];
            }
            else
            {
                NSAlert *alert = [[NSAlert alloc] init];
                [alert setAlertStyle:NSInformationalAlertStyle];
                [alert setMessageText:@"Audio size should less than 10 MB."];
                [alert beginSheetModalForWindow:_window
                                  modalDelegate:self
                 
                                 didEndSelector:@selector(ok)
                                    contextInfo:nil];
            }
        }
        }
    }
    [self stopactivity];

}
-(IBAction)updateaudio:(id)sender{
    loadingSpinner = [[NSProgressIndicator alloc] init];
    [loadingSpinner setFrame:NSMakeRect(485,200, 50, 50)];
    [loadingSpinner setStyle:NSProgressIndicatorSpinningStyle];
    [self.currentsubview addSubview:loadingSpinner];
    [NSThread detachNewThreadSelector:@selector(updateaudioactivity) toTarget:self withObject:nil];
    
}
-(IBAction)selectaudioradio:(id)sender{
    
    
    NSInteger tag = [[sender selectedCell] tag];
    self.audiocmbbox.stringValue=@"";
    if(tag==605)
    {
        self.photocomboboxarry=[[NSMutableArray alloc]initWithArray:self.showcategoryarry];
        NSLog(@"value of combo box array is %@",self.photocomboboxarry);
        self.audioradiobtnstr=@"Category";
        if([self.photocomboboxarry count]==0)
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"At this time no any category add"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
    }
    if(tag==606)
    {
        self.photocomboboxarry=[[NSMutableArray alloc]initWithArray:self.showpagelistarry];
        self.audioradiobtnstr=@"Pages";
        if([self.photocomboboxarry count]==0)
        {
            NSAlert *alert = [[NSAlert alloc] init];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert setMessageText:@"No Pages Exist. Please add Page first"];
            [alert beginSheetModalForWindow:_window
                              modalDelegate:self
                             didEndSelector:@selector(ok)
                                contextInfo:nil];
        }
    }
    
    

    
}

-(IBAction)changeaudio:(id)sender
{
    NSArray* fileTypes = [[NSArray alloc] initWithObjects:@"wav", @"Wav",@"aif",@"mp3",@"MP3", nil];
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setCanChooseFiles:YES];
    [panel setCanChooseDirectories:NO];
    [panel setAllowsMultipleSelection:NO]; // yes if more than one dir is allowed
    [panel setAllowedFileTypes:fileTypes];
    
    NSInteger clicked = [panel runModal];
    
    if (clicked == NSFileHandlingPanelOKButton) {
        for (NSURL *url in [panel URLs]) {
            NSLog(@"value of url is %@",url);
            NSError *error;
            self.audiourl=[url absoluteString];
            
             NSString *filename = [[url path] lastPathComponent];
            NSLog(@"filename %@",filename);
            NSArray *arr = [filename componentsSeparatedByString:@"."];
            audioext = [arr objectAtIndex:1];
           NSLog(@"%@",audioext);
            
            
            self.audiourl = [self.audiourl stringByReplacingOccurrencesOfString:@" " withString:@""];
            NSURL *newurl = [NSURL URLWithString:self.audiourl];
            
            NSData *audioData = [NSData dataWithContentsOfURL:newurl];
            NSLog(@"%lu",[audioData length]);
            if([audioData length]==0){
                NSAlert *alert = [[NSAlert alloc] init];
                [alert setAlertStyle:NSInformationalAlertStyle];
                [alert setMessageText:@"Please remove space between audio name!"];
                [alert beginSheetModalForWindow:_window
                                  modalDelegate:self
                                 didEndSelector:@selector(ok)
                                    contextInfo:nil];
            }else{

            
            NSURL *url = [NSURL URLWithString:[self.audiourl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            self.movie = nil;
            self.movie = [QTMovie movieWithURL:url error:&error];
            
            
            
            
          
            
            
            
            
            //self.movie = [QTMovie movieWithURL:url error:&error];
            //self.movie = [QTMovie movieWithData:data error:&error];
            if (self.movie) {
                [self.movie setAttribute:[NSNumber numberWithBool:YES] forKey:QTMovieEditableAttribute];
                [self setMovie:self.movie];
                [self.audiomovie setMovie:self.movie];
                NSLog(@"inside movi alue is %@",self.movie);
            }

            }
        }
    }
    
}



//tableview category

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
        // Get a new ViewCell
    
      NSTableCellView *cellView = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    if([tableView tag]==301)
    {
    if([tableColumn.identifier isEqualToString:@"categorycell"])
    {       
        PFObject *getObject=[self.showcategoryarry objectAtIndex:row];
        PFFile *imageFile = [getObject objectForKey:@"ImageFile"];
        [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            if (!error) {
                NSImage *img = [[NSImage alloc] initWithData:data];
                cellView.imageView.image=img;
               // NSString *categoryobjectId = getObject.objectId;
                cellView.textField.stringValue = [getObject objectForKey:@"Title"];
            }
        }];
        return cellView;
    }
    }
    if([tableView tag]==302)
    {
        if( [tableColumn.identifier isEqualToString:@"productcell"] )
        {
            PFObject *getObject=[self.showproductlistarry objectAtIndex:row];
            PFFile *imageFile = [getObject objectForKey:@"ProImageFile"];
            [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                if (!error) {
                    NSImage *img = [[NSImage alloc] initWithData:data];
                    cellView.imageView.image=img;
                    // NSString *categoryobjectId = getObject.objectId;
                    cellView.textField.stringValue = [getObject objectForKey:@"ProductTitle"];
                }
            }];
            return cellView;
        }
    }
    if([tableView tag]==303)
    {
        if( [tableColumn.identifier isEqualToString:@"pagecell"] )
        {
            PFObject *getObject=[self.showpagelistarry objectAtIndex:row];
            PFFile *imageFile = [getObject objectForKey:@"PageImageFile"];
            [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                if (!error) {
                    NSImage *img = [[NSImage alloc] initWithData:data];
                    cellView.imageView.image=img;
                    // NSString *categoryobjectId = getObject.objectId;
                    cellView.textField.stringValue = [getObject objectForKey:@"PageTitle"];
                }
            }];
            return cellView;
        }
        
    }
    if([tableView tag]==304)
    {
        if( [tableColumn.identifier isEqualToString:@"photocell"] )
        {
            PFObject *getObject=[self.showphotolistarry objectAtIndex:row];
            PFFile *imageFile = [getObject objectForKey:@"PhotoImageFile"];
            [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                if (!error) {
                    NSImage *img = [[NSImage alloc] initWithData:data];
                    cellView.imageView.image=img;
                    cellView.textField.stringValue = [getObject objectForKey:@"PhotoTitle"];
                    NSLog(@"vallue of %@",[getObject objectForKey:@"PhotoTitle"]);
                }
            }];
            return cellView;
        }
    }
    //videocell
    if([tableView tag]==305)
    {
        if( [tableColumn.identifier isEqualToString:@"videocell"] )
        {
            PFObject *getObject=[self.showvideoarr objectAtIndex:row];
            cellView.textField.stringValue = [getObject objectForKey:@"VideoTitle"];
            return cellView;
        }
    }
    //audio cell
    if([tableView tag]==306)
    {
        
        if( [tableColumn.identifier isEqualToString:@"audiocell"] )
        {
            PFObject *getObject=[self.showaudioarry objectAtIndex:row];
            cellView.textField.stringValue = [getObject objectForKey:@"AudioTitle"];
            return cellView;
        }
    }
    
     return cellView;
}
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    if([tableView tag]==301)
       return [self.showcategoryarry count];
    if([tableView tag]==302)
        return [self.showproductlistarry count];
    if([tableView tag]==303)
        return [self.showpagelistarry count];
    if([tableView tag]==304)
        return [self.showphotolistarry count];
    if([tableView tag]==305)
        return [self.showvideoarr count];
    if([tableView tag]==306)
        return [self.showaudioarry count];
    
    return 0;
}
-(void)tableViewSelectionDidChange:(NSNotification *)notification{
   
     if([[notification object]tag]==301)
     {
    [self.categorysavebutton setHidden:YES];
    [self.categoryupdatebutton setHidden:NO];
    [self.categorydeletebutton setHidden:NO];
    [[self.mainview animator]replaceSubview:self.currentsubview with:self.addcategoryview];
    currentsubview=self.addcategoryview;
         
    PFObject *getObject=[self.showcategoryarry objectAtIndex:[[notification object] selectedRow]];
    PFFile *imageFile = [getObject objectForKey:@"ImageFile"];
    [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if (!error) {
            NSImage *img = [[NSImage alloc] initWithData:data];
            self.categoryselectedid = getObject.objectId;
            self.tittletext.stringValue = [getObject objectForKey:@"Title"];
            self.descriptiontextvew.string=[getObject objectForKey:@"Description"];
            self.categoryimageview.image=img;
        }
    }];
     }
    if([[notification object]tag]==302)
    {
        [self.updateproductbtn setHidden:NO];
        [self.deleteproductbtn setHidden:NO];
        [self.saveproductbtn setHidden:YES];
        PFObject *getObject=[self.showproductlistarry objectAtIndex:[[notification object] selectedRow]];
        PFFile *imageFile = [getObject objectForKey:@"ProImageFile"];
        [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            if (!error) {
                NSImage *img = [[NSImage alloc] initWithData:data];
                self.productselectedid = getObject.objectId;
                self.producttitletxt.stringValue = [getObject objectForKey:@"ProductTitle"];
                self.productdescriptiontxtview.string=[getObject objectForKey:@"ProductDescription"];
                self.productpricewtxt.stringValue=[getObject objectForKey:@"ProductPrice"];
                
                self.productshippingpricetxt.stringValue=[getObject objectForKey:@"ProductShippingprice"];
                PFQuery *query = [PFQuery queryWithClassName:@"Category"];
                PFObject *categoryget = [query getObjectWithId:[getObject objectForKey:@"PcategoryId"]];
                self.categoryselectedid=[getObject objectForKey:@"PcategoryId"];
                self.categorycombobox.stringValue=[categoryget objectForKey:@"Title"];
                //need to write categary id code
                self.productimgview.image=img;
                 [[self.mainview animator]replaceSubview:self.currentsubview with:self.addproductview];
                currentsubview=self.addproductview;
            }
        }];
    }
     if([[notification object]tag]==303)
     {
         [self recallshowpagetype];
         [self.pagesavebtne setHidden:YES];
         [self.pagedeletebtn setHidden:NO];
         [self.pageupdatebtn setHidden:NO];
         PFObject *getObject=[self.showpagelistarry objectAtIndex:[[notification object] selectedRow]];
         PFFile *imageFile = [getObject objectForKey:@"PageImageFile"];
         [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
             if (!error) {
                 NSImage *img = [[NSImage alloc] initWithData:data];
                 self.pageselectedid = getObject.objectId;
                 self.pagetittletxt.stringValue = [getObject objectForKey:@"PageTitle"];
                 self.pagetextdescription.string=[getObject objectForKey:@"PageText"];
                 self.pagesubtittle.stringValue=[getObject objectForKey:@"Pagesubtitle"];
                 self.shareurlstr=[getObject objectForKey:@"ShareUrl"];
                 self.shareurl.stringValue=[getObject objectForKey:@"ShareUrl"];
                 
                 PFQuery *query = [PFQuery queryWithClassName:@"Category"];
                 PFObject *categoryget = [query getObjectWithId:[getObject objectForKey:@"PagecategoryId"]];
                 self.categoryselectedid=[getObject objectForKey:@"PagecategoryId"];
                 self.pagecategorycbox.stringValue=[categoryget objectForKey:@"Title"];
                 
                 //get the pagetypeid
                 PFQuery *pagetypequery=[PFQuery queryWithClassName:@"PagesType"];
                 PFObject *pagetypegetget = [pagetypequery getObjectWithId:[getObject objectForKey:@"PageType"]];
                 self.audiovideogallery.stringValue=[pagetypegetget objectForKey:@"PageTypevalue"];
                 NSLog(@"pagetype value is %@",[pagetypegetget objectForKey:@"PageTypevalue"]);
                 self.pagetypeidstr=[getObject objectForKey:@"PageType"];
                 self.audiovideogaleryselececcmbstr=[pagetypegetget objectForKey:@"PageTypevalue"];
                 
                 self.pageheaderphoto.image=img;
                 [self.audioscrollview setHidden:YES];
                 [self.pageaudiovideogallerylbl2 setHidden:YES];
                 [self.pageaudiovideohallerylbl1 setHidden:YES];
                 [self.photoscrollview setHidden:YES];
                 [self.gallerycustumview setHidden:YES];
                 [self.audiocustumview setHidden:YES];
                 [[self.mainview animator]replaceSubview:self.currentsubview with:self.addpagesview];
                 self.pageidentifirestr=@"fromupdate";
                 currentsubview=self.addpagesview;
                 [self getaudiovideogalleryonpage];
             }
             else{
                 NSLog(@"eror is %@",error);
             }
         }];
     }
    if([[notification object]tag]==304)
    {
        [self recallshowpage];
        [self.photosavebtn setHidden:YES];
        [self.photoupdatebtn setHidden:NO];
        [self.photodeletebtn setHidden:NO];
        PFObject *getObject=[self.showphotolistarry objectAtIndex:[[notification object] selectedRow]];
        PFFile *imageFile = [getObject objectForKey:@"PhotoImageFile"];
        [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            if (!error) {
                NSImage *img = [[NSImage alloc] initWithData:data];
                self.photoselectedid = getObject.objectId;
                self.phottittle.stringValue = [getObject objectForKey:@"PhotoTitle"];
                self.photoradiobtnidentifirestr=[getObject objectForKey:@"comboboxtype"];
                
                self.photoimage.image=img;
                if([self.photoradiobtnidentifirestr isEqualToString:@"Category"])
                    {
                        PFQuery *query = [PFQuery queryWithClassName:@"Category"];
                        PFObject *categoryget = [query getObjectWithId:[getObject objectForKey:@"categorypageid"]];
                        self.photocomboselectedid=[getObject objectForKey:@"categorypageid"];
                        self.photoscombobox.stringValue=[categoryget objectForKey:@"Title"];
                        NSLog(@"value of category is %@",[categoryget objectForKey:@"Title"]);
                        self.photocomboboxarry=[[NSMutableArray alloc]initWithArray:self.showcategoryarry];
                        [self.photoradiobutton selectCellWithTag:601];
                         //[self.photoradio selectCellWithTag:601];
                    }
                 if([self.photoradiobtnidentifirestr isEqualToString:@"Pages"])
                 {
                     PFQuery *query = [PFQuery queryWithClassName:@"Pages"];
                     PFObject *paget=[query getObjectWithId:[getObject objectForKey:@"categorypageid"]];
                     self.photocomboselectedid=[getObject objectForKey:@"categorypageid"];
                     self.photoscombobox.stringValue=[paget objectForKey:@"PageTitle"];
                     self.photocomboboxarry=[[NSMutableArray alloc]initWithArray:self.showpagelistarry];
                      [self.photoradiobutton selectCellWithTag:602];
                     // [self.photoradio selectCellWithTag:602];
                 }
                NSLog(@"value of combobox is %@",self.photoscombobox.stringValue);           
                [[self.mainview animator]replaceSubview:self.currentsubview with:self.addphotoview];
                currentsubview=self.addphotoview;
            }
            else{
                NSLog(@"eror is %@",error);
            }
        }];
    }
     if([[notification object]tag]==305)
     {
         [self recallshowpage];
         [self.savevideobtn setHidden:YES];
         [self.updatevideobtn setHidden:NO];
         [self.deletevideobtn setHidden:NO];
         
         PFObject *getObject=[self.showvideoarr objectAtIndex:[[notification object] selectedRow]];
         PFFile *imageFile = [getObject objectForKey:@"VideoUrl"];
         NSLog(@"getting image %@",imageFile);
         [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
             if (!error)
             {
                 NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
                 NSString *documentsDirectory = [paths objectAtIndex:0];
                 NSString *localFilePath = [documentsDirectory stringByAppendingPathComponent:@"Video.mov"];
                 [data writeToFile:localFilePath atomically:YES];
                 NSURL *tmpDirURL = [NSURL fileURLWithPath:localFilePath isDirectory:NO];
                 self.videourlstr=[tmpDirURL absoluteString];
                 self.movie = nil;
                 self.movie = [QTMovie movieWithData:data error:&error];
                 if (self.movie) {
                     [self.movie setAttribute:[NSNumber numberWithBool:YES] forKey:QTMovieEditableAttribute];
                     [self setMovie:self.movie];
                     [mMovieView setMovie:self.movie];
                 }
                 PFFile *imageFile1 = [getObject objectForKey:@"Videoposterimage"];
                 NSData *imgdata = [imageFile1 getData];
                 NSImage *img = [[NSImage alloc] initWithData:imgdata];
                 self.videoposterimgview.image=img;
                 self.videoselectedid = getObject.objectId;
                 self.videotitle.stringValue = [getObject objectForKey:@"VideoTitle"];
                 self.videoradiobtnstr=[getObject objectForKey:@"Videocomboboxtype"];
                 self.sharevideourl.stringValue=[getObject objectForKey:@"ExternalvideoUrl"];
                 self.sharevideourlstr=[getObject objectForKey:@"ExternalvideoUrl"];
                 NSString* newStr = [[NSString alloc] initWithData:data
                                                          encoding:NSUTF8StringEncoding];
                 NSURL *url = [NSURL URLWithString:newStr];
              
                 NSLog(@"value of String is %@",url);
               
                 if([self.videoradiobtnstr isEqualToString:@"Category"])
                 {
                     self.photocomboboxarry=[[NSMutableArray alloc]initWithArray:self.showcategoryarry];
                     PFQuery *query = [PFQuery queryWithClassName:@"Category"];
                     PFObject *categoryget = [query getObjectWithId:[getObject objectForKey:@"Videocategorypageid"]];
                     self.videopagecategoryselectedid=[getObject objectForKey:@"Videocategorypageid"];
                     self.videocombobox.stringValue=[categoryget objectForKey:@"Title"];
                     NSLog(@"value of category is %@",[categoryget objectForKey:@"Title"]);
                    [self.videoradio selectCellWithTag:603];
                 }
                 if([self.videoradiobtnstr isEqualToString:@"Pages"])
                 {
                     self.photocomboboxarry=[[NSMutableArray alloc]initWithArray:self.showpagelistarry];
                     PFQuery *query = [PFQuery queryWithClassName:@"Pages"];
                     PFObject *paget=[query getObjectWithId:[getObject objectForKey:@"Videocategorypageid"]];
                     self.videopagecategoryselectedid=[getObject objectForKey:@"Videocategorypageid"];
                     self.videocombobox.stringValue=[paget objectForKey:@"PageTitle"];
                      [self.videoradio selectCellWithTag:604];
                    
                 }
                 NSLog(@"value of combobox is %@",self.videocombobox.stringValue);
                 [[self.mainview animator]replaceSubview:self.currentsubview with:self.addvideoview];
                 currentsubview=self.addvideoview;
             }
             else{
                 NSLog(@"eror is %@",error);
             }
         }];
     }
    if([[notification object]tag]==306)
    {
        
        [self recallshowpage];
        [self.saveaudiobtn setHidden:YES];
        [self.updateaudiobtn setHidden:NO];
        [self.deleteaudiobtn setHidden:NO];
        
        PFObject *getObject=[self.showaudioarry objectAtIndex:[[notification object] selectedRow]];
        PFFile *imageFile = [getObject objectForKey:@"AudioUrl"];
        audioext=[getObject objectForKey:@"Audioformattype"];
        NSLog(@"getting image %@",imageFile);
        [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            if (!error)
            {
                
               NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
                 
                 NSString *documentsDirectory = [paths objectAtIndex:0];
                NSString *localFilePath=nil;
                
                if([audioext isEqualToString:@"wav"]){
                    localFilePath = [documentsDirectory stringByAppendingPathComponent:@"Audio.wav"];
                }else if([audioext isEqualToString:@"mp3"]){
                    localFilePath = [documentsDirectory stringByAppendingPathComponent:@"Audio.mp3"];
                }else if([audioext isEqualToString:@"aif"]){
                localFilePath = [documentsDirectory stringByAppendingPathComponent:@"Audio.aif"];
                }
                 [data writeToFile:localFilePath atomically:YES];
               // self.audiourl=localFilePath;
                NSURL *tmpDirURL = [NSURL fileURLWithPath:localFilePath isDirectory:NO];
               self.audiourl=[tmpDirURL absoluteString];
                QTDataReference *dataReference=nil;
                if([audioext isEqualToString:@"wav"]){
                dataReference =
                [QTDataReference dataReferenceWithReferenceToData:data
                                                             name:@"Audio.wav"
                                                         MIMEType:nil];
                }else if([audioext isEqualToString:@"mp3"]){
                    dataReference =
                    [QTDataReference dataReferenceWithReferenceToData:data
                                                                 name:@"Audio.mp3"
                                                             MIMEType:nil];
                }else if([audioext isEqualToString:@"aif"]){
                    dataReference =
                    [QTDataReference dataReferenceWithReferenceToData:data
                                                                 name:@"Audio.aif"
                                                             MIMEType:nil];
                }
                NSError *error = nil;
                self.movie = nil;
                self.movie = [[QTMovie alloc] initWithDataReference:dataReference error:&error];
                  //self.movie = [QTMovie movieWithData:data error:&error];
                  //self.movie = [QTMovie movieWithURL:tmpDirURL error:&error];
                
                
                NSLog(@"value of movi is %@",self.movie);
                if (self.movie) {
                    [self.movie setAttribute:[NSNumber numberWithBool:YES] forKey:QTMovieEditableAttribute];
                    [self setMovie:self.movie];
                    [self.audiomovie setMovie:self.movie];
                }
                
                PFFile *imageFile1 = [getObject objectForKey:@"Audioposterimage"];
                NSData *imgdata = [imageFile1 getData];
                NSImage *img = [[NSImage alloc] initWithData:imgdata];
                self.audioposterimgview.image=img;
                self.audioselectedidstr = getObject.objectId;
                self.audiotitle.stringValue = [getObject objectForKey:@"AudioTitle"];
                self.audioradiobtnstr=[getObject objectForKey:@"Audiocomboboxtype"];
                self.shareaudiourlstr=[getObject objectForKey:@"AudioexternalUrl"];
                self.shareaudiourl.stringValue=[getObject objectForKey:@"AudioexternalUrl"];
                             
                if([self.audioradiobtnstr isEqualToString:@"Category"])
                {
                    self.photocomboboxarry=[[NSMutableArray alloc]initWithArray:self.showcategoryarry];
                    PFQuery *query = [PFQuery queryWithClassName:@"Category"];
                    PFObject *categoryget = [query getObjectWithId:[getObject objectForKey:@"Audiocategorypageid"]];
                    NSLog(@"categoryget is %@",categoryget);
                    self.audiocategorypageselectedid=[getObject objectForKey:@"Audiocategorypageid"];
                    self.audiocmbbox.stringValue=[categoryget objectForKey:@"Title"];
                    NSLog(@"value of category is %@",[categoryget objectForKey:@"Title"]);
                    [self.audioradio selectCellWithTag:605];
                    
                }
                if([self.audioradiobtnstr isEqualToString:@"Pages"])
                {
                    self.photocomboboxarry=[[NSMutableArray alloc]initWithArray:self.showpagelistarry];
                    PFQuery *query = [PFQuery queryWithClassName:@"Pages"];
                    PFObject *paget=[query getObjectWithId:[getObject objectForKey:@"Audiocategorypageid"]];
                    self.audiocategorypageselectedid=[getObject objectForKey:@"Audiocategorypageid"];
                    self.audiocmbbox.stringValue=[paget objectForKey:@"PageTitle"];
                    [self.audioradio selectCellWithTag:606];
                }
                [[self.mainview animator]replaceSubview:self.currentsubview with:self.addaudioview];
                currentsubview=self.addaudioview;
            }
            else{
                NSLog(@"eror is %@",error);
            }
        }];
    }
    
}
-(void)Showcategorylist
{
    tableviewidentifire=301;
    [self.Showcategorytableview setHidden:YES];
    PFQuery *query = [PFQuery queryWithClassName:@"Category"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            self.showcategoryarry=[[NSMutableArray alloc]initWithArray:objects];
            NSLog(@"Successfully retrieved %ld scores. %@", objects.count,objects);
            if([self.showcategoryarry count]==0)
            {
                [self.Showcategorytableview setHidden:YES];
                [self.categoryfirstlbl setHidden:NO];
                [self.categorysecondlbl setHidden:NO];
            }
            else
            {
                [self.Showcategorytableview setHidden:NO];
                [self.categoryfirstlbl setHidden:YES];
                [self.categorysecondlbl setHidden:YES];
                [self.Showcategorytableview reloadData];
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
            if([self.showcategoryarry count]==0)
            {
                [self.Showcategorytableview setHidden:YES];
            }
            else
            {
                 [self.Showcategorytableview setHidden:NO];
                [self.Showcategorytableview reloadData];
            }
        }
    }];
    //[self.Showcategorytableview reloadData];
}
-(IBAction)chagepicture:(id)sender
{
    NSLog(@"value of sender is %ld", [sender tag]);
    picturebtntagvalue=[sender tag];
    [[IKPictureTaker pictureTaker] beginPictureTakerSheetForWindow:self.currentsubview.window withDelegate:self didEndSelector:@selector(pictureTakerDidEnd:returnCode:contextInfo:) contextInfo:nil];
   
}
-(IBAction)Showvideo:(id)sender
{
    [[self.mainview animator]replaceSubview:self.currentsubview with:self.showvideoview];
    self.currentsubview=self.showvideoview;
    [self showvideolist];
}
- (void) pictureTakerDidEnd:(IKPictureTaker *) picker
                 returnCode:(NSInteger) code
                contextInfo:(void*) contextInfo
{
    
   // NSImage *image = [picker outputImage];
    NSImage *image = [picker inputImage];
    if(image !=nil && (code == NSOKButton))
    {
        if(picturebtntagvalue==21)
            [self.categoryimageview setImage:image];
        if(picturebtntagvalue==22)
            [self.productimgview setImage:image];
        if(picturebtntagvalue==23)
            [self.pageheaderphoto setImage:image];
        if(picturebtntagvalue==24)
            [self.photoimage setImage:image];
        if(picturebtntagvalue==25)
            [self.videoposterimgview setImage:image];
        if(picturebtntagvalue==26)
            [self.audioposterimgview setImage:image];
    }
}
- (id)tableView:(NSTableView *)tableView
objectValueForTableColumn:(NSTableColumn *)tableColumn
            row:(NSInteger)row
{    if([tableView tag]==301)
     {
       return [self.showcategoryarry objectAtIndex:row];
     }
    if([tableView tag]==302)
    {
       return [self.showproductlistarry objectAtIndex:row];
    }
    if([tableView tag]==303)
    {
        return [self.showpagelistarry objectAtIndex:row];
    }
    if([tableView tag]==304)
    {
        return [self.showphotolistarry objectAtIndex:row];
    }
    if([tableView tag]==305)
    {
        return [self.showvideoarr objectAtIndex:row];
    }
    
    return 0;
}

-(IBAction)soundplay:(id)sender
{
    self.movie = nil;
    NSError *error;
    NSURL *url = [NSURL URLWithString:[self.audiourl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
     self.movie = [QTMovie movieWithURL:url error:&error];
      if (self.movie) {
    if ([[NSString stringWithFormat:@"%@", [self.Startstopaudiobutton title]] isEqualToString:@"Play"]) {
         [self.movie setAttribute:[NSNumber numberWithBool:YES] forKey:QTMovieEditableAttribute];
		 [self.movie play];
		[self.Startstopaudiobutton setTitle:@"Stop"];
    }
	else {
		[self.movie stop];
		[self.Startstopaudiobutton setTitle:@"Play"];
	}
      
}
      else{
          NSAlert *alert = [[NSAlert alloc] init];
          [alert setAlertStyle:NSInformationalAlertStyle];
          [alert setMessageText:@"Need to add video in play list"];
          //[alert setInformativeText:@"This is a sheet detailing the connection test status"];
          
          [alert beginSheetModalForWindow:_window
                            modalDelegate:self
           
                           didEndSelector:@selector(ok)
                              contextInfo:nil];
      }


  
}


@end
