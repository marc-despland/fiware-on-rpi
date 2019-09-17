db.createUser({ user: 'orion', pwd: 'orion', roles: [ { role: 'userAdminAnyDatabase', db: 'admin'}, { role: 'readWriteAnyDatabase', db: 'admin'}, {role: 'dbAdminAnyDatabase', db: 'admin'} ] } );
