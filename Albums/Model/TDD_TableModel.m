//
//  TDD_TableModel.m
//  Albums
//
//  Created by Rick van Voorden on 3/19/15.
//  Copyright (c) 2015 eBay Software Foundation. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "TDD_TableModel.h"

@implementation TDD_TableModel

- (id <TDD_TableModel_JSONOperationType>)operation {
    
    return [[[[self class] jsonOperationClass] alloc] init];
    
}

@end

@implementation TDD_TableModel (Class)

+ (Class <TDD_TableModel_AlbumType>)albumClass {
    
    return [TDD_Album class];
    
}

+ (Class <TDD_TableModel_JSONOperationType>)jsonOperationClass {
    
    return [TDD_NetworkJSONOperation class];
    
}

@end

@implementation TDD_TableModel (Start)

- (void)startWithCompletionHandler:(TDD_TableModel_CompletionHandler)completionHandler {
    
    NSURL *url = [[NSURL alloc] initWithString: @"https://itunes.apple.com/us/rss/topalbums/limit=100/json"];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL: url];
    
    [[self operation] startWithRequest: request completionHandler: ^void (id json, NSError *error) {
        
        completionHandler(NO, error);
        
    }];
    
}

@end