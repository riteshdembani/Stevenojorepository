//
//  AppDelegate.h
//  SwipeZineV1
//
//  Created by SIPLMacMini4 on 28/02/13.
//  Copyright (c) 2013 Systematix. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SwipeMainview.h"
#import "Swipezinesubview.h"
#import <QTKit/QTKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
@class ListViewController;

@interface AppDelegate : NSObject <NSApplicationDelegate,NSSplitViewDelegate,NSTableViewDataSource,NSTableViewDelegate,NSComboBoxDataSource,NSComboBoxDelegate,NSAlertDelegate,AVAudioPlayerDelegate>
{
    NSInteger picturebtntagvalue;
    NSInteger tableviewidentifire;
    SystemSoundID systemSoundID;
}

@property (assign) IBOutlet NSWindow *window;
@property(strong,nonatomic)IBOutlet SwipeMainview *currentview;
@property(strong,nonatomic)IBOutlet NSView *menuView;
@property(strong,nonatomic)IBOutlet NSSplitView *spliteviewobj;
@property(strong,nonatomic)IBOutlet Swipezinesubview *mainview;
@property(strong,nonatomic)IBOutlet Swipezinesubview *currentsubview;

//FOR CATREGORY
@property(strong,nonatomic)NSMutableArray *listarry;
@property(strong,nonatomic)NSString *categoryselectedid;
@property(strong,nonatomic)IBOutlet NSTextField *tittletext;
@property(strong,nonatomic)IBOutlet NSTextView *descriptiontextvew;
@property(strong,nonatomic)IBOutlet NSImageView *categoryimageview;
@property(strong,nonatomic)IBOutlet NSTableView *Showcategorytableview;
@property(strong,nonatomic)IBOutlet Swipezinesubview *addcategoryview;
@property(strong,nonatomic)IBOutlet Swipezinesubview *showcategoryview;
@property(strong,nonatomic)IBOutlet NSMutableArray *showcategoryarry;
@property(strong,nonatomic)IBOutlet NSButton *categorysavebutton;
@property(strong,nonatomic)IBOutlet NSButton *categoryupdatebutton;
@property(strong,nonatomic)IBOutlet NSButton *categorydeletebutton;
@property(strong,nonatomic)NSString *catagoryupdateidentifire;
@property(strong,nonatomic)IBOutlet NSTextField *categoryfirstlbl;
@property(strong,nonatomic)IBOutlet NSTextField *categorysecondlbl;

//alrt identifire string
@property(strong,nonatomic)NSString *alertidentifirestr;
//for product
@property(strong,nonatomic)IBOutlet Swipezinesubview *addproductview;
@property(strong,nonatomic)IBOutlet Swipezinesubview *showproductview;
@property(strong,nonatomic)IBOutlet NSTextField *producttitletxt;
@property(strong,nonatomic)IBOutlet NSTextField *productpricewtxt;
@property(strong,nonatomic)IBOutlet NSTextField *productshippingpricetxt;
@property(strong,nonatomic)IBOutlet NSTextView  *productdescriptiontxtview;
@property(strong,nonatomic)IBOutlet NSImageView *productimgview;
@property(strong,nonatomic)IBOutlet NSButton *saveproductbtn;
@property(strong,nonatomic)IBOutlet NSButton *updateproductbtn;
@property(strong,nonatomic)IBOutlet NSButton *deleteproductbtn;
@property(strong,nonatomic)IBOutlet NSTableView *showproducttableview;
@property(strong,nonatomic)NSMutableArray *showproductlistarry;
@property(strong,nonatomic)NSString *productselectedid;
@property(strong,nonatomic)IBOutlet NSComboBox *categorycombobox;
@property(strong,nonatomic)NSString *productupdateidentifire;
@property(strong,nonatomic)NSProgressIndicator *loadingSpinner;
@property(strong,nonatomic)IBOutlet NSTextField *productfirstlbl;
@property(strong,nonatomic)IBOutlet NSTextField *productsecondlbl;



//for pages
@property(strong,nonatomic)IBOutlet Swipezinesubview *addpagesview;
@property(strong,nonatomic)IBOutlet Swipezinesubview *showpageview;
@property(strong,nonatomic)IBOutlet NSTextField *pagetittletxt;
@property(strong,nonatomic)IBOutlet NSTextField *pagesubtittle;
@property(strong,nonatomic)IBOutlet NSTextView *pagetextdescription;
@property(strong,nonatomic)IBOutlet NSTextField *pagecategory;
@property(strong,nonatomic)IBOutlet NSImageView *pageheaderphoto;
@property(strong,nonatomic)NSMutableArray *showpagelistarry;
@property(strong,nonatomic)IBOutlet NSTableView *showpagetableview;
@property(strong,nonatomic)NSString *pageselectedid;
@property(strong,nonatomic)NSString *pageidentifirestr;
@property(strong,nonatomic)IBOutlet NSButton *pageupdatebtn;
@property(strong,nonatomic)IBOutlet NSButton *pagedeletebtn;
@property(strong,nonatomic)IBOutlet NSButton *pagesavebtne;
@property(strong,nonatomic)IBOutlet NSComboBox *pagecategorycbox;
@property(strong,nonatomic)IBOutlet NSTextField *firstpagelbl;
@property(strong,nonatomic)IBOutlet NSTextField *secondpagelbl;
@property(strong,nonatomic)IBOutlet NSTextField *shareurl;
@property(strong,nonatomic)NSString *shareurlstr;
@property(strong,nonatomic)NSMutableArray *videoaudioarry;
@property(strong,nonatomic)NSMutableArray *pagegalleryarry;
@property(strong,nonatomic)NSString *pagetypeidstr;


