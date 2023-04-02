import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:job/screens/rating_box.dart';

import 'controllers/addpost.dart';
import 'controllers/editpost.dart';

class posts extends StatefulWidget {
  @override
  _postsState createState() => _postsState();
}

class _postsState extends State<posts> {
  final Stream<QuerySnapshot> _usersStream =
  FirebaseFirestore.instance.collection('posts').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) =>addnote()));
        },
        child: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: Text('Offers'),
        backgroundColor: Colors.green[300],

      ),
      body: StreamBuilder(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("something is wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          print(snapshot.data!.docs.length.toString()+"length");
          return Container(
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, int index) {
                final DocumentSnapshot offerSnap = snapshot.data!.docs[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/update',
                        arguments: {
                          'offer name': offerSnap['offer name'],
                          'salary': offerSnap['salary'],
                          'contrat': offerSnap['contrat'],
                          'services': offerSnap['services'],
                          'id': offerSnap.id,
                        });
                  },
                  child:Card(

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network(
                      snapshot.data!.docChanges[index].doc['images'],height:90,fit: BoxFit.cover ,width: 120,),
                          Expanded(child: Container(
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  snapshot.data!.docChanges[index].doc['offer name'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  snapshot.data!.docChanges[index].doc['salary'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                RatingBox()
                              ],
                            ),
                          ))
                        ],

                      )
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
