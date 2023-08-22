# Deliverzler

An open-source Delivery App for Restaurants built on Flutter using Domain-Driven Design (DDD) and
Layered Architecture along with Riverpod Framework, Firebase as backend, Navigation 2.0 (GoRouter),
Google Maps, Live Tracking, Local Notifications, FCM Notifications, Cloud Functions, Flutter Hooks,
Freezed, RxDart, FpDart and more.

### Architecture Diagram:

<p align="left">
    <img src="/.github/images/architecture_diagram.png" alt="Image" width="600"/>
</p>

### Folder Structure:

- lib
  - features
    - feature1
      - presentation
        - screens
        - components
        - providers (all providers that have observable state used by the view)
      - domain
        - entities, aggregates and value objects
        - services (encapsulate application and business logic, if any)
      - infrastructure
        - repos and facades
        - dtos
        - data_sources

_Note_: This is my current approach and architecture. In addition, the repository includes other
branches that implement TDD and Clean Architecture approach if you're interested:

- clean-arch branch: TDD and Clean Architecture approach using Riverpod 2.0 with code generation.
- clean-arch-no-code-gen branch: TDD and Clean Architecture approach using Riverpod 2.0 without code
  generation.

## ScreenShots

<p align="left">
    <img src="/.github/images/ss_01.png" alt="Image" width="600"/>
    <img src="/.github/images/ss_02.png" alt="Image" width="600"/>
    <img src="/.github/images/ss_03.png" alt="Image" width="600"/>
    <img src="/.github/images/ss_04.png" alt="Image" width="600"/>
    <img src="/.github/images/ss_05.png" alt="Image" width="600"/>
    <img src="/.github/images/ss_06.png" alt="Image" width="600"/>
    <img src="/.github/images/ss_07.png" alt="Image" width="600"/>
    <img src="/.github/images/ss_08.png" alt="Image" width="600"/>
</p>

## Instructions to run the project

1. Create Firebase project and add it to your Flutter app (
   Follow https://firebase.google.com/docs/flutter/setup instructions).
2. Add user manually at Firebase Auth to login with (This for testing as registration should be done
   with another Admin app).
3. Add user data (id field from previous step - User UID) and some orders to show at your Firebase
   Firestore similar to the following model architecture:

<p align="center">
    <img src="/.github/images/firebase_1.png" alt="Image" width="450"/>
    <img src="/.github/images/firebase_2.png" alt="Image" width="350"/>
</p>

4. Configure an API project with the Google Maps Platform and enable Maps SDK for Android/iOS (FREE)
   to be able to open the map. Also, enable Directions/ Geolocation/Places APIs to enable other map
   features as search and live tracking (You have to create a billing account to use these APIs).
5. Add your Google Map API Key to the project (search for `EnterYourAndroidGoogleMapApiKey`
   and `EnterYourIOSGoogleMapApiKey`).
6. [Optional]: deploy functions within the project to Firebase Cloud Functions to receive FCM
   notifications when new order is ready to be delivered.
7. Run the project!

## Features

- Using Riverpod Framework with code generation (Most recommended) integrated with Flutter Hooks &
  Freezed.
- Simplified Layered architecture by relying on Riverpod to catch exceptions and auto convert it to
  AsyncError instead of the traditional Result/Either pattern, which reduce lots of boilerplate
  code.
- Navigation 2.0 (declarative routing) with GoRouter using the code generation variant and
  implementing nested navigation.
- Functional Programming: FpDart(Option in particular) & RxDart.
- Firebase Firestore as the backend with Firebase Storage, FCM and Cloud Functions.
- Receive Local notification when arrive client's location and the ability to call him or confirm
  the order.
- Receive FCM notification in (Foreground/Background/Terminated) when new order is ready to be
  delivered.
- Real-Time Changes from Firebase using Streams, Refreshing current stream capability.
- Optimized live location tracking using RxDart and updating delivery data on changes.
- Search places and update its information on map using Google Map Autocomplete & Place Details.
- Live tracking on map using Place Directions, Perform actions when arrive client's location.
- Responsive UI, Platform-Aware Widgets, Multi-Themes, Internationalization & Localization (Using
  Flutter without external packages).
- Well documented features and Unit Tests.

## Business Logic

- The app can be used by multiple delivery drivers in the restaurant. Also, you can make it work for
  Multi-Vendor apps.
- Only login screen for employee. You should authorize them in the backend by an admin app.
- Home screen will show stream of delivery orders that are ready to be delivered `upcoming` or is
  delivering `onTheWay`.
- Any employee can see order details and deliver `upcoming` orders.
- Employee can deliver multiple orders.
- Only the employee that are delivering the order can confirm/cancel or show map of the order.
- If the client provided his location "in the client app" it'll be loaded to the map, otherwise
  employee can search for the location (new session token used for every search session to reduce
  Google Maps bill).
- When the order arrive to the destination by (200 meter) employee responsible for the order will
  get local notification and will be able to confirm and call the client on the map.
- If the delivery driver location changed with both (5seconds & 50meter change in distance), it'll
  update delivery geoPoint on the backend (for all his current delivering orders, so the clients
  can listen to it) and will update map directions (for only the opened map, if any).
- When new order is added to the backend (delivery order). All employees will get notification from
  FCM (works with app in foreground, background or terminated).
- Employee can add/edit his info at the profile screen.

---

**Appreciation**: I was inspired by [@RandalSchwartz](https://github.com/RandalSchwartz) to adopt
and implement DDD Layered architecture with Riverpod Framework.
Also, ResoCoder’s DDD course (outdated) was a helpful start point to get some ideas about
implementing DDD Layered architecture in Flutter.

Give a ⭐️ if you like the project.. Thanks!
