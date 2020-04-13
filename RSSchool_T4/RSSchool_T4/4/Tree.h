//
//  Tree.h
//  RSSchool_T4
//
//  Created by Артем Бернацкий on 4/13/20.
//  Copyright © 2020 iOSLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tree : NSObject

@property (assign) NSInteger value;
@property (weak, nullable) Tree *left;
@property (weak, nullable) Tree *right;

-(instancetype _Nonnull ) init:(NSInteger) value;

@end

