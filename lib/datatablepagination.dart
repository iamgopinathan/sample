import 'package:flutter/material.dart';

class pagination extends StatefulWidget {

  @override
  State<pagination> createState() => _paginationState();
}

class _paginationState extends State<pagination> {

  

  var tablerow = new TableRow();

  List<int> item = [5,10,25];


  @override
  Widget build(BuildContext context) {

    int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
    return Scaffold(
      appBar: AppBar(
        title: Text('pagination'),
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: PaginatedDataTable(
            header: Text('pagination example'),

            rowsPerPage: _rowsPerPage,

            availableRowsPerPage: [1,5,10,15 ],
            onRowsPerPageChanged: (perpage){

               if (perpage != null) {
              setState(() {
                _rowsPerPage = perpage;
              });
            }

            },

            



          
            
            
            
            columns: [

              DataColumn(label: Text('country')),
              DataColumn(label: Text('code')),
              DataColumn(label: Text('continent')),
        
            ],

            source: tablerow,

            
        
           
          ),
        ),
      ),
    );
  }
}


class TableRow extends DataTableSource{
  @override
  
  DataRow? getRow(int index) {
    
    return DataRow.byIndex(index : index,cells: [

      DataCell(Text("gopinathan")),
      DataCell(Text("gopinathan")),
      DataCell(Text("gopinathan")),

    ],
    );

  
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => true;

  

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
  
  @override
  // TODO: implement rowCount
  int get rowCount => 2;


}