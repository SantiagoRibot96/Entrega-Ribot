-- -----------------------------------------------------
-- Vistas.
-- -----------------------------------------------------

-- ------- Vista de ventas pagadas -----------
create or replace view VW_Ventas as
(
select *
from ventas
where estado_pago like '%Pagado%'
);

select * from VW_Ventas;

-- ------- Vista de clientes deudores -----------
create or replace view VW_Clientes_Deudores as
(
select nombre, telefono, direccion, numero_factura, total
from ventas join clientes
on clientes.id_cliente = ventas.id_cliente
where estado_pago not like '%Pagado%'
);

select * from VW_Clientes_Deudores;

-- ------- Vista de proveedores de chapa -----------
create or replace view VW_Proveedores_Chapa as
(
select *
from proveedores
where comentario like '%Chapa%'
);

select * from VW_Proveedores_Chapa;

-- ------- Vista de productos con stock igual o menor a 5 -----------
create or replace view VW_Productos_Stock_Critico as
(
select *
from productos
where stock <= 5
);

select * from VW_Productos_Stock_Critico;

-- ------- Vista de entregas impagas -----------
create or replace view VW_Entregas_Impagas as
(
select id_entrega, id_chofer, fecha_entrega, total
from entregas join ventas
on ventas.id_venta = entregas.id_venta
where estado_pago not like '%Pagado%'
);

select * from VW_Entregas_Impagas;