//
//  Ninja.h
//  UITableViewJSON
//
//  Created by El Hassasna Fethi on 6/27/13.
//  Copyright (c) 2013 Fethi El Hassasna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ninja : NSObject

@property (strong, nonatomic)NSString *name;
@property (strong, nonatomic)NSString *thumbnail;
@property (strong, nonatomic)NSString *photo;
@property (strong, nonatomic)NSString *desc;

- (id)initWithName:(NSString *)aName
         thumbnail:(NSString *)aThumbnail
             photo:(NSString *)aPhoto
       description:(NSString *)aDescription;

@end
