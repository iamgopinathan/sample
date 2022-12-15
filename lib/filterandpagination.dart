


import 'package:flutter/material.dart';
import 'package:flutter_application_1/data.dart';


void main() {
  runApp(const second());
}

class second extends StatelessWidget {
  const second({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(
          title: 'Paginated DataTable with Sorting Filtering & Pagination'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool sort = true;
  List<Data>? filterData;

  onsortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        filterData!.sort((a, b) => a.taskname!.compareTo(b.taskname!));
      } else {
        filterData!.sort((a, b) => b.taskname!.compareTo(a.taskname!));
      }
    }
  }

  @override
  void initState() {
    filterData = myData;
    super.initState();
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: double.infinity,
                    child: Theme(
                      data: ThemeData.light()
                          .copyWith(cardColor: Theme.of(context).canvasColor),
                      child: PaginatedDataTable(
                        sortColumnIndex: 0,
                        sortAscending: sort,
                        header: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(12)),
                          child: TextField(
                            controller: controller,
                            decoration: const InputDecoration(
                                hintText: "Search"),
                            onChanged: (value) {
                              setState(() {
                                myData = filterData!
                                    .where((element) =>
                                        element.taskname!.contains(value))
                                    .toList();
                              });
                            },
                          ),
                        ),
                        source: RowSource(
                          myData: myData,
                          count: myData.length,
                        ),
                        rowsPerPage: 8,
                        columnSpacing: 8,
                        columns: [
                          DataColumn(
                              label: const Text(
                                "TaskID",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 14),
                              ),
                              onSort: (columnIndex, ascending) {
                                setState(() {
                                  sort = !sort;
                                });
        
                                onsortColum(columnIndex, ascending);
                              }),
                          const DataColumn(
                            label: Text(
                              "TaskName",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                          ),
                          const DataColumn(
                            label: Text(
                              "ProjectName",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                          ),
                          const DataColumn(
                            label: Text(
                              "StartDate",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                          ),
                          const DataColumn(
                            label: Text(
                              "EndDate",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                          ),
                          const DataColumn(
                            label: Text(
                              "ActualEffort",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                          ),
                          const DataColumn(
                            label: Text(
                              "EffortSpend",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                          ),
                          const DataColumn(
                            label: Text(
                              "Status",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                          ),
                          const DataColumn(
                            label: Text(
                              "Action",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ),
                
              ],
            ),
          ),
        )
        );
  }
}

class RowSource extends DataTableSource {
  var myData;
  final count;
  RowSource({
    required this.myData,
    required this.count,
  });

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      return recentFileDataRow(myData![index]);
    } else
      return null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}

DataRow recentFileDataRow(var data) {
  return DataRow(
    cells: [
      DataCell(Text(data.taskid ?? "Name")),
      DataCell(Text(data.taskname.toString())),
      DataCell(Text(data.projectname.toString())),
      
      DataCell(Text(data.startdate.toString())),
      DataCell(Text(data.enddate.toString())),
      DataCell(Text(data.actualeffort.toString())),
      DataCell(Text(data.efforttaken.toString())),
      DataCell(Text(data.status.toString())),
      DataCell(Text(data.action.toString())),
    ],
  );
}
