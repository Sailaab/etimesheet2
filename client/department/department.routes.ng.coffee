'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'department-list',
    url: '/managedepartment'
    templateUrl: 'client/department/department-list.view.html'
    controller: 'DepartmentListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]

  .state 'department-detail',
    url: '/department/:departmentId'
    templateUrl: 'client/department/department-detail.view.html'
    controller: 'DepartmentDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]