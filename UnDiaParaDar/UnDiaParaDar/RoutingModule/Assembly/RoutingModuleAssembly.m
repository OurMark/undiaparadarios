//
//  RoutingModuleAssembly.m
//  UnDiaParaDar
//
//  Created by Facundo Menzella on 7/20/15.
//  Copyright (c) 2015 ITBA. All rights reserved.
//

#import "RoutingModuleAssembly.h"
#import "SWRevealDirector.h"
#import "UDPDRouting.h"

// Ignore no selector in translation unit
#pragma clang diagnostic ignored "-Wselector"
#pragma GCC diagnostic ignored "-Wundeclared-selector"

@interface RoutingModuleAssembly ()

@property (nonatomic, strong) LoginModuleAssembly *loginModuleAssembly;

@end

@implementation RoutingModuleAssembly

- (id<Routing>) routing
{
    SEL selector = @selector(initWithDirector:withLoginModuleAssembly:);
    return [TyphoonDefinition withClass:[UDPDRouting class]
                          configuration:^(TyphoonDefinition* definition) {
                              [definition useInitializer:selector parameters:^(TyphoonMethod *initializer) {
                                  [initializer injectParameterWith:[self iphoneDirector]];
                                  [initializer injectParameterWith:self.loginModuleAssembly];
                              }];
                          }];
}

- (id<Director>) iphoneDirector
{
    SEL selector = @selector(initWithWindow:);
    return [TyphoonDefinition withClass:[SWRevealDirector class]
                          configuration:^(TyphoonDefinition* definition) {
                              [definition useInitializer:selector parameters:^(TyphoonMethod *initializer) {
                                  [initializer injectParameterWith:[UIApplication sharedApplication].keyWindow];
                              }];
                          }];
}

@end
