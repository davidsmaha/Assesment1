import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _nameController= TextEditingController();
  final _emailController=TextEditingController();
  final _messageController= TextEditingController();


  String _Gender='Male';
  bool _IsSuscribed=false;
  String _displayMessage = '';

  void _submitfrom() {
    final name = _nameController.text;
    final email = _emailController.text;
    final message = _messageController.text;


    if (name.isEmpty || email.isEmpty || message.isEmpty) {
     setState(() {
       _displayMessage="please fill all the fields";
     });
     return;
    }
    if (!email.contains('@') || !email.contains('.')) {
      setState(() {
        _displayMessage="Please enter a valid email";
      });
      return;
    }
    setState(() {
      _displayMessage ="Form Submitted!\nName: $name\nGender: $_Gender\nEmail: $email\nSubscribed:${_IsSuscribed ? 'Yes' : 'No'}";
    });

    }

    void _clearFrom(){
    _messageController.clear();
    _emailController.clear();
    _nameController.clear();
    setState(() {
      _Gender="Male";
      _IsSuscribed=false;
      _displayMessage = '';
    });

    }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
             decoration: InputDecoration(labelText: "Name"),
        ),
            SizedBox(height:10),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email"),
        ),
            SizedBox(height:10),
            TextField(
              controller: _messageController,
              decoration: InputDecoration(labelText: "Message"),
            ),
            SizedBox(height:10),
            Row(
              children: [
                Expanded(child: RadioListTile(
                  title: Text("Male"),
                    value: "Male",
                    groupValue: _Gender,
                    onChanged: (value){
                    setState(() =>_Gender=value!);

                    },
                    ),
                ),
                Expanded(child: RadioListTile(
                  title: Text("Female"),
                    value: "Female",
                    groupValue: _Gender ,
                    onChanged: (value) {
                      setState(() => _Gender = value!);
                    },
                ),
                ),
              ],
            ),
        Row(
          children: [
            Checkbox(value: _IsSuscribed, onChanged: (value){
              setState(() =>_IsSuscribed=value!);
            },
            ),
            Text("Suscribe to newsletter"),
          ],
        ),
      SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: _submitfrom,
            child: Text("submit"),
          ),
          ElevatedButton(
            onPressed: _clearFrom,
            child: Text("Clear"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          )
        ],
      ),

          SizedBox(height: 20),
      Text(
        _displayMessage,
        style: TextStyle(color: Colors.black, fontSize: 16),

      )
  ],
  ),

      )
    );
  }
}
