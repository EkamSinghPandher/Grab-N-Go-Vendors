import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
admin.initializeApp();

const db = admin.firestore();
const fcm = admin.messaging();

export const sendToDevice = functions.firestore.document('Vendors/{vendorID}/{Orders}/{OrderID}/{Messages}/{messageID}').onCreate(async snapshot=>{
    const message = snapshot.data();
    const querySnapshot = await db.collection('Students').doc(message.studentID).collection('Tokens').get();

    const tokens = querySnapshot.docs.map(snap => snap.id);
    const payload: admin.messaging.MessagingPayload = {
        notification:{
            title: "New Message",
            body: message.text,
            clickAction: 'FLUTTER_NOTIFICATION_CLICK'
        }
    };

    return fcm.sendToDevice(tokens, payload);
})