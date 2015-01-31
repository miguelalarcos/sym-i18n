class HomeController extends RouteController
  waitOn: -> Meteor.subscribe('i18n', Session.get('i18n.language'))

Router.map ->
  @route 'home',
    path: '/'
    controller: HomeController