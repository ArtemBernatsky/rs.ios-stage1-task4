//
//  Tree.m
//  RSSchool_T4
//
//  Created by Артем Бернацкий on 4/13/20.
//  Copyright © 2020 iOSLab. All rights reserved.
//

#import "Tree.h"

@implementation Tree

-(instancetype)init:(NSInteger)value {
    self = [super init];
    if (self) {
        self.value = value;
    }
    return self;
}

@end
