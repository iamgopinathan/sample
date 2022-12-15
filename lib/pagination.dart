import 'package:flutter/material.dart';

class paginate extends StatefulWidget {
  const paginate({super.key});

  @override
  State<paginate> createState() => _paginateState();
}

class _paginateState extends State<paginate> {

  var Dts = dts();

  var _rowsPerPage =PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: SingleChildScrollView(
          
          scrollDirection: Axis.vertical,
          child: PaginatedDataTable(
            header: Text('datatable header'),
            
            columns: [
        
              DataColumn(label: Text('col1')),
              DataColumn(label: Text('col2')),
              DataColumn(label: Text('Start Date')),
              DataColumn(label: Text('End Date')),
              DataColumn(label: Text('Start Date')),
              DataColumn(label: Text('Start Date')),
              DataColumn(label: Text('Start Date')),
              DataColumn(label: Text('Start Date')),
              DataColumn(label: Text('Start Date')),

              
            ], 
            
            source:Dts,
        
            rowsPerPage: _rowsPerPage,
            availableRowsPerPage: [1,5,10,15 ],
            onRowsPerPageChanged: (perpage){
              setState(() {
              _rowsPerPage = perpage!;
              });
            },
        
          
            
            
             ),
        ),
      ),
    );
  }
}


class dts extends DataTableSource{
  
  DataRow getRow (int index){
    return DataRow.byIndex(index: index,cells: [


      DataCell(Text("#cell $index")),
      DataCell(Text("#cell $index")),
      DataCell(Text("#cell $index")),
      


    ]);
  }
  
  @override
  
  bool get isRowCountApproximate =>true; 
  
  @override
  
  int get rowCount => 10;
  
  @override
  
  int get selectedRowCount => 0;
}