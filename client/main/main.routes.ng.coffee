'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'main',
    url: '/'
    templateUrl: 'client/main/main.view.html'
    controller: 'MainCtrl'

  .state 'admin',
    url: '/admin'
    templateUrl: 'client/admin/admin.view.html'
    controller: 'AdminCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]       

  .state 'not-verified',  
    url: '/notverified/:userId'
    templateUrl: 'client/main/not-verified.view.html'
    controller: 'NotverifiedCtrl'     
  
  .state 'employee',
    url: '/employee'
    templateUrl: 'client/employee/employee.view.html'
    controller: 'EmployeeCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]    

  .state 'timesheet',
    url: '/timesheet'
    templateUrl: 'client/employee/timesheet.view.html'
    controller: 'TimesheetCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]       

  .state 'leave',
    url: '/leave'
    templateUrl: 'client/employee/leave.view.html'
    controller: 'leaveCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ] 

  .state 'manageemployee',
    url: '/manageemployee'
    templateUrl: 'client/admin/manageemployee.view.html'
    controller: 'ManageEmployeeCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]       

  .state 'manageemployeeEdit',
      url: '/manageemployeeEdit/:userId'
      templateUrl: 'client/admin/manageemployeeEdit.view.html'
      controller: 'ManageEmployeeEditCtrl'

  .state 'LeaveCtrls',
      url: '/viewleave'
      templateUrl: 'client/admin/leave.view.html'
      controller: 'LeaveControl'

  .state 'TimesheetCtrls',
      url: '/viewtimesheet'
      templateUrl: 'client/admin/timesheet.view.html'
      controller: 'TimesheetControl'
