const admin = require('firebase-admin');
const functions = require("firebase-functions");

admin.initializeApp();

const fcm = admin.messaging();

exports.senddevices = functions.firestore
  .document("orders/{id}")
  .onUpdate((change, context) => {
    const data = change.after.data();
    const previousData = change.before.data();

    const topic = 'general';
    const orderStatus = data.orderStatus;
    const deliveryStatus = data.orderDeliveryStatus;
    const previousDeliveryStatus = previousData.orderDeliveryStatus;

    if(orderStatus=='delivery' && deliveryStatus=='upcoming' && previousDeliveryStatus=='pending'){
        const userName = data.userName;
        const message = {
              notification: {
                title: 'New Order!',
                body: 'New Delivery Order from "' + userName + '" has been added.',
              },
              data: {'route': '/home'},
            };

        return fcm.sendToTopic(topic, message);
    }
  });