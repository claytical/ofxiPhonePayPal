//
//  ofxPayPal.mm
//  ofxPayPal
//
//  Created by Clay Ewing on 8/28/13.
//
//

#import "ofxiPhonePayPal.h"


void ofxiPhonePayPal::connect(string clientID) {
    client = ofxStringToNSString(clientID);
    [PayPalPaymentViewController setEnvironment:PAYPAL_ENVIRONMENT];
    [PayPalPaymentViewController prepareForPaymentUsingClientId:client];
    payPal = [[ofxiPhonePayPalDelegate alloc] init];
}

void ofxiPhonePayPal::getPayment(float amount, string currencyCode, string description, string payerId, string receiverEmail) {
    PayPalPayment *payment = [[PayPalPayment alloc] init];
    payment.amount = [[NSDecimalNumber alloc] initWithFloat:10];
    
    payment.currencyCode = ofxStringToNSString(currencyCode);
    payment.shortDescription = ofxStringToNSString(description);
    
    // Check whether payment is processable.
    if (!payment.processable) {
        // If, for example, the amount was negative or the shortDescription was empty, then
        // this payment would not be processable. You would want to handle that here.
    }
    // Start out working with the test environment! When you are ready, remove this line to switch to live.
    [PayPalPaymentViewController setEnvironment:PAYPAL_ENVIRONMENT];
    
    // Provide a payerId that uniquely identifies a user within the scope of your system,
    // such as an email address or user ID.
    NSString *payer = ofxStringToNSString(payerId);
    NSString *receiver = ofxStringToNSString(receiverEmail);
    
    // Create a PayPalPaymentViewController with the credentials and payerId, the PayPalPayment
    // from the previous step, and a PayPalPaymentDelegate to handle the results.
    _view = [[[UIView alloc] init] retain];
    PayPalPaymentViewController *paymentViewController;
    paymentViewController = [[PayPalPaymentViewController alloc] initWithClientId:client
                                                                    receiverEmail:receiver
                                                                          payerId:payer
                                                                          payment:payment
                                                                         delegate:payPal];
    
    _view = paymentViewController.view;
    _view.tag = 100;
    [ofxiPhoneGetGLView() addSubview:_view];

}

void ofxiPhonePayPal::paymentComplete() {
    [[ofxiPhoneGetGLView() viewWithTag:100] removeFromSuperview];

}
void ofxiPhonePayPal::paymentCancelled() {
    [[ofxiPhoneGetGLView() viewWithTag:100] removeFromSuperview];
}

void ofxiPhonePayPal::paymentVerified() {
    
}

@implementation ofxiPhonePayPalDelegate
@synthesize delegate;

- (void)payPalPaymentDidComplete:(PayPalPayment *)completedPayment{
    delegate->paymentComplete();
}

- (void)payPalPaymentDidCancel{
    delegate->paymentCancelled();
}

- (void)verifyCompletedPayment:(PayPalPayment *)completedPayment{
}

@end