//for pages scrollview
@property(strong,nonatomic)IBOutlet NSScrollView *scroll;
@property(strong,nonatomic)NSString *audiovideogaleryselececcmbstr;
@property(strong,nonatomic)IBOutlet NSComboBox *audiovideogallery;
@property(strong,nonatomic)NSMutableArray *audiovideocmbarry;
@property(strong,nonatomic)IBOutlet NSView *gallerycustumview;
@property(strong,nonatomic)IBOutlet NSView *audiocustumview;
@property(strong,nonatomic)IBOutlet NSTextField *pageaudiovideohallerylbl1;
@property(strong,nonatomic)IBOutlet NSTextField *pageaudiovideogallerylbl2;
@property(strong,nonatomic)IBOutlet NSScrollView *audioscrollview;
@property(strong,nonatomic)IBOutlet NSString *videoaudioidentifirescrrolstr;
@property(strong,nonatomic)IBOutlet NSScrollView *photoscrollview;
@property(strong,nonatomic)IBOutlet NSString *deletephotovideoaudiostr;
@property(strong,nonatomic)NSMutableArray *phototagvaluearry;
@property(strong,nonatomic)NSMutableArray *audiotagvaluearry;
@property(strong,nonatomic)NSMutableArray *videotagvaluearry;

// for photos

@property(strong,nonatomic)IBOutlet NSTableView *showphototableview;
@property(strong,nonatomic)NSMutableArray *showphotolistarry;
@property(strong,nonatomic)IBOutlet NSTextField *phottittle;
@property(strong,nonatomic)IBOutlet NSImageView *photoimage;
@property(strong,nonatomic)IBOutlet NSComboBox *photoscombobox;
@property(strong,nonatomic)IBOutlet Swipezinesubview *showphotoview;
@property(strong,nonatomic)IBOutlet Swipezinesubview *addphotoview;
@property(strong,nonatomic)IBOutlet NSButton *photosavebtn;
@property(strong,nonatomic)IBOutlet NSButton *photodeletebtn;
@property(strong,nonatomic)IBOutlet NSButton *photoupdatebtn;
@property(strong,nonatomic)NSString *photoidentifirestr;
@property(strong,nonatomic)IBOutlet NSMatrix *photoradiobutton;
@property(strong,nonatomic)NSString *photoradiobtnidentifirestr;
@property(strong,nonatomic)NSMutableArray *photocomboboxarry;
@property(strong,nonatomic)NSString *photocomboselectedid;
@property(strong,nonatomic)NSString *photoselectedid;
//@property(strong,nonatomic)IBOutlet NSTextField *share
@property(strong,nonatomic)IBOutlet NSTextField *firstphotolbl;
@property(strong,nonatomic)IBOutlet NSTextField *secondphotolbl;





//for video
@property(strong,nonatomic)IBOutlet Swipezinesubview *showvideoview;
@property(strong,nonatomic)IBOutlet Swipezinesubview *addvideoview;
@property(strong,nonatomic)NSMutableArray *showvideoarr;
@property(strong,nonatomic)IBOutlet NSTextField *videotitle;
@property(strong,nonatomic)IBOutlet NSComboBox *videocombobox;
@property(strong,nonatomic)IBOutlet NSTableView *videotableview;
@property(strong,nonatomic)IBOutlet NSButton *savevideobtn;
@property(strong,nonatomic)IBOutlet NSButton *updatevideobtn;
@property(strong,nonatomic)IBOutlet NSButton *deletevideobtn;
@property(strong,nonatomic)NSString *videologinupdateidentifirestr;
@property(strong,nonatomic)NSString *videopagecategoryselectedid;
@property(strong,nonatomic)NSString *videoradiobtnstr;
@property(strong,nonatomic)IBOutlet QTMovie *movie;
@property(strong,nonatomic)IBOutlet QTMovieView *mMovieView;
@property(strong,nonatomic)NSURL *finalvideourl;
@property(strong,nonatomic)NSString *videourlstr;
@property(strong,nonatomic)NSString *videoselectedid;
@property(strong,nonatomic)IBOutlet NSTextField *firstvideolbl;
@property(strong,nonatomic)IBOutlet NSTextField *secondvideolbl;
@property(strong,nonatomic)IBOutlet NSTextField *sharevideourl;
@property(strong,nonatomic)NSString *sharevideourlstr;




//for audio

