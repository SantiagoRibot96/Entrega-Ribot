-- -----------------------------------------------------
-- Triggers!
-- -----------------------------------------------------

drop table if  exists LOG_AUDITORIA;
CREATE TABLE IF NOT EXISTS LOG_AUDITORIA 
(
ID_LOG INT AUTO_INCREMENT ,
CAMPONUEVO_CAMPOANTERIOR VARCHAR(500) ,
NOMBRE_DE_ACCION VARCHAR(10) ,
NOMBRE_TABLA VARCHAR(50) ,
USUARIO VARCHAR(100) ,
FECHA_UPD_INS_DEL DATE ,
HORA_UPD_INS_DEL TIME , 
PRIMARY KEY (ID_LOG)
)
;

-- ------- Trigger para cuando se modifica una entrega (after) ----------
drop trigger if exists trg_After_Modifica_Entrega;

delimiter //
create trigger trg_After_Modifica_Entrega
	after update
    on entregas
    for each row
begin
    insert into LOG_AUDITORIA (CAMPONUEVO_CAMPOANTERIOR, NOMBRE_DE_ACCION, NOMBRE_TABLA, USUARIO, FECHA_UPD_INS_DEL, HORA_UPD_INS_DEL) values (concat('Dato nuevo: id_entrega: ', new.id_entrega, ' id_venta: ', new.id_venta, ' id_chofer: ', new.id_chofer, ' fecha_entrega: ', new.fecha_entrega, ' // Dato viejo: id_entrega: ', old.id_entrega, ' id_venta: ', old.id_venta, ' id_chofer: ', old.id_chofer, ' fecha_entrega: ', old.fecha_entrega), 'update', 'entregas', current_user(), current_date(), now());
end//
delimiter ;

update entregas set id_chofer = 5 where id_entrega = 2;
select * from LOG_AUDITORIA;

-- ------- Trigger para cuando se elimina un proveedor (before) ----------
drop trigger if exists trg_Before_Elimina_Proveedor;

delimiter //
create trigger trg_Before_Elimina_Proveedor
	before delete
    on proveedores
    for each row
begin
	insert into LOG_AUDITORIA (CAMPONUEVO_CAMPOANTERIOR, NOMBRE_DE_ACCION, NOMBRE_TABLA, USUARIO, FECHA_UPD_INS_DEL, HORA_UPD_INS_DEL) values (concat('Dato viejo: id_proveedor: ', old.id_proveedor, ' nombre: ', old.nombre, ' telefono: ', old.telefono, ' direccion: ', old.direccion, ' comentario: ', old.comentario), 'delete', 'proveedores', current_user(), current_date(), now());
end//
delimiter ;

-- INSERT INTO Proveedores VALUES 	(1, 'Hierro CORT', 1129584723, 'Av. Marcelo T. de Alvear 2295', 'Daniel. Perfileria de hierro. No trabajan Acero Inoxidable.');
delete from proveedores where id_proveedor = 1;
select * from LOG_AUDITORIA;