'use strict'
angular.module 'etimesheetApp'
.controller 'LeaveControl', ($scope, $meteor) ->  
  
  $scope.leaveRequests = $scope.$meteorCollection () ->
    LeaveRequests.find {}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('leaveRequests', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    },{owner:$scope.dataOwner}, $scope.getReactively('search')).then () ->
      $scope.leaveRequestsCount = $scope.$meteorObject Counts, 'numberOfLeaveRequests', false
