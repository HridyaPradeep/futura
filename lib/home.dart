

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:futuratask/provider.dart';
import 'package:provider/provider.dart';

import 'details view.dart';


class Homess extends StatefulWidget {
  const Homess({super.key});

  @override

  State<Homess> createState() => _HomessState();
}

class _HomessState extends State<Homess> {
  @override
  void initState() {


    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final Usermodel=Provider.of<Userprovider>(context,listen: false);
    Usermodel.getDataFromAPI();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api'),
        centerTitle: true,
      ),
      body:

      Consumer<Userprovider>(
        builder: (context,userData,child){
          if(userData!.isLoading){
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blueAccent,
              ),
            );
          }
          else{
            return ListView.builder(
                itemCount: Usermodel.userlist.length,
                itemBuilder: (context,index){
                  final user=userData.userlist[index];
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 18,
                      child: Icon(Icons.person,color: Colors.white60,),

                    ),
                    title:Text('${user.id}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email:${user.email}'),

                      ],
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Details(user: user,);
                      },));
                    },
                  );

                }

            );
          }
        },
      )
    );
  }
}
