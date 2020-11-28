create database TiendaJuegos;
use TiendaJuegos;

create table empresa_proveedor(
id_provedor varchar(10)primary key not null,
nombre_compania varchar(50) not null,
nombre_gerente varchar(50) not null,
direccion varchar(50) not null,
cuidad varchar(50) not null,
telefono char(10) not null
);

create table empleados(
id_empleado varchar(10) primary key not null,
Nombre varchar(20) not null,
PrimerApellido varchar(20) not null,
SegundoApellido varchar(20) not null,
Puesto enum('Administrador','Empleado') not null,
Direccion varchar(60) not null,
Ciudad varchar(15) not null,
Telefono char(10) not null,
UsuarioLogin varchar(20) not null,
Contraseña blob not null
);


create table clientes(
id_cliente varchar(10)primary key not null,
nombre varchar(50) not null,
apellidos varchar(50) not null,
fechaNacimiento date not null,
direccion varchar(50) not null,
cuidad varchar(50) not null,
telefono char(10) not null
);

create table categorias(
id_categoria varchar(10) primary key not null,
tipo varchar(50) not null
);


create table Productos(
id_producto varchar(10) primary key not null,
Nombre varchar(50) not null,
descripcion text not null,
precio decimal(10,2) not null,
exitencias int not null,
id_categoria varchar(10) not null,
id_provedor varchar(10) not null,
constraint foreign key (id_categoria)
references categorias(id_categoria),
constraint foreign key (id_provedor)
references empresa_proveedor(id_provedor)
);

create table ventas(
id_venta varchar(10)primary key not null,
fecha date not null,
id_empleado varchar(10) not null,
id_cliente varchar(10) not null,
constraint foreign key (id_empleado)
references empleados(id_empleado),
constraint foreign key (id_cliente)
references clientes(id_cliente)
);



create table detalles_venta(
id_producto varchar(10) not null,
id_venta varchar(10) not null,
fecha date not null,
cantidad int not null,
importe decimal(10,2) not null,
constraint foreign key (id_producto)
references productos(id_producto),
constraint foreign key (id_venta)
references ventas(id_venta),
primary key(id_producto, id_venta)
);

