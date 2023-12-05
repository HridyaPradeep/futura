import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futuratask/Usermodel.dart';

class Details extends StatefulWidget {
  const Details({super.key, required this.user});
  final Usermodel user;
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    var user;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Details',
            style: TextStyle(fontSize: 30),

          ),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 13,
              ),
              Center(
                child: Text(
                  'Personal Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  widget.user.name!,
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Center(
                  child: Text(
                widget.user.username!,
                style: TextStyle(fontSize: 15),
              )),
              Divider(
                height: 18,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Address &details of users',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
              Center(child: Text(widget.user.address!.street!)),
              Center(child: Text(widget.user.address!.city!)),
              Center(child: Text(widget.user.address!.zipcode!)),
              Divider(
                height: 18,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text('Company Details',style: TextStyle(
                  fontSize: 17,fontWeight: FontWeight.bold
                ),),
              ),
              Center(child: Text(widget.user.company!.name!)),
              Center(child: Text(widget.user.company!.catchPhrase!)),
              Center(child: Text(widget.user.company!.bs!)),


            ],
          ),
        ));
  }
}
