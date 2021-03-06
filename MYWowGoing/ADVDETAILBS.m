//
//  ADVDETAILBS.m
//  MYWowGoing
//
//  Created by zhangM on 13-4-25.
//
//

#import "ADVDETAILBS.h"
#import "ASIHTTPRequest.h"
#import "Util.h"
 
#import "JSON.h"
@implementation ADVDETAILBS
@synthesize advertisementId=_advertisementId;
-(void)dealloc{
    [_advertisementId release],_advertisementId=nil;
    [super dealloc];
}
-(id)onExecute{

    NSMutableDictionary *common = [NSMutableDictionary dictionary];
    [common setValue:[Util getLoginName] forKey:@"loginId"];
    [common setValue:[Util getPassword] forKey:@"password"];

    NSMutableDictionary *jsonreq = [NSMutableDictionary dictionary];
    [jsonreq setValue:common forKey:@"common"];
    [jsonreq setValue:[Util getDeviceId] forKey:@"deviceId"];
    [jsonreq setValue:self.advertisementId forKey:@"advertisementId"];
    [jsonreq setValue:[Util getCityName] forKey:@"cityName"];

    NSString *sbreq=nil;
    if ([[UIDevice currentDevice].systemVersion floatValue]>=5.0) {//IOS 自带 创建 JSON 数据 使用与IOS5.0以上版本
        NSError *error=nil;
        NSData *data=[NSJSONSerialization dataWithJSONObject:jsonreq options:NSJSONWritingPrettyPrinted error:&error];
        sbreq=[[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
    }else{
        SBJsonWriter *sbJsonWriter=[SBJsonWriter alloc];
        sbreq = [sbJsonWriter stringWithObject:jsonreq];
        [sbJsonWriter release];
    }

    NSString *urlString = [NSString stringWithFormat:@"%@/%@",SEVERURL,ADVERTISEMENT_DETAIL];
    ASIFormDataRequest *requestForm = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
    [requestForm setShouldContinueWhenAppEntersBackground:YES];
    [requestForm setTimeOutSeconds:10];
    [requestForm setPostValue:sbreq forKey:@"jsonReq"];
    [requestForm startSynchronous];
    return [requestForm autorelease];

}
@end
