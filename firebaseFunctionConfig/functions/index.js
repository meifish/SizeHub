const functions = require('firebase-functions');
const admin = require('firebase-admin');
const _ = require('lodash');
const { Client } = require('@elastic/elasticsearch');

admin.initializeApp(functions.config().firebase);

const env = functions.config();
const auth = {
    username: env.elasticsearch.username,
    password: env.elasticsearch.password,
};

const client = new Client({
    node: env.elasticsearch.url,
    auth: auth
})

///////////////////////////////////////////////////////////////////////////////////////
exports.createPost = functions.firestore
                        .document('ClothingItems/{PostID}')
                        .onCreate( async (snap, context) => {
                            await client.index({
                                index: 'elastic-clothingitems-new',
                                type: '_doc',
                                id: snap.id,
                                body: snap.data(),
                            })
                        });

exports.updatePost = functions.firestore
                        .document('ClothingItems/{PostID}')
                        .onUpdate( async (snap, context) => {
                            await client.index({
                                index: 'elastic-clothingitems-new',
                                type: '_doc',
                                id: snap.id,
                                body: snap.after.data(),
                            })
                        });

exports.deletePost = functions.firestore
                        .document('ClothingItems/{PostID}')
                        .onDelete( snap => {
                            client.delete({
                                index: 'elastic-clothingitems-new',
                                type: '_doc',
                                id: snap.id,
                            })
                        });
////////////////////////////////////////////////////////////////////////////////////////
exports.createUser = functions.firestore
                        .document('Users/{PostID}')
                        .onCreate( async (snap, context) => {
                            await client.index({
                                index: 'elastic-users-new',
                                type: '_doc',
                                id: snap.id,
                                body: snap.data(),
                            })
                        });

exports.updateUser = functions.firestore
                        .document('Users/{PostID}')
                        .onUpdate( async (snap, context) => {
                            await client.index({
                                index: 'elastic-users-new',
                                type: '_doc',
                                id: snap.id,
                                body: snap.after.data(),
                            })
                        });

exports.deleteUser = functions.firestore
                        .document('Users/{PostID}')
                        .onDelete( snap => {
                            client.delete({
                                index: 'elastic-users-new',
                                type: '_doc',
                                id: snap.id,
                            })
                        });
//////////////////////////////////////////////////////////////////////////////
exports.createBrand = functions.firestore
                        .document('Brands/{PostID}')
                        .onCreate( async (snap, context) => {
                            await client.index({
                                index: 'elastic-brands-new',
                                type: '_doc',
                                id: snap.id,
                                body: snap.data(),
                            })
                        });

exports.updateBrand = functions.firestore
                        .document('Brands/{PostID}')
                        .onUpdate( async (snap, context) => {
                            await client.index({
                                index: 'elastic-brands-new',
                                type: '_doc',
                                id: snap.id,
                                body: snap.after.data(),
                            })
                        });

exports.deleteBrand = functions.firestore
                        .document('Brands/{PostID}')
                        .onDelete( snap => {
                            client.delete({
                                index: 'elastic-brands-new',
                                type: '_doc',
                                id: snap.id,
                            })
                        });




// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
