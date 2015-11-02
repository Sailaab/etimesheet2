'use strict'

angular.module 'etimesheetApp'
.controller 'ProjectDetailCtrl', ($scope, $stateParams, $meteor,$state) ->
  $scope.project = $scope.$meteorObject Projects, $stateParams.projectId
  $scope.$meteorSubscribe('projects')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.project.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error  
      )
    $state.go('projects-list')  
        
  $scope.reset = () ->
    $scope.project.reset()
