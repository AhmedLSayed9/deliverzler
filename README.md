# Deliverzler

An open-source Delivery App for Restaurants built on Flutter using TDD Clean Architecture and Riverpod Framework with Firebase as backend, Google Maps, Live Tracking, Local Notifications, FCM Notifications, Cloud Functions, Freezed, RxDart, FpDart and more!

## ScreenShots

<p align="left">
    <img src="https://user-images.githubusercontent.com/70890146/209392383-2ba82704-4368-48e3-af73-aefb3e0bf5fb.png" alt="Image" width="600"/>
    <img src="https://user-images.githubusercontent.com/70890146/209392926-f8ef5534-ed0f-438a-9c83-dd7e3923f266.png" alt="Image" width="600"/>
    <img src="https://user-images.githubusercontent.com/70890146/209392966-fec6b3e6-0964-4a60-bfbf-b0ee412faf92.png" alt="Image" width="600"/>
    <img src="https://user-images.githubusercontent.com/70890146/209393241-f99054e3-5e0a-4404-b056-84d6bbcc939c.png" alt="Image" width="600"/>
    <img src="https://user-images.githubusercontent.com/70890146/209393249-8f0396b2-f781-4fb4-9848-f89bbcbef25f.png" alt="Image" width="600"/>
    <img src="https://user-images.githubusercontent.com/70890146/209393548-636850f6-c899-443e-8574-ca992e6a2672.png" alt="Image" width="600"/>
    <img src="https://user-images.githubusercontent.com/70890146/209393566-0f0d08b3-850d-40f3-b628-1dd862ac7871.png" alt="Image" width="600"/>
    <img src="https://user-images.githubusercontent.com/70890146/209393582-9ab7710d-c365-4ecd-a7e9-65d5b45a71fe.png" alt="Image" width="600"/>
</p>

## Instructions to run the project

1. Create Firebase project and add it to your Flutter app (Follow https://firebase.google.com/docs/flutter/setup instructions).
2. Add user manually at Firebase Auth to login with (This for testing as registration should be done with another Admin app).
3. Add user data and some orders to show at your Firebase Firestore similar to the following model architecture:
<p align="center">
    <img src="https://user-images.githubusercontent.com/70890146/209394309-1620f4c1-be86-4bcf-952c-cc5a681e4584.png" alt="Image" width="450"/>
    <img src="https://user-images.githubusercontent.com/70890146/209394275-cfde0a43-87a0-4f7f-9e71-5043253f11ce.png" alt="Image" width="350"/>
</p>

4. Configure an API project with the Google Maps Platform and enable Maps SDK for Android/iOS (FREE) to be able to open the map. Also, enable Directions/ Geolocation/Places APIs to enable other map features as search and live tracking (You have to create a billing account to use these APIs).
5. Add your Google Map API Key to the project (search for `EnterYourAndroidGoogleMapApiKey` and `EnterYourIOSGoogleMapApiKey`).
6. [Optional]: deploy functions within the project to Firebase Cloud Functions to receive FCM notifications when new order is ready to be delivered.
7. Run the project!

## Features

* Using Riverpod Framework with code generation (Most recommended) integrated with Flutter Hooks & Freezed.

  Note: For Riverpod without code generation, check branch `no_riverpod_code_gen`.
* Enhanced clean architecture by relying on Riverpod to catch exceptions and auto convert it to AsyncError instead of the traditional Result/Either pattern, which reduce lots of boilerplate code.
* Functional Programming: FpDart(Option in particular) & RxDart.
* Firebase Firestore as the backend with Firebase Storage, FCM and Cloud Functions.
* Receive Local notification when arrive client's location and the ability to call him or confirm the order.
* Receive FCM notification in (Foreground/Background/Terminated) when new order is ready to be delivered.
* Real-Time Changes from Firebase using Streams, Refreshing current stream capability.
* Optimized live location tracking using RxDart and updating delivery data on changes.
* Search places and update its information on map using Google Map Autocomplete & Place Details.
* Live tracking on map using Place Directions, Perform actions when arrive client's location.
* Responsive UI, Platform-Aware Widgets, Multi-Themes, Internationalization & Localization (Using Flutter without external packages).
* Well documented features and Unit Tests.

## Business Logic
* The app can be used by multiple delivery drivers in the restaurant. Also, you can make it work for Multi-Vendor apps.
* Only login screen for employee. You should authorize them in the backend by an admin app.
* Home screen will show stream of delivery orders that are ready to be delivered `upcoming` or is delivering `onTheWay`.
* Any employee can see order details and deliver `upcoming` orders.
* Employee can deliver multiple orders.
* Only the employee that are delivering the order can confirm/cancel or show map of the order.
* If the client provided his location "in the client app" it'll be loaded to the map, otherwise employee can search for the location (new session token used for every search session to reduce Google Maps bill).
* When the order arrive to the destination by (200 meter) employee responsible for the order will get local notification and will be able to confirm and call the client on the map.
* If the delivery driver location changed with both (5seconds & 50meter change in distance), it'll update delivery geoPoint on the backend (for all his current deliverying orders, so the clients can listen to it) and will update map directions (for only the opened map, if any).
* When new order is added to the backend (delivery order). All employees will get notification from FCM (works with app in foreground, background or terminated).
* Employee can add/edit his info at the profile screen.

Give a ⭐️ if you like the project.. Thanks!
