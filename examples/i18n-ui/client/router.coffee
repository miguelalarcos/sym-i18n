class LoginController extends RouteController
  onBeforeAction: ->
    if not Meteor.user() and not Meteor.loggingIn()
      @redirect 'login'
    @next()

class @BasicController extends LoginController
  layoutTemplate: 'mainLayout'

class AdminController extends BasicController
  onBeforeAction: ->
    if not Roles.userIsInRole(Meteor.userId(), ['admin'])
      @redirect 'sorry_admin'
    @next()
  waitOn: -> Meteor.subscribe 'i18n'

class TraductorController extends BasicController
  waitOn: -> Meteor.subscribe 'i18n'

Router.map ->
  @route 'login',
    path: '/login'
    controller: RouteController
  @route 'admin',
    path: '/admin'
    controller: AdminController
  @route 'sorry_admin',
    path: '/sorry_admin'
  @route 'traductor',
    path: '/traductor'
    controller: TraductorController