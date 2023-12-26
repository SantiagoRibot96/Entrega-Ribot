-- -----------------------------------------------------
-- Funciones.
-- -----------------------------------------------------

-- ------- Funcion que calcula cuanto iva se pago -----------
drop function if exists  fn_IVA_Pagado ;

delimiter $$ 
	 create function fn_IVA_Pagado (iva decimal(4,2), id_venta int)
	 returns int 
	 deterministic 
	 begin
		 declare iva_Pagado int ;
		 set iva_Pagado =  
				(	
				select distinct total * iva 
				from ventas
				where ventas.id_venta = id_venta
				);
		return  iva_Pagado;   
	end$$ 
delimiter ;
 
select fn_IVA_Pagado(0.21, 3) as iva_Pagado;


drop function if exists  fn_Nombre_Cliente ;

delimiter $$ 
	 create function fn_Nombre_Cliente (id_cliente int)
	 returns VARCHAR(255) 
	 deterministic 
	 begin
		 declare nombre_cliente VARCHAR(255) ;
		 set nombre_cliente =  
				(	
				select nombre
				from clientes
				where clientes.id_cliente = id_cliente
				);
		return  nombre_cliente;
	end$$ 
delimiter ;

select fn_Nombre_Cliente(3) as nombre_cliente;

-- -----------------------------------------------------
-- Creación de Procedimientos.
-- -----------------------------------------------------

-- ------- Procedimiento que ordena clientes -----------
drop procedure if exists sp_Procedimiento_Orden;
DELIMITER //
	create procedure sp_Procedimiento_Orden (
												in columna VARCHAR(50),
												in orden VARCHAR(10),
												out p_Id_Cliente INT,
												out p_Nombre VARCHAR(255),
												out p_Telefono INT,
												out p_Direccion VARCHAR(255),
                                                out p_Mensaje VARCHAR(255)
											)
	begin
		if orden = 'desc' then
			select * 
			into p_Id_Cliente, p_Nombre, p_Telefono, p_Direccion
			from clientes
			order by columna desc
            limit 1;
            
			elseif orden = 'asc' then
				select id_cliente, nombre, telefono, direccion
				into p_Id_Cliente, p_Nombre, p_Telefono, p_Direccion
				from clientes
				order by columna asc
                limit 1;
                
			else
				set p_Mensaje = CONCAT('ERROR: el tipo de ordenamiento',orden,' no forma parte de lo posible.');
		end if;
	end//
delimiter ;

call sp_Procedimiento_Orden('id_cliente', 'asc', @p_Id_Cliente, @p_Nombre, @p_Telefono, @p_Direccion, @p_Mensaje);
select @p_Id_Cliente, @p_Nombre, @p_Telefono, @p_Direccion, @p_Mensaje;

-- sp_Procedimiento_Orden recibe como parametro la columna de la tabla clientes que se desee ordenar y si es 'asc' o 'desc'. Luego arroja a travez de p_Id_Cliente, p_Nombre, p_Telefono y p_Direccion el primer registro. p_Mensaje muestra en caso de error

-- ------- Procedimiento que inserta nuevos clientes ----------
drop procedure if exists sp_Insertar;
DELIMITER //
	create procedure sp_Insertar (
										in p_Id_Cliente INT,
										in p_Nombre VARCHAR(255),
										in p_Telefono INT,
										in p_Direccion VARCHAR(255),
										out p_Mensaje VARCHAR(255)
									)
	begin
		if p_Id_Cliente = null or p_Nombre = '' or p_Telefono = null or p_direccion = '' then
			set p_Mensaje = CONCAT('ERROR: Faltan datos. Recuerde que el orden de insert es id_cliente, nombre, telefono y direccion');
            
			else
				insert into clientes values (p_Id_Cliente, p_Nombre, p_Telefono, p_Direccion);
		end if;
	end//
delimiter ;

call sp_Insertar(7, 'Alberto', 12365482, 'Av Siempre viva', @p_Mensaje);
select @p_Mensaje;

-- sp_insertar recibe como parametro id_cliente, nombre, telefono y direccion y lo inserta dentro de la tabla clientes. En caso de que algun parametro sea null arroja un mensaje de error atravez de la salida p_Mensaje
