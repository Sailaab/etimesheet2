'use strict'

Meteor.methods
  remove: (user) ->
    Meteor.users.update({ _id: user },{$set:{"profile.0.deleted":1}})
    console.log("comes here to the method")


  updatedesig:(designationId) ->
    Designations.update(designationId,{$set:{'deleted':1}})

  departmentDelete:(departmentId) ->
    Departments.update(departmentId,{$set:{'deleted':1}})  

  organizationDelete:(organizationId) ->
    Organizations.update(organizationId,{$set:{'deleted':1}})  

  update:(user,email, address, fname, mname, lname, conatact, secondaryemail) ->
    Meteor.users.update({ _id: user },{$set:{"emails.0.address":email}})
    Meteor.users.update({ _id: user },{$set:{"profile.0.fname":fname}})
    Meteor.users.update({ _id: user },{$set:{"profile.0.mname":mname}})
    Meteor.users.update({ _id: user },{$set:{"profile.0.lname":lname}})
    Meteor.users.update({ _id: user },{$set:{"profile.0.address":address}})
    Meteor.users.update({ _id: user },{$set:{"profile.0.contact":contact}})
    Meteor.users.update({ _id: user },{$set:{"profile.0.secondaryemail":secondaryemail}}) 