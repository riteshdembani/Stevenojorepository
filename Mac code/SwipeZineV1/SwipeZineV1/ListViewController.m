//
//  ListViewController.m
//  SwipeZineV1
//
//  Created by SIPLMacMini4 on 28/02/13.
//  Copyright (c) 2013 Systematix. All rights reserved.
//

#import "ListViewController.h"
#import <Quartz/Quartz.h>
#import "NSImage+Extras.h"
#import <ParseOSX/Parse.h>


@interface ListViewController ()

@end

@implementation ListViewController
@synthesize listarry,tittletext,categoryimageview;
@synthesize descriptiontextvew;
@synthesize pricetxt,shippingtxt,categoryidtxt;

-(IBAction)addproduct:(id)sender
{
    NSImage *image=categoryimageview.image;
    NSData *imageData = [image TIFFRepresentation];
    NSBitmapImageRep* bitmap = [NSBitmapImageRep imageRepWithData: imageData];
    NSData* newData = [bitmap representationUsingType: NSPNGFileType properties: nil];
    PFFile *imageFile = [PFFile fileWithName:@"image.png" data:newData];
    [imageFile save];
    PFObject *Productinsert = [PFObject objectWithClassName:@"Products"];
    [Productinsert setObject:self.tittletext.stringValue forKey:@"Title"];
    [Productinsert setObject:self.descriptiontextvew.string forKey:@"Description"];
    [Productinsert setObject:imageFile forKey:@"ImageFile"];
    [Productinsert setObject:self.pricetxt.stringValue forKey:@"Price"];
    [Productinsert setObject:self.shippingtxt.stringValue forKey:@"ShippingPrice"];
    [Productinsert setObject:self.categoryidtxt.stringValue forKey:@"Categoryid"];
    [Productinsert save];
    
}
-(IBAction)Showcategory:(id)sender
{
    
    PFQuery *query = [PFQuery queryWithClassName:@"Category"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %ld scores. %@", objects.count,objects);
            PFObject *bigObject=[objects objectAtIndex:0];
            
            NSString *playerName = [bigObject objectForKey:@"Title"];
            
            NSLog(@"value of player name %@",playerName);
            NSString *objectId = bigObject.objectId;
            NSLog(@"object id is %@",objectId);
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}
-(IBAction)deletecategory:(id)sender{
    PFQuery *query = [PFQuery queryWithClassName:@"Category"];
    PFObject *categorydelete = [query getObjectWithId:@"ETyZ5HjF1V"];
    NSLog(@"updated value is %@",categorydelete);
    [categorydelete deleteInBackground];
    [categorydelete saveInBackground];
}
-(IBAction)Updatecategory:(id)sender
{
    PFQuery *query = [PFQuery queryWithClassName:@"Category"];
    PFObject *categoryupdate = [query getObjectWithId:@"bGA47g098X"];
    NSImage *image=categoryimageview.image;
    NSData *imageData = [image TIFFRepresentation];
    NSBitmapImageRep* bitmap = [NSBitmapImageRep imageRepWithData: imageData];
    NSData* newData = [bitmap representationUsingType: NSPNGFileType properties: nil];
    PFFile *imageFile = [PFFile fileWithName:@"image.png" data:newData];
    [imageFile save];
    [categoryupdate setObject:@"Updated Value" forKey:@"Title"];
    [categoryupdate setObject:@"This is updated" forKey:@"Description"];
    [categoryupdate setObject:imageFile forKey:@"ImageFile"];
    [categoryupdate save];
}
-(IBAction)Addcatecategory:(id)sender
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
  
}
-(IBAction)chagepicture:(id)sender
{
     [[IKPictureTaker pictureTaker] beginPictureTakerSheetForWindow:self.view.window withDelegate:self didEndSelector:@selector(pictureTakerDidEnd:returnCode:contextInfo:) contextInfo:nil];
}
- (void) pictureTakerDidEnd:(IKPictureTaker *) picker
                 returnCode:(NSInteger) code
                contextInfo:(void*) contextInfo
{
    NSImage *image = [picker outputImage];
    if( image !=nil && (code == NSOKButton) )
    {
        [self.categoryimageview setImage:image];
        
    }
   
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    self.listarry=[[NSMutableArray alloc]initWithObjects:@"Categories",@"Page",@"Products",@"Photos",@"Videos",@"Audios",@"My Oders",nil];
    NSLog(@"value of array is %@",self.listarry);
    return self;
    
}
- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    // Get a new ViewCell
    NSTableCellView *cellView = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
     
       cellView.textField.stringValue=[self.listarry objectAtIndex:row];
    return cellView;
    }
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [self.listarry count];
}

@end
