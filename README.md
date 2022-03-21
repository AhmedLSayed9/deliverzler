# Deliverzler

A new open source Delivery App for Restaurants built with Flutter Framework, Firebase as backend, Multi-Module MVVM Architecture, Riverpod as State-Management, Google Maps, Local Notifications and FCM Notifications.

## ScreenShots


<p align="center">
    <img src="https://user-images.githubusercontent.com/70890146/150804003-7e99232e-62a2-4476-9bd0-84a252f64e5c.jpg" alt="Image" width="260"/>
    <img src="https://user-images.githubusercontent.com/70890146/150804300-f9e31660-2dcd-4248-9293-1480e66b9b0d.jpg" alt="Image" width="260"/>
    <img src="https://user-images.githubusercontent.com/70890146/150805840-41633938-8af7-4c3c-9cfc-7b5501ba8d17.jpg" alt="Image" width="260"/>
    <img src="https://user-images.githubusercontent.com/70890146/150806755-09462039-9c2e-4811-9612-456708260ef7.jpg" alt="Image" width="260"/>
    <img src="https://user-images.githubusercontent.com/70890146/150819811-72fee78f-3150-4e13-b9a4-51ef367151e3.jpg" alt="Image" width="260"/>
    <img src="https://user-images.githubusercontent.com/70890146/150820725-a871f74b-a15d-4352-8909-0cb44fb81f05.jpg" alt="Image" width="260"/>
    <img src="https://user-images.githubusercontent.com/70890146/150827121-034f49a2-3fd6-4113-8bc7-436206907198.jpg" alt="Image" width="260"/>
    <img src="https://user-images.githubusercontent.com/70890146/150829209-c125126e-66ee-412d-b58e-16af0fc67901.jpg" alt="Image" width="260"/>
    <img src="https://user-images.githubusercontent.com/70890146/150829669-64796698-47b1-47d2-ac54-ee1054696c09.jpg" alt="Image" width="260"/>
    <img src="https://user-images.githubusercontent.com/70890146/150832409-32a51182-2203-4dd3-8b39-ab2e34349bf6.jpg" alt="Image" width="260"/>
    <img src="https://user-images.githubusercontent.com/70890146/150836020-30f0248e-c425-4994-96a9-66fb13a12c2f.jpg" alt="Image" width="260"/>
    <img src="https://user-images.githubusercontent.com/70890146/150837083-b39e2831-c344-4913-bbf7-61eee0ec99aa.jpg" alt="Image" width="260"/>
</p>

## Features

* Using Modular MVVM Architecture, Custom widgets and Clean reusable code.
* Using Riverpod as a state management.
* Using Firebase Firestore as a backend.
* Using Google Maps API (Place Autocomplete - Place Details - Directions).
* Using Local Notifications for location arrive notification & FCM for newly submitted orders notification.
* Using Generated Routes for Clean Navigation.
* Using Flutter Localization, Theming, Snackbar, etc.
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
