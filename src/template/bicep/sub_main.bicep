targetScope = 'subscription'

param project string
param environment string
param location string
param version string

module namingConvention_mod '../arm/azNamingConvention_sub.json' = {
  name: '${project}-sub-nc'
  params: {
    values: {
      ENVIRONMENT: environment
      ORGANIZATION: null
      PROJECT: project
      REGION: location
      VERSION: version
    }
    graph: {
      deployment: {
        formatString: 'deployment'
        values: {
          RESOURCE_TYPE: 'resourceGroup'
        }
      }
      resourceGroup: {
        formatString: 'resourceGroup'
      }
    }
    userConfigTemplateUri: 'https://raw.githubusercontent.com/jimmieulenius/az-config/main/naming-convention/template/arm/userConfig.json'
  }
}

module resourceGroup_mod 'sub_resourceGroup.bicep' = {
  name: '${project}-rg'
  params: {
    name: namingConvention_mod.outputs
    location: location
  }
}
