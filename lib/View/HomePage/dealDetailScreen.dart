import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventry_app/Constansts/ApisConstants.dart';
import 'package:inventry_app/Model/DealModel.dart';
import 'package:inventry_app/Model/Inventry.dart';
import 'package:inventry_app/View/Entry/AddEntry.dart';
import 'package:inventry_app/View/Property/property_Screen.dart';
import 'package:url_launcher/url_launcher.dart';

class dealDetailOption extends StatefulWidget {
  Inventry dealData;

  dealDetailOption({Key? key, required this.dealData}) : super(key: key);

  @override
  State<dealDetailOption> createState() => _dealDetailState();
}

class _dealDetailState extends State<dealDetailOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    Text(
                      "Deal Detail",
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 24.0,
                      ),
                    ),
                    SizedBox(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(
                      ApiConstans.imageInvetryBaseUrl + widget.dealData.image!),
                ),
              ),
              ListTile(
                title: Text('Property Type'),
                subtitle: Text(widget.dealData.propertyType!),
              ),
              if (widget.dealData.propertyType != "Build")
                ListTile(
                  title: Text('File Number'),
                  subtitle: Text(widget.dealData.fileNumber.toString()!),
                ),
              if (widget.dealData.propertyType != "Build")
                ListTile(
                  title: Text('Location'),
                  subtitle: Text(widget.dealData.location.toString()),
                ),
              if (widget.dealData.propertyType == "Build")
                ListTile(
                  title: Text('Property Size (Marla)'),
                  subtitle: Text(widget.dealData.propertySize.toString()),
                ),
              if (widget.dealData.propertyType == "Build")
                ListTile(
                  title: Text('Rooms'),
                  subtitle: Text(widget.dealData.rooms.toString()),
                ),
              if (widget.dealData.propertyType == "Build")
                ListTile(
                  title: Text('Bedroom'),
                  subtitle: Text(widget.dealData.bedroom.toString()),
                ),
              if (widget.dealData.propertyType == "Build")
                ListTile(
                  title: Text('BathRoom'),
                  subtitle: Text('\$${widget.dealData.bathroom.toString()}'),
                ),

              ListTile(
                title: Text('Description'),
                subtitle: Text('\$${widget.dealData.description}'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                child: ElevatedButton(
                  onPressed: _sendMessage,
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF25D366), // WhatsApp green color
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset(
                        'assets/watsapp.png',
                        // Replace with your WhatsApp icon path
                        width: 25,
                        height: 25,
                      ),
                      Text(
                        'Message on WhatsApp',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                child: ElevatedButton(
                  onPressed: (){
                    sendMobileMessage(ApiConstans.PhoneNummber);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey, // WhatsApp green color
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      Icon(Icons.message,size: 25,),
                      Text(
                        'Message on Number',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                child: ElevatedButton(
                  onPressed: (){
                    makePhoneCall(ApiConstans.PhoneNummber);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey, // WhatsApp green color
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      Icon(Icons.phone,size: 25,),
                      Text(
                        'Call on Number',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {
                    _showDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // WhatsApp green color
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Generate Request',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _sendMessage() async {
    // Define the phone number and message
    String phoneNumber =ApiConstans.PhoneNummber; // Replace with the phone number you want to message
    String message = 'Hello, this is a WhatsApp message from Flutter!';

    // Encode the message
    String url = 'https://wa.me/$phoneNumber/?text=${Uri.parse(message)}';

    // Launch the WhatsApp app with the predefined message
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void makePhoneCall(String phoneNumber) async {
    String url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void sendMobileMessage(String phoneNumber) async {
    String url = 'sms:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  Future<void> _showDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select an Option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ListYourPropertyScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Text('Continue as Seller'),
                    ],
                  ),
                ),
              ),
              Divider(),
              InkWell(
                onTap: () {

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddEntry()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Text('Continue as Buyer'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
