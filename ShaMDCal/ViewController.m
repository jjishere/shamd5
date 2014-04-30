//
//  ViewController.m
//  ShaMDCal
//
//  Created by JJ on 4/29/14.
//  Copyright (c) 2014 Jay Lei. All rights reserved.
//

#import "ViewController.h"
#import <CommonCrypto/CommonDigest.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSString *inputString = @"5555";
    NSString *inputString2 = @"332226";
    
    NSString *targetValue = @"54e9e1039bacd0406f63b82121fa4a27139e5cb6";
    
   // NSString *target2 = @"ac3478d69a3c81fa62e60f5c3696165a4e5e6ac4";
    
   // NSLog(@"test target: %@", [self sha1:@"5"]);
    
    for(int i=0; i < 4000000; i++)
    {
        NSLog(@"%i", i);
        NSString *randomNumber1 = [NSString stringWithFormat:@"%i", arc4random()%10];
        NSString *randomNumber2 = [NSString stringWithFormat:@"%i", arc4random()%10];
        NSString *randomNumber3 = [NSString stringWithFormat:@"%i", arc4random()%10];
        NSString *randomNumber4 = [NSString stringWithFormat:@"%i", arc4random()%10];
        NSString *randomNumber5 = [NSString stringWithFormat:@"%i", arc4random()%10];
        NSString *randomNumber6 = [NSString stringWithFormat:@"%i", arc4random()%10];
        
        NSString *shaString = inputString;
        
        shaString = [shaString stringByAppendingString:randomNumber1];
        shaString = [shaString stringByAppendingString:randomNumber2];
        shaString = [shaString stringByAppendingString:randomNumber3];
        shaString = [shaString stringByAppendingString:randomNumber4];
        shaString = [shaString stringByAppendingString:randomNumber5];
        shaString = [shaString stringByAppendingString:randomNumber6];
        shaString = [shaString stringByAppendingString:inputString2];
        
        if([targetValue isEqualToString:[self sha1:shaString]])
        {
            NSLog(@"input number: %@", shaString);
            break;
        }

    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString*) sha1:(NSString*)input
{
    const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:input.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
    
}

- (NSString *) md5:(NSString *) input
{
    const char *cStr = [input UTF8String];
    unsigned char digest[16];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
    
}

@end
