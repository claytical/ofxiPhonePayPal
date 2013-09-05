ofxiPhonePayPal
===============

PayPal SDK Integration into openFrameworks on iOS

##Installation

To use this first follow the directions for installing the PayPal iOS SDK at https://github.com/paypal/PayPal-iOS-SDK
Then just copy the ofxiPhonePayPal.h and ofxiPhonePayPal.mm files into your project.

##Usage

Pretty self explanatory, but:

to connect to PayPal:
connect(API_KEY)

to pull up the PayPal payment view:
getPayment(AMOUNT_TO_SEND,CURRENCY_CODE,SHORT_DESCRIPTION,PAYER_EMAIL,RECEIVER_EMAIL);

You should modify ofxiPhonePayPal.h and comment/uncomment the production environment definition.  By default, it's set to NoNetwork.


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/claytical/ofxiphonepaypal/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

