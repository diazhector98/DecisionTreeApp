//
//  AppDelegate.h
//  Farmers
//
//  Created by Hector Díaz Aceves on 10/11/18.
//  Copyright © 2018 UC Davis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

