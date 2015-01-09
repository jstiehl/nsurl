//
//  ViewController.m
//  HttpRequests
//
//  Created by James Stiehl on 1/5/15.
//  Copyright (c) 2015 James Stiehl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   self.nameLabel.text = @"Push Button";
    
}

- (IBAction)getData:(id)sender {
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://carering.herokuapp.com/profile/jstiehl@hobo.com"]];
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    if(connection){
        self.nameLabel.text = @"Connecting....";
    } else {
        //error
    }
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    self.response = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"%@", [json objectForKey:@"first_name"]);
    NSString *firstName = [json objectForKey:@"first_name"];
    NSString *lastName = [json objectForKey:@"last_name"];
    
    NSString *fullName = [NSString stringWithFormat:firstName];
    
    
    
    fullName = [fullName stringByAppendingString:lastName];
    
    self.nameLabel.text = fullName;
    
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"Server responded");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
