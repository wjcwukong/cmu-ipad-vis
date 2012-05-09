//
//  ViewController.m
//  DustAndMagnets
//
//  Created by Al Wold on 5/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "MagnetView.h"
#import "DustView.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize boardView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
//	[self initializeModel];
	
	magnetViewForParticle = [NSMutableDictionary dictionary];
	dustViewForParticle = [NSMutableDictionary dictionary];
	
	self.boardView.clipsToBounds = YES;
	
	[particleSystem.magnetParticles enumerateObjectsUsingBlock:^(ParticleModel *magnet, NSUInteger idx, BOOL *stop) {
		MagnetView *magnetView = [[MagnetView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
		magnetView.particle = magnet;
		[magnetView setTextLabel:magnet.name];
		[magnetViewForParticle setValue:magnetView forKey:magnet.name];
		[self.boardView addSubview:magnetView];
	}];
	
	[particleSystem.dustParticles enumerateObjectsUsingBlock:^(ParticleModel *dust, NSUInteger idx, BOOL *stop) {
		DustView *dustView = [[DustView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
		dustView.particle = dust;
		[dustView setTextLabel:dust.name];
		dustView.label.hidden = YES;
		[dustViewForParticle setValue:dustView forKey:dust.name];
		[self.boardView addSubview:dustView];
	}];
	
//	[self initialLayout];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end