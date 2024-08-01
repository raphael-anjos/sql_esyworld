SELECT TOP 1000 [Id]
      ,[Area]
      ,[Mensagem]
      ,[Data]
      ,[IdPedido]
  FROM [ECommerceAfiliados].[dbo].[LogOperacao]
where IdPedido = 10300
  order by [Id] desc