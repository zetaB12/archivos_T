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