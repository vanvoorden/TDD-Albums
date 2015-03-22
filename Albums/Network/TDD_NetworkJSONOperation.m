//
//  TDD_NetworkJSONOperation.m
//  Albums
//
//  Created by Rick van Voorden on 3/1/15.
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

#import "TDD_NetworkJSONOperation.h"
#import "TDD_Shared.h"

@interface TDD_NetworkJSONOperation ()

@property (nonatomic, strong) id <TDD_NetworkJSONOperation_TaskType> task;

@end

@implementation TDD_NetworkJSONOperation

@synthesize task = _task;

- (void)setTask:(id<TDD_NetworkJSONOperation_TaskType>)task {
    
    TDD_PropertySetter((self->_task), task, {
        
        [(self->_task) cancel];
        
    }, {
        
        
        
    });
    
}

- (id <TDD_NetworkJSONOperation_TaskType>)task {
    
    return TDD_LazyPropertyWithClass((self->_task), [[self class] taskClass]);
    
}

@end

@implementation TDD_NetworkJSONOperation (Cancel)

- (void)cancel {
    
    [self setTask: 0];
    
}

@end

@implementation TDD_NetworkJSONOperation (Class)

+ (Class <TDD_NetworkJSONOperation_JSONHandlerType>)jsonHandlerClass {
    
    return [TDD_NetworkJSONHandler class];
    
}

+ (Class <TDD_NetworkJSONOperation_TaskType>)taskClass {
    
    return [TDD_NetworkTask class];
    
}

@end

@implementation TDD_NetworkJSONOperation (Start)

- (void)startWithRequest:(NSURLRequest *)request completionHandler:(TDD_NetworkJSONOperation_CompletionHandler)completionHandler {
    
    TDD_NetworkJSONOperation *__weak weakSelf = self;
    
    [[self task] startWithRequest: request completionHandler: ^void (NSData *data, NSURLResponse *response, NSError *error) {
        
        TDD_NetworkJSONOperation *strongSelf = weakSelf;
        
        if (strongSelf) {
            
            TDD_NetworkResponse *jsonResponse = [[TDD_NetworkResponse alloc] init];
            
            [jsonResponse setData: data];
            
            [jsonResponse setResponse: response];
            
            [jsonResponse setError: error];
            
            NSError *jsonError = 0;
            
            completionHandler([[[strongSelf class] jsonHandlerClass] jsonWithResponse: jsonResponse error: &jsonError], jsonError);
            
        }
        
    }];
    
}

@end