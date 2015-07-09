Package.describe({
    name: 'miguelalarcos:sym-i18n',
    summary: "A Symfony inspired i18n for Meteor.",
    version: '0.2.0',
    git: 'https://github.com/miguelalarcos/sym-i18n.git'
});

Package.on_use(function (api) {
    api.versionsFrom('1.0.2.1');

    api.use('coffeescript', ['client', 'server']);
    api.use('templating', 'client');
    api.use('mongo', ['client', 'server']);

    api.add_files('sym-i18n.coffee', 'client');
    api.add_files('sym-ji18n.coffee', ['client','server']);
    api.add_files('sym-i18n-collection.coffee', ['server', 'client']);
    api.add_files('sym-i18n-publication.coffee', 'server');
    api.add_files('sym-i18n-map.coffee', 'server');

    api.export('i18n', ['client', 'server']);
    api.export('ji18n', ['client','server']);
    api.export('i18n_map', 'server');
});

