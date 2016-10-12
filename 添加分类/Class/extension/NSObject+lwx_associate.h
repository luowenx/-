//
//  NSObject+lwx_associate.h
//  category中加属性
//
//  Created by luowenx on 16/3/31.
//  Copyright © 2016年 lwx. All rights reserved.
//
#define lwx_property_strong( __type, __name) \
@property (nonatomic, strong, setter=set__##__name:, getter=__##__name) __type __name;

#define lwx_def_property_strong( __type, __name) \
- (__type)__##__name   \
{ return [self lwx_getAssociatedObjectForKey:#__name]; }   \
- (void)set__##__name:(id)__##__name   \
{ [self lwx_retainAssociatedObject:__##__name forKey:#__name]; }


#import <Foundation/Foundation.h>

@interface NSObject (lwx_associate)
-lwx_getAssociatedObjectForKey:(const char*)key;
-lwx_retainAssociatedObject:(id)obj forKey:(const char *)key;
@end
