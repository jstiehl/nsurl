//
//  ViewController.h
//  HttpRequests
//
//  Created by James Stiehl on 1/5/15.
//  Copyright (c) 2015 James Stiehl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSURLConnectionDataDelegate>

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) NSString *response;

@end

