//
//  ParticleModel.m
//  DustAndMagnets
//
//  Created by Al Wold on 5/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ParticleModel.h"

@interface ParticleModel ()
@property (nonatomic, retain) NSMutableDictionary *strengthByAttribute;
@end

@implementation ParticleModel

@synthesize name;
@synthesize strengthByAttribute;
@synthesize enabled;
@synthesize scaleFactor;

- (ParticleModel*)initWithName:(NSString*)inName strengthByAttribute:(NSMutableDictionary*)inStrengthByAttribute
{
    self = [super init];
    if (self) {
        self.name = inName;
        self.strengthByAttribute = inStrengthByAttribute ? inStrengthByAttribute : [NSMutableDictionary dictionary];
		self.scaleFactor = 1;
        self.enabled = YES;
    }
    return self;
}

- (NSArray*)attributes
{
    NSArray *attributes = self.strengthByAttribute.allKeys;
    NSArray *sortedAttributes = [attributes sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    return sortedAttributes;
}

+ (ParticleModel*)particleModelWithName:(NSString*)inName  strengthByAttribute:(NSMutableDictionary*)inStrengthByAttribute
{
    ParticleModel *result = [[ParticleModel alloc] initWithName:inName strengthByAttribute:inStrengthByAttribute];
    return result;
}

- (double)strengthForAttribute:(NSString *)attribute
{
	double strength = 0;
    if (attribute) {
        strength = ((NSNumber*)[self.strengthByAttribute objectForKey:attribute]).doubleValue;
    }
    return strength;
}

@end
