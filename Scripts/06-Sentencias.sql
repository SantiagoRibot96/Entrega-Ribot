-- -----------------------------------------------------
-- Sentencias
-- -----------------------------------------------------

create user if not exists 'ROUser'@'localhost' identified by 'ROUser123' ;
create user if not exists 'RWUser'@'localhost' identified by 'RWUser123' ;

show grants for 'ROUser'@'localhost';
show grants for 'RWUser'@'localhost';

grant select on clientes to 'ROUser'@'localhost';
grant select, insert, update on clientes to 'RWUser'@'localhost';

show grants for 'ROUser'@'localhost';
show grants for 'RWUser'@'localhost';