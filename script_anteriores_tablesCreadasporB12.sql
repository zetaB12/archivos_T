
create table maestros.ProtocoloGenerico(

ProtocoloGenericoID int primary Key identity not null,
Nombre varchar(50) not null,
Plantilla bit,
Uso bit,
Activo bit,
CreateBy varchar(10),
CreateDate smalldatetime,
UpdateBy varchar(10),
UpdateDate smalldatetime

)

create table maestros.ProtocoloGenericoTipoExamenDetalle(

PGTEDetalleID int primary Key identity not null,
ProtocoloGenericoID int not null,
IdTipoExamen int not null,--combo
SubTotalExamen decimal(8,2) ,
SubTotalAnalisis decimal(8,2) ,
IGV bit,
Activo bit,
CreateBy varchar(10),
CreateDate smalldatetime,
UpdateBy varchar(10),
UpdateDate smalldatetime

)


create table maestros.ProtocoloGenericoTED_Examenes(

PGTEDExamenesID int primary Key identity not null,
PGTEDetalleID int not null,
IdExamen int not null,--combo
Precio decimal(8,2) ,
Activo bit,
CreateBy varchar(10),
CreateDate smalldatetime,
UpdateBy varchar(10),
UpdateDate smalldatetime

)


create table maestros.ProtocoloGenericoTED_Analisis(

PGTEDAnalisisID int primary Key identity not null,
PGTEDetalleID int not null,
FichaAnalisisID int not null,--combo
Precio decimal(8,2) ,
Activo bit,
CreateBy varchar(10),
CreateDate smalldatetime,
UpdateBy varchar(10),
UpdateDate smalldatetime

)

-- contrato


create table maestros.Contrato(

ContratoID int primary Key identity not null,
EmpresaID int,
FechaInicio datetime, 
FechaFin datetime,
Vigencia smallint,
AlertaFinContrato smallint,
EmitirOrdServ bit,
LocalEntrega varchar(50),
ConAtencion varchar(100),
PlazosDiasEnt smallint,
FormaDePagoCont bit, 
FormaDePagoCred bit,
ImporteMinimo decimal(8,2),
LimiteDeCredito decimal(8,2),
Dias smallint,
CierreDeServ smallint,
Virtual bit,
Fisica bit,
EnvioTiempo smallint, 
Activo bit,
CreateBy varchar(10),
CreateDate smalldatetime,
UpdateBy varchar(10),
UpdateDate smalldatetime
)

create table maestros.ContratoEncargadoPagos(

EncargadoDePagoID int primary Key identity not null,
ContratoID int,
Nombre varchar(50),
Cargo int,
Activo int ,
UserId varchar(50),
CreateBy varchar(10),
CreateDate smalldatetime,
UpdateBy varchar(10),
UpdateDate smalldatetime
)

create table maestros.ContratoTelefono(

TelefonoID int primary Key identity not null,
EncargadoDePagoID int,
TipoTelefono int,
Numero varchar(50),
Activo int,
UserId varchar(50),
CreateBy varchar(10),
CreateDate smalldatetime,
UpdateBy varchar(10),
UpdateDate smalldatetime
)

create table maestros.ContratoCorreo(

CorreoID int primary Key identity not null,
EncargadoDePagoID int,
TipoCorreo int,
Correo varchar(50),
Activo int ,
UserId varchar(50),
CreateBy varchar(10),
CreateDate smalldatetime,
UpdateBy varchar(10),
UpdateDate smalldatetime
)

--odontologia

create table maestros.Odontologia(

OdontologiaID int primary Key identity not null,
PiezasMalEstado tinyint,
PiezasFaltantes tinyint,
Detalle varchar(max),
Observaciones varchar(max),
Activo bit,
UserId varchar(50),
CreateBy varchar(10),
CreateDate smalldatetime,
UpdateBy varchar(10),
UpdateDate smalldatetime
)