'use strict'

Meteor.publish 'leaveRequests', (options,od, searchString) ->
  where =
    '_id':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
    'owner':od.owner
  Counts.publish this, 'numberOfLeaveRequests', LeaveRequests.find(where), noReady: true
  LeaveRequests.find where, options 