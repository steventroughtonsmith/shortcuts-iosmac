//
//  AppDelegate.m
//  Workflow
//
//  Created by Steven Troughton-Smith on 04/06/2019.
//  Copyright © 2019 Steven Troughton-Smith. All rights reserved.
//

#import "AppDelegate.h"
#import <UIKit/NSToolbar+UIKitAdditions.h>

#import <dlfcn.h>

extern void WFInitializeProcessWithOptions(void);

@interface NSObject (Mz)
-(id)initWithWorkflow:(id)a database:(id)b;
-(id)initWithCollection:(id)c;
-(id)defaultDatabase;
-(id)fileWithURL:(NSURL *)u options:(id)s;
-(id)initWithFile:(id)f name:(NSString *)n performMigration:(BOOL)b sourceAppIdentifier:(NSString *)s;
-(id)sharedProvider;
-(id)recordWithDescriptor:(id)d error:(NSError **)e;
-(id)initWithRecord:(id)r storageProvider:(id)s error:(NSError **)e;
-(void)preloadActionRegistryIfNeeded;
@end

@interface WFCollection : NSObject

@end

@implementation WFCollection


-(id)database
{
	return [NSClassFromString(@"WFDatabase") defaultDatabase];
}

-(id)descriptors
{
	return nil;
}

-(void)addObserver:(id)s
{
	
}

-(int)count
{
	return 1;
}

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// Override point for customization after application launch.
	
	dlopen("/System/Library/PrivateFrameworks/ActionKit.framework/ActionKit", 0x1);

	WFInitializeProcessWithOptions();
	
	UIViewController *c = [[NSClassFromString(@"WFEditableLibraryViewController") alloc] initWithCollection:[WFCollection new]];
	
	UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:c];
	
	nc.navigationBar.prefersLargeTitles = YES;
	
	self.window = [UIWindow new];
	self.window.rootViewController = nc;
	self.window.backgroundColor = [UIColor whiteColor];
	self.window.rootViewController = nc;
	self.window.windowScene.titlebar.titleVisibility = UITitlebarTitleVisibilityHidden;
	[self.window makeKeyAndVisible];

	c.navigationItem.rightBarButtonItem.action = @selector(showWF:);
	c.navigationItem.rightBarButtonItem.target= self;
	
	[NSClassFromString(@"WFHomeComposeViewController") preloadActionRegistryIfNeeded];

	return YES;
}

-(void)importWF
{
	id fileRep = [NSClassFromString(@"WFFileRepresentation") fileWithURL:[NSURL fileURLWithPath:@"/path/to/a/Shortcut.shortcut"] options:nil];

	id desc = [[NSClassFromString(@"WFWorkflowFileDescriptor") alloc] initWithFile:fileRep name:@"My Shortcut" performMigration:YES sourceAppIdentifier:@"is.workflow.my.app"];
	id provider = [NSClassFromString(@"WFFileStorageProvider") sharedProvider];

	id record = [provider recordWithDescriptor:desc error:nil];
	if (record) {
		id wflow = [[NSClassFromString(@"WFWorkflow") alloc] initWithRecord:record storageProvider:nil error:nil];
		[self showEditorForWF:wflow];
	}
}

-(void)showEditorForWF:(id)wf
{
	id db = [NSClassFromString(@"WFDatabase") defaultDatabase];

	UIViewController *edit = [[NSClassFromString(@"WFComposeViewController") alloc] initWithWorkflow:wf database:db];

	[self.window.rootViewController presentViewController:edit animated:YES completion:nil];
}

-(void)showWF:(id)sender
{
	id wf = [NSClassFromString(@"WFWorkflow") new];
	
	[self showEditorForWF:wf];
}

#pragma mark -

- (void)applicationWillResignActive:(UIApplication *)application {
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
	// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
