'use strict'

angular.module 'etimesheetApp'
.controller 'OrganizationListCtrl', ($scope, $meteor) ->
  $scope.page = 1
  $scope.perPage = 3
  $scope.sort = name_sort : 1
  $scope.orderProperty = '1'
  
  $scope.organizations = $scope.$meteorCollection () ->
    Organizations.find {deleted:0}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('organizations', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.organizationsCount = $scope.$meteorObject Counts, 'numberOfOrganizations', false

  $meteor.session 'organizationCounter'
  .bind $scope, 'page'
    
  $scope.save = () ->
    $scope.newOrganization.deleted=0
    $scope.newOrganization.isActive=1
    if $scope.form.$valid
      $scope.organizations.save $scope.newOrganization
      $scope.newOrganization = undefined
      
  $scope.remove = (organizationId) ->
    Meteor.call('organizationDelete', organizationId)
  
    
  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = name_sort: parseInt($scope.orderProperty)
