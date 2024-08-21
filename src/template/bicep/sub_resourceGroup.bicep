targetScope = 'subscription'

param name object
param location string

resource resourceGroup_res 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: name.resourceGroup
  location: location
}
