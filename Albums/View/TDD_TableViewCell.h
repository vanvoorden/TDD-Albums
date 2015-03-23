//
//  TDD_TableViewCell.h
//  Albums
//
//  Created by Rick van Voorden on 3/21/15.
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

@import UIKit;

#import "TDD_Album.h"
#import "TDD_NetworkImageOperation.h"

@protocol TDD_TableViewCell_AlbumType <NSObject>

@property (nonatomic, readonly) NSString *artist;
@property (nonatomic, readonly) NSString *image;
@property (nonatomic, readonly) NSString *name;

@end

@protocol TDD_TableViewCell_ImageOperationType <NSObject>

+ (id <TDD_TableViewCell_ImageOperationType>)alloc;

- (void)cancel;
- (id <TDD_TableViewCell_ImageOperationType>)init;
- (void)startWithRequest:(NSURLRequest *)request completionHandler:(TDD_NetworkImageOperation_CompletionHandler)completionHandler;

@end

@interface TDD_TableViewCell: UITableViewCell

@property (nonatomic, strong) id <TDD_TableViewCell_AlbumType> album;

@end

@interface TDD_TableViewCell (Class)

+ (Class <TDD_TableViewCell_ImageOperationType>)imageOperationClass;

@end