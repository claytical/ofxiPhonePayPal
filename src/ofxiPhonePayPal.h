//
//  ofxPayPal.h
//  ofxPayPal
//
//  Created by Clay Ewing on 8/28/13.
//
/*
        ofxiPhonePayPal.  Send money/charge with PayPal or credit cards on iOS.  If you end up using this,
        please let me know because I have no idea why someone would :)
 
        Make sure you download the PayPal SDK at https://github.com/paypal/PayPal-iOS-SDK
 
*/
#import <UIKit/UIKit.h>
#import "ofMain.h"
#import "PayPalMobile.h"
#include "ofxiPhoneExtras.h"

#define PAYPAL_ENVIRONMENT PayPalEnvironmentNoNetwork
//#define PAYPAL_ENVIRONMENT PayPalEnvironmentSandbox
//#define PAYPAL_ENVIRONMENT PayPalEnvironmentProduction


@class ofxiPhonePayPalDelegate;

class ofxiPhonePayPal {
    
public:
    NSString * client;
    void connect(string clientID);
    void getPayment(float amount, string currencyCode, string description, string payerId, string receiverEmail);
   // PayPalPaymentViewController *paymentViewController;
    void paymentComplete();
    void paymentVerified();
    void paymentCancelled();
    
    private:
        UIView *_view;
    protected:
        ofxiPhonePayPalDelegate *payPal;

};


@interface ofxiPhonePayPalDelegate : NSObject <PayPalPaymentDelegate> {
    
}
- (void)payPalPaymentDidComplete:(PayPalPayment *)completedPayment;
- (void)payPalPaymentDidCancel;
- (void)verifyCompletedPayment:(PayPalPayment *)completedPayment;
@property (nonatomic, assign) ofxiPhonePayPal *delegate;
@end


