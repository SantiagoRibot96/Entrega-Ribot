-- -----------------------------------------------------
-- Insercion de DATOS.
-- -----------------------------------------------------

INSERT INTO Proveedores VALUES 	(1, 'Hierro CORT', 1129584723, 'Av. Marcelo T. de Alvear 2295', 'Daniel. Perfileria de hierro. No trabajan Acero Inoxidable.'), 
								(2, 'Indartubo', 1195827406, 'Av. San Martin 991', 'Martin. Tubos más barato. Demora en la entrega. Pago 30/60.'),
								(3, 'Aceros Mitre', 1143569286, 'Av. Mitre 2351', 'Alberto. Chapa de disponibilidad rapida. Pago al contado.'),
								(4, 'FAMIC', 1194623531, 'Av. Alvarez Thomas 1200', 'Javier. Chapa y perfileria de Inoxidable. Caro pero entrega al momento.'),
								(5, 'Chatarra Lopez', 1192835241, 'Av. Hipolito Irigoyen 941', 'Roberto. Compra venta de chatarra. Suele tener buen material');

INSERT INTO Clientes VALUES		(1, 'Roman Martinez', 1192846371, 'Irigoyen 2456 dpto A'),
								(2, 'Gary Medel', 1184750236, 'Nahuel Huapi 234 SIN TIMBRE'),
								(3, 'Gabriel Batistuta', 1182751209, 'Sanabria 2834'),
								(4, 'Facundo Arana', 1184624859, 'Carlos Carranza 2483'),
								(5, 'Gabriela Mistral', 1184362542, 'Cesar Diaz 2244 timbre abajo');
                            
INSERT INTO Productos VALUES	(1, 'Barbacoa Argentina', 10000, 5),
								(2, 'Flama Asador', 15000, 10),
								(3, 'Portatil Clasica', 8000, 26),
                                (4, 'QBO', 25000, 3),
                                (5, 'Gas', 24550, 13);
                                
INSERT INTO Ventas VALUES		(1, 399, 2, 50000, 'Pendiente de Pago'),
								(2, 394, 1, 41000, 'Paga Contraentrega'),
								(3, 378, 4, 32900, 'Pagado Targeta de Credito'),
								(4, 389, 5, 20000, 'Pagado Efectivo'),
                                (5, 391, 3, 21000, 'Pendiente de Pago');

INSERT INTO Choferes VAlUES		(1, 'Fabian Quintero', 1192845721, 'Pedro Lozano 2294', 'Ford F100 roja modelo 1998', 'BAE293'),
								(2, 'Ricardo Montaner', 1182743819, 'Av. Alvarez Jonte 1233', 'Fiat Fiorino blanca modelo 2007', 'HEA856'),
                                (3, 'Benito Flores', 1192848392, 'Colombo 2389', 'Ford CAM F4000 blanca modelo 2018', 'MAM294'),
                                (4, 'Antonio Gonzales', 1192843719, 'Emilio Mitre 1294', 'Ford Transit blanca modelo 1983', 'RAP923'),
                                (5, 'Roberto Carlos', 1198285923, 'Av. Roca 1463', 'Citroen Berlingo gris modelo 2005', 'DAO259');
                                
INSERT INTO Entregas VALUES		(1, 4, 3, '2023-08-15'),
								(2, 3, 5, '2023-08-18'),
                                (3, 1, 2, '2023-08-22'),
                                (4, 2, 1, '2023-08-25'),
                                (5, 5, 4, '2023-08-28');