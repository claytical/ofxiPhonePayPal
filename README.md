ofxiPhonePayPal
===============

PayPal SDK Integration into openFrameworks on iOS

##Installation

To use this first follow the directions for installing the PayPal iOS SDK at https://github.com/paypal/PayPal-iOS-SDK
Then just copy the ofxiPhonePayPal.h and ofxiPhonePayPal.mm files into your project.

##Usage

Pretty self explanatory, but:

connect(<API_KEY>) gets you connected
getPayment(<amount to send>,<currency code>, <short description>, <payer's ID>, <receiver's email>);

You should modify ofxiPhonePayPal.h and comment/uncomment the production environment definition.  By default, it's set to NoNetwork.
