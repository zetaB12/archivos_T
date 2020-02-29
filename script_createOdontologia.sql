USE [BD_ESCASOFT]
GO
/****** Object:  StoredProcedure [maestros].[svt_Contrato_CUD]    Script Date: 28/02/2020 15:20:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [maestros].svt_Odontologia_CUD
	
	@EntidadXML XML
AS
BEGIN	
	
	SET NOCOUNT ON
	
	DECLARE @VB INT
	DECLARE @MSG VARCHAR(500)
	declare @code varchar(100)
	declare @ID int 

	set @ID = 0 
	set @code =''
	SET @VB=0
	SET @MSG=''

	BEGIN TRY	
		
	INSERT INTO [maestros].Odontologia
           ([PiezasMalEstado]
           ,[PiezasFaltantes]
           ,[Detalle]
		   ,[Observaciones]

		   ,[Activo]
           ,[CreateBy]
		   ,[CreateDate] ) 
		SELECT					
			T.Col.value('./@PiezasMalEstado','tinyint'),	  
			T.Col.value('./@PiezasFaltantes','tinyint'),
			T.Col.value('./@Detalle','varchar(max)'),
			T.Col.value('./@Observaciones','varchar(max)'),
	
			1,
			ISNULL(T.Col.value('./@UserId','varchar(10)'),0),
			GETDATE()
		FROM @EntidadXML.nodes('/EN_Odontologia') as T(Col)
		where  T.Col.value('./@OdontologiaID','int') = 0

	
		--SET @ID=SCOPE_IDENTITY();
		
		
		----[ContratoEncargadoPagos]
		--DECLARE @CC TABLE(ID BIGINT,Hijo XML, Hijo2 xml);
		
		--MERGE INTO [maestros].ContratoEncargadoPagos AS N
		--		 USING(
		--		 SELECT 
		--		T.Col.value('./@ContratoID','int') as ContratoID,				 
		--		T.Col.value('./@Nombre','varchar(50)') as Nombre,				
		--		T.Col.value('./@Cargo','int') as Cargo,
		--		T.Col.value('./@Activo','bit')as Activo,			
		--		T.Col.query('ListaTelefonos') AS Hijo,
		--		T.Col.query('ListaCorreos') AS Hijo2		
		--		 FROM @EntidadXML.nodes('/EN_Contrato') as T(Col)
		--		 WHERE T.Col.value('./@ContratoID', 'int')=0				
		--		 ) AS S
		--		 ON 0 = 1
		--		WHEN NOT matched BY target THEN
		--		INSERT    ([ContratoID]
		--				   ,[Nombre]
		--				   ,[Cargo]
		--				   ,[Activo])
		--		VALUES(@ID,S.Nombre, S.Cargo, S.Activo)
		--		output inserted.EncargadoDePagoID,
  --              			S.Hijo, S.Hijo2
		--		INTO @CC;
				
	  
	 ----ContratoTelefono
		--	MERGE INTO [maestros].ContratoTelefono AS N
		--								USING (
		--								 SELECT 
		--								 T.ID AS EncargadoDePagoID,				 
		--								 E.Col.value('./@TipoTelefono', 'int') AS TipoTelefono,
		--								 E.Col.value('./@Numero', 'varchar(50)') AS Numero,
		--								 E.Col.value('./@Activo','bit')as Activo				
		--								 FROM 
		--								 @CC AS T
		--								 CROSS apply T.Hijo.nodes('/ListaTelefonos/EN_ContratoTelefono') AS E(Col)
		--								  WHERE E.Col.value('./@TelefonoID', 'int')=0	and  E.Col.value('./@Activo','bit') = 1 															
		--								) AS S
		--								ON 0=1
		--								WHEN NOT MATCHED BY TARGET THEN
		--								INSERT         ([EncargadoDePagoID]
		--											   ,[TipoTelefono]
		--											   ,[Numero]
		--											   ,[Activo])
		--								VALUES(S.EncargadoDePagoID, S.TipoTelefono, S.Numero, S.Activo); 
	 
	 ----ContratoCorreo
		--	 MERGE INTO [maestros].ContratoCorreo AS N
		--								USING (
		--								 SELECT 
		--								 T.ID AS EncargadoDePagoID,				 
		--								 A.Col.value('./@TipoCorreo', 'int') AS TipoCorreo,
		--								 A.Col.value('./@Correo', 'varchar(50)') AS Correo,
		--								 A.Col.value('./@Activo','bit')as Activo				
		--								 FROM 
		--								 @CC AS T
		--								 CROSS apply T.Hijo2.nodes('/ListaCorreos/EN_ContratoCorreo') AS A(Col)
		--								  WHERE A.Col.value('./@CorreoID', 'int')=0 and  A.Col.value('./@Activo','bit') = 1 														
		--								) AS S
		--								ON 0=1
		--								WHEN NOT MATCHED BY TARGET THEN
		--								INSERT         ([EncargadoDePagoID]
		--											   ,[TipoCorreo]
		--											   ,[Correo]
		--											   ,[Activo])
		--								VALUES(S.EncargadoDePagoID, S.TipoCorreo, S.Correo, S.Activo); 
	 
	

		SET @MSG='Odontologia - Registro correcto!'
		SET @VB=1

		 SELECT @MSG AS 'Descripcion',
               @VB AS 'Estado' FOR XML RAW('EN_Result')



	END TRY
	BEGIN CATCH
		SET @MSG=ERROR_MESSAGE()
		SET @VB=0
	 SELECT @MSG AS 'Descripcion',
					   @VB AS 'Estado' FOR XML RAW('EN_Result')
	END CATCH

	SET NOCOUNT OFF
END





