CREATE OR REPLACE VIEW v_factura_venta_pago as (
	select dfv.id, dfv.fecha, dfv.total, mdp.medio_de_pago 
    from detalle_factura_venta as dfv
    inner join medio_de_pago as mdp
    on dfv.id_medio_de_pago = mdp.id
);

CREATE OR REPLACE VIEW v_factura_compra_material as (
	select *
    from detalle_factura_compra
    where total > 95000
);

CREATE OR REPLACE VIEW v_material_proveedor as (
	select mat.nombre, prov.razon_social
    from material as mat
    inner join proveedor as prov
    on mat.id_proveedor = prov.id
);

CREATE OR REPLACE VIEW v_empleado_fabrica as (
	select emp.nombre, emp.apellido, emp.edad, fab.nombre_fabrica
    from empleado as emp
    inner join fabrica as fab
    on emp.id_fabrica = fab.id
    where emp.edad > 30
);

CREATE OR REPLACE VIEW v_marcacion as (
	select *
    from marcacion
    where fecha = '2022/06/27'
);