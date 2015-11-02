# 'use strict'

# angular.module 'etimesheetApp'
# .controller 'MainCtrl', ($scope, $meteor) ->
#   $scope.page = 1
#   $scope.perPage = 3
#   $scope.sort = name_sort : 1
#   $scope.orderProperty = '1'
  
#   $scope.things = $scope.$meteorCollection () ->
#     Things.find {}, {sort:$scope.getReactively('sort')}
#   $meteor.autorun $scope, () ->
#     $scope.$meteorSubscribe('things', {
#       limit: parseInt($scope.getReactively('perPage'))
#       skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
#       sort: $scope.getReactively('sort')
#     }, $scope.getReactively('search')).then () ->
#       $scope.thingsCount = $scope.$meteorObject Counts, 'numberOfThings', false

#   $meteor.session 'thingsCounter'
#   .bind $scope, 'page'
    
#   $scope.save = () ->
#     if $scope.form.$valid
#       $scope.things.save $scope.newThing
#       $scope.newThing = undefined
      
#   $scope.remove = (thing) ->
#     $scope.things.remove thing
    
#   $scope.pageChanged = (newPage) ->
#     $scope.page = newPage
    
#   $scope.$watch 'orderProperty', () ->
#     if $scope.orderProperty
#       $scope.sort = name_sort: parseInt($scope.orderProperty)

'use strict'

angular.module('etimesheetApp').controller 'MainCtrl', ['$scope', '$meteor', '$state', ($scope, $meteor, $state) ->
  
  

  $scope.credentials =
    email: ''
    password: ''
  $scope.error = ''


  $scope.login = ()->
    
    $meteor.loginWithPassword($scope.credentials.email, $scope.credentials.password).then (->
      if($scope.credentials.email=="ghostrider_sailaab@yahoo.com" )
        console.log($scope.credentials.email,$scope.credentials.password)
        console.log("correct admin")
        $state.go 'admin'
      else
        $state.go 'employee'
    ), (err) ->
      $scope.error = 'Login error - ' + err
]