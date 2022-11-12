DELIMITER $$
USE `sanifersac`$$

-- funcion que busca un producto por su id(del 1 al 3) y le aplica el igv del 18%(iva de peru)
CREATE FUNCTION `func_igv` (id_producto INT)
RETURNS DECIMAL(9,2)
READS SQL DATA
BEGIN
	DECLARE igv INT;
    DECLARE search INT;
	DECLARE result DECIMAL(9,2);
    SET search = (SELECT precio FROM producto WHERE id = id_producto);
    SET igv = 18;
    SET result = search * ((igv / 100) + 1);
    RETURN result;
END$$

-- funcion que busca el total de una factura de venta por su id(del 1 al 15) y le aplica un descuento del 15%
CREATE FUNCTION `func_dscto` (id_factura INT) 
RETURNS DECIMAL(9,2)
READS SQL DATA
BEGIN
	DECLARE discount INT;
	DECLARE search INT;
	DECLARE result DECIMAL(9,2);
    SET search = (SELECT total FROM detalle_factura_venta WHERE id = id_factura);
    SET discount = 15;
    SET result = search - (search * (discount / 100));
    RETURN result;
END$$

DELIMITER ;