
param laubicacion string  = resourceGroup().location

resource webserviceplan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name:'thorserviceplan0002'
  location: laubicacion
  tags:{
    oficina:'mexico'
    departamento:'finanzas'
  }
  sku:{
        name:'F1'
        tier:'Free'
  }
}


resource servicewebapp 'Microsoft.Web/sites@2022-03-01' = {
  name:'thorwebapp0002'
  location: laubicacion
  properties:{
     serverFarmId:webserviceplan.id
     httpsOnly:true
     siteConfig:{
        cors:{
          allowedOrigins:[
            'https://www.microsoft.com'
          ]
        }
      
      }
  }
}

