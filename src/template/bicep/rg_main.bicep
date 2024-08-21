param project string
param environment string
param location string
param version string

module namingConvention_mod '../arm/azNamingConvention_rg.json' = {
  name: '${project}-rg-nc'
  params: {

    values: {
      ENVIRONMENT: environment
      ORGANIZATION: null
      PROJECT: 'myFirstApp'
      // SUBPROJECT: 'api'
      // PROJECT_INSTANCE: 1
      REGION: 'west europe'
      // RESOURCE_INSTANCE: 1
      VERSION: '0.0.1'
      SUFFIX: 2
      DEPLOYMENT_PHASE: {
        length: 3
        seed: 'bbb'
      }
      UNIQUE: {}
    }
    graph: {
      '${project}': {
        storage: {
          account: {
            formatString: 'storageAccount'
            values: {
              SUBPROJECT: 'api'
            }
          }
        }
        vm: {
          main: {
            formatString: 'virtualMachine'
            values: {
              RESOURCE_INSTANCE: 1
            }
          }
          nic: {
            formatString: 'virtualMachine'
            values: {
              RESOURCE_INSTANCE: 1
              SUBRESOURCE: 'networkInterface'
            }
          }
        }
      }
      // resourceGroup: {
      //   resourceType: 'resourceGroup'
      // }
      // deployment: {
      //   format: 'deployment'
      //   value: {
      //     PROJECT: 'myFirstApp'
      //     VERSION: '0.0.1'
      //     DEPLOYMENT_PHASE: {}
      //     SUFFIX: 'awa'
      //   }
      // }
      // subnet: {
      //   // format: '{ENVIRONMENT}-{PROJECT}-{INSTANCE}[{-}{UNIQUE}]'
      //   format: 'subnet'
      //   // format: '{ENVIRONMENT}-{WORKLOAD}-{INSTANCE}[{-}{UNIQUE}]'
      //   value: {
      //     ENVIRONMENT: 'test'
      //     UNIQUE: {}
      //   }
      // }
    }
    // userConfig: userConfig
    // environmentTemplateUri: 'https://raw.githubusercontent.com/jimmieulenius/az-config/main/template/arm/naming-convention/environment.json'
    // formatTemplateUri: 'https://raw.githubusercontent.com/jimmieulenius/az-config/main/template/arm/naming-convention/format.json'
    userConfigTemplateUri: 'https://raw.githubusercontent.com/jimmieulenius/az-config/main/naming-convention/template/arm/userConfig.json'
  }
}
