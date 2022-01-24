# Deliverzler

A new open source Delivery App for Restaurants created using Flutter with Firebase, Google Maps, Local Notifications, FCM Notifications, Riverpod State-Management and Modular Architecture with MVVM.

## ScreenShots

<p align="center">
    <img src="1" alt="Image" width="260"/>
</p>

## Features

* Using Modular MVVM Architecture, Custom widgets and Clean reusable code.
* Using Riverpod as a state management.
* Using Firebase Firestore as a backend.
* Using Google Maps API (Place Autocomplete - Place Details - Directions).
* Using Local Notifications for location arrive notification & FCM for newly submitted orders notification.
* Using Generated Routes for Clean Navigation.
* Using GetX Ecosystem for Localization, Theming, Snackbar, etc.
* Using Responsive UI and custom classes for Sizes, Colors, Themes, etc.

## Logic
* The app can be used by multiple delivery drivers in the restaurant. Also, you can make it work for Multi-Vendor apps.
* Only login screen for employee. You should authorize them in the backend by an admin app.
* Home screen will show stream of delivery orders that are ready to be delivered "upcoming" or is delivering "onTheWay".
* Any employee can see order details and deliver "upcoming" orders.
* Employee can deliver multiple orders.
* Only the employee that are delivering the order can confirm/cancel or show map of the order.
* If the client provided his location "in the client app" it'll be loaded to the map, otherwise employee can search for the location (new session token used for every search session to reduce Google Maps bill).
* When the order arrive to the destination by (200 meter) employee responsible for the order will get local notification and will be able to confirm and call the client on the map.
* If the delivery driver location change with both (5seconds & 5meter change in distance), it'll update delivery geoPoint on the backend "for all his current deliverying orders, so the clients can listen to it" and will update map directions "for only the opened map, if any.".
* When new order is added to the backend "delivery order". All employees will get notification from FCM (works with app in foreground, background or terminated). "You will need to deploy the function attached with the project to your Firebase Cloud Functions".
* Employee can add/edit his info in the profile screen.
* App supports (English/Arabic) and you can add more languages easily.
* App supports (Light/Dark) theme modes, it changes with your device mode or you can pick your favorite theme from settings.

Give a ⭐️ if you like the project.. Thanks!