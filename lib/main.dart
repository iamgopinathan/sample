import 'package:flutter/material.dart';
import 'package:flutter_application_1/datatablepagination.dart';
import 'package:flutter_application_1/filterandpagination.dart';
import 'package:flutter_application_1/pagination.dart';

void main()=>runApp(new MaterialApp(
  debugShowCheckedModeBanner: false,
  home: new second(),
));



class secnd extends StatefulWidget {
  const secnd({super.key});

  @override
  State<secnd> createState() => _myappState();
}



class user{

  String ?name;
  int ?age;
  String ?role;

  user({this.name,this.age,this.role});

}

class _myappState extends State<secnd> {
List<user>users= [
  user(name: 'one',age: 20,role: 'thanjavur'),
    user(name: 'two',age: 20,role: 'thanjavur'),
      user(name: 'three',age: 20,role: 'thanjavur'),
        user(name: 'four',age: 20,role: 'thanjavur'),
          user(name: 'five',age: 20,role: 'thanjavur'),




  
  
  ];
List<user>usersFiltered = [];

TextEditingController _controller = TextEditingController();

String _searchresult='';

  @override

  void initState() {
    usersFiltered = users;
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTable search'),
      ),

      body: 
        
         SingleChildScrollView(
           child: Column(
             children: [
         
         
              //search box
         
         
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: _controller,
         
                  onChanged: (value){
         
                    setState(() {
                      _searchresult = value;
                      usersFiltered = users.where((user) =>user.name!.contains(_searchresult)||user.role!.contains(_searchresult)).toList();
                    });
                  },
         
                  
                  decoration: InputDecoration(
         
                  suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
         
         
         
         
         
         
               Container(
                width: double.infinity,
                child: DataTable(
                  columns: [
               
                    DataColumn(label: Text('Name')),
                     DataColumn(label: Text('Age')),
                      DataColumn(label: Text('Role')),
               
                  ], 
                  rows: List.generate(usersFiltered.length,(index)=>
                  
                  DataRow(
                    cells: [DataCell(Text(usersFiltered[index].name.toString())),
                  DataCell(Text(usersFiltered[index].age.toString())),
                  DataCell(Text(usersFiltered[index].role.toString())),
                  
                  
                  
                  ],
                  ),
                  
                  ),
                  
                  
                  ),
         
                 ),
             ],
           ),
         ),
      
    );
  }
}