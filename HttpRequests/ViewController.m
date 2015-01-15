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
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://carering.herokuapp.com/profile/1"]];

    
//    NSMutableURLRequest *postRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://carering.herokuapp.com/register"]];
//    [postRequest setHTTPMethod:@"POST"];

//    NSDictionary* jsonDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
//                                    @"Value1", @"Key1",
//                                    @"Value2", @"Key2",
//                                    nil];
//    NSError *error;
//    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary
//                                                       options:NSJSONWritingPrettyPrinted error:&error];
    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    if(connection){
        self.nameLabel.text = @"Connecting....";
    } else {
        //error
    }
    
}

- (IBAction)getData:(id)sender {
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://carering.herokuapp.com/ring/1"]];
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    if(connection){
        self.nameLabel.text = @"Connecting....";
    } else {
        //error
    }
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    self.response = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //NSLog(@"%@", self.response);
    [connection cancel];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"%@", json);
//    NSString *firstName = [json objectForKey:@"first_name"];
//    NSString *lastName = [json objectForKey:@"last_name"];
//    NSString *fullName = [NSString stringWithFormat:@"%@ %@",firstName, lastName];
//    self.nameLabel.text = fullName;
    
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"Server responded");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
