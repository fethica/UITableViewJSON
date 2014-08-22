//
//  Ninja.m
//  UITableViewJSON
//
//  Created by El Hassasna Fethi on 6/27/13.
//  Copyright (c) 2013 Fethi El Hassasna. All rights reserved.
//

#import "Ninja.h"

@implementation Ninja

//The designed initializer
- (id)initWithName:(NSString *)aName
         thumbnail:(NSString *)aThumbnail
             photo:(NSString *)aPhoto
       description:(NSString *)aDescription {
    self = [super init];
    
    if (self) {
        self.name = aName;
        self.thumbnail = aThumbnail;
        self.photo = aPhoto;
        self.desc = aDescription;
    }
    
    return self;
}

- (id)initWithDictionary:(NSDictionary *)dic {
    self = [self initWithName:dic[@"name"] thumbnail:dic[@"thumbnail"] photo:dic[@"photo"] description:dic[@"description"]];
    return self;
}

- (id)init {
    self = [self initWithName:@"Undifined" thumbnail:@"Undifined" photo:@"Undifined" description:@"Undifined"];
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ : %@", self.name, self.description];
}

@end
