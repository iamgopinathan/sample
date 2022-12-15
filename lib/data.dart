class Data {
  String? taskid;
  String? taskname;
  String? projectname;
  String?startdate;
  String?enddate;
  String?actualeffort;
  String?efforttaken;
  String?status;
  String?action;

  Data({this.taskid,this.taskname,this.projectname
  ,this.startdate,
  this.enddate,
  this.actualeffort,
  this.efforttaken,
  this.status,
  this.action,
  });
}

List<Data> myData = [
 Data(taskid:'00123',
 taskname: 'gopi',
 projectname: 'flutter',
 startdate: '2022-09-30',
 enddate: '2022-09-01',
 actualeffort: '180',
 efforttaken: '450',
 status: 'completed',
 action: 'add timesheet',

 
 
 
 
 
 
 
 
  ),
  Data(taskid:'02',
 taskname: 'one',
 projectname: 'flutter',
 startdate: '2022-09-30',
 enddate: '2022-09-01',
 actualeffort: '180',
 efforttaken: '450',
 status: 'completed',
 action: 'add timesheet',

 
 
 
 
 
 
 
 
  )
];