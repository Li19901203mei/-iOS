#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "AliPayAdapter.h"
#import "BCPayObjects.h"
#import "BeeCloud.h"
#import "BCAuthReq.h"
#import "BCBaseReq.h"
#import "BCBaseResp.h"
#import "BCPayReq.h"
#import "BCPayResp.h"
#import "BCPayPalReq.h"
#import "BCPayPalVerifyReq.h"
#import "BCPreRefundReq.h"
#import "BCPreRefundResp.h"
#import "BCQueryBillByIdReq.h"
#import "BCQueryBillByIdResp.h"
#import "BCQueryBillsReq.h"
#import "BCQueryBillsResp.h"
#import "BCQueryBillsCountReq.h"
#import "BCQueryBillsCountResp.h"
#import "BCQueryRefundByIdReq.h"
#import "BCQueryRefundByIdResp.h"
#import "BCQueryRefundsReq.h"
#import "BCQueryRefundsResp.h"
#import "BCQueryRefundsCountReq.h"
#import "BCQueryRefundsCountResp.h"
#import "BCRefundStatusReq.h"
#import "BCRefundStatusResp.h"
#import "BCBaseResult.h"
#import "BCQueryBillResult.h"
#import "BCQueryRefundResult.h"
#import "BCNewSubscription.h"
#import "BCSubscription.h"
#import "BCSubscriptionQuery.h"
#import "BCCategory.h"
#import "BCHTTPSessionManager.h"
#import "BCNetworking.h"
#import "BCNetworkReachabilityManager.h"
#import "BCSecurityPolicy.h"
#import "BCURLRequestSerialization.h"
#import "BCURLResponseSerialization.h"
#import "BCURLSessionManager.h"
#import "BCPayCache.h"
#import "BCPayConstant.h"
#import "BCPayUtil.h"
#import "BeeCloud+Utils.h"
#import "NSDictionary+Utils.h"
#import "NSString+IsValid.h"
#import "BeeCloudAdapter.h"
#import "BeeCloudAdapterProtocol.h"
#import "BCSandBoxAdapter.h"
#import "PaySandBoxViewController.h"
#import "UnionPayAdapter.h"
#import "UPPaymentControl.h"
#import "WXPayAdapter.h"
#import "WXApi.h"
#import "WXApiObject.h"

FOUNDATION_EXPORT double BeeCloudVersionNumber;
FOUNDATION_EXPORT const unsigned char BeeCloudVersionString[];

