Package.describe({
    summary: "A Symfony inspired i18n for Meteor."
});

Package.on_use(function (api) {
    api.use(['coffeescript', 'templating'], ['client', 'server']);

    api.add_files('sym-i18n.coffee', 'client');
    api.add_files('sym-i18n-collection.coffee', ['server', 'client']);
    api.add_files('sym-i18n-publication.coffee', 'server');
    api.export('i18n', ['client', 'server']);
});