@property(strong,nonatomic)IBOutlet Swipezinesubview *showaudioview;
@property(strong,nonatomic)IBOutlet Swipezinesubview *addaudioview;
@property(strong,nonatomic)IBOutlet NSTableView *audiotableview;
@property(strong,nonatomic)IBOutlet NSComboBox *audiocmbbox;
@property(strong,nonatomic)IBOutlet NSButton *saveaudiobtn;
@property(strong,nonatomic)IBOutlet NSButton *updateaudiobtn;
@property(strong,nonatomic)IBOutlet NSButton *deleteaudiobtn;
@property(strong,nonatomic)NSMutableArray *showaudioarry;
@property(strong,nonatomic)IBOutlet NSTextField *audiotitle;
@property(strong,nonatomic)NSString *audiologinupdateidentifirestr;
@property(strong,nonatomic)NSString *audiocategorypageselectedid;
@property(strong,nonatomic)NSString *audioradiobtnstr;
@property(strong,nonatomic)NSString *audiourl;
@property(strong,nonatomic)IBOutlet QTMovieView *audiomovie;
@property(strong,nonatomic)NSString *audioselectedidstr;

@property(strong,nonatomic)IBOutlet NSButton *Startstopaudiobutton;
@property(strong,nonatomic)IBOutlet NSMatrix *audioradio;
@property(strong,nonatomic)IBOutlet NSMatrix *videoradio;
//@property(strong,nonatomic)IBOutlet NSMatrix *photoradio;
@property(strong,nonatomic)IBOutlet NSTextField *firstaudiolbl;
@property(strong,nonatomic)IBOutlet NSTextField *secondaudiolbl;
@property(strong,nonatomic)NSString *audioext;
@property(strong,nonatomic)IBOutlet NSTextField *shareaudiourl;
@property(strong,nonatomic)NSString *shareaudiourlstr;
@property(strong,nonatomic)IBOutlet NSImageView *audioposterimgview;
@property(strong,nonatomic)IBOutlet NSImageView *videoposterimgview;


//for setting view
@property(strong,nonatomic)IBOutlet Swipezinesubview *settsettingview;
@property(strong,nonatomic)IBOutlet NSColorWell *navbarbgcolorwell;
@property(strong,nonatomic)IBOutlet NSColorWell *navbattitlecolorwell;
@property(strong,nonatomic)IBOutlet NSColorWell *sidebarbgcolorwell;
@property(strong,nonatomic)IBOutlet NSColorWell *sidebartxtcolorwell;
@property(strong,nonatomic)IBOutlet NSColorWell *sidebaractivetxtcolorwell;
@property(strong,nonatomic)IBOutlet NSColorWell *listitembgcolorwell;
@property(strong,nonatomic)IBOutlet NSColorWell *listitemtxtcolorwell;
@property(strong,nonatomic)IBOutlet NSColorWell *articlebgcolorwell;
@property(strong,nonatomic)IBOutlet NSColorWell *articletxtcolorwell;


//Category Actions

-(IBAction)Addcatecategory:(id)sender;
-(IBAction)Save:(id)sender;
-(IBAction)Showcategory:(id)sender;
-(IBAction)chagepicture:(id)sender;
-(IBAction)deletecategory:(id)sender;
-(IBAction)Updatecategory:(id)sender;

//product Actions
-(IBAction)addProduct:(id)sender;
-(IBAction)showproduct:(id)sender;
-(IBAction)Saveproduct:(id)sender;
-(IBAction)deleteproduct:(id)sender;
-(IBAction)updateproduct:(id)sender;

//for page
-(IBAction)Showpage:(id)sender;
-(IBAction)Savepage:(id)sender;
-(IBAction)Updatepage:(id)sender;
-(IBAction)deletepage:(id)sender;
-(IBAction)addpage:(id)sender;

//for photos
-(IBAction)Showphotos:(id)sender;
-(IBAction)Addphotos:(id)sender;
-(IBAction)savephotos:(id)Sender;
-(IBAction)deletephotos:(id)sender;
-(IBAction)updatephotos:(id)sender;
-(IBAction)photoradiobtn:(id)sender;
//for video
-(IBAction)Showvideo:(id)sender;
-(IBAction)Addvideo:(id)sender;
-(IBAction)Savevideo:(id)sender;
-(IBAction)Deletevideo:(id)sender;
-(IBAction)Updatevideo:(id)sender;
-(IBAction)selectvideoradio:(id)sender;
//for audio
-(IBAction)showaudio:(id)sender;
-(IBAction)Addaudio:(id)sender;
-(IBAction)saveaudio:(id)sender;
-(IBAction)deleteaudio:(id)sender;
-(IBAction)updateaudio:(id)sender;
-(IBAction)selectaudioradio:(id)sender;
-(IBAction)changeaudio:(id)sender;
-(IBAction)play:(id)sender;
-(IBAction)soundplay:(id)sender;

//for setting view
-(IBAction)Addsetting:(id)sender;
-(IBAction)Showsetting:(id)sender;
-(IBAction)savesetting:(id)sender;
-(IBAction)opencolorpicker:(id)sender;




@end
