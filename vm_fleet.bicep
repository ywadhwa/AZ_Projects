targetScope = 'subscription'

param resourceGroupName string
param resourceGroupLocation string
param vmSize string

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
}

module VNET 'vnet.bicep' = {
  name: 'vnet'
  scope: resourceGroup
  params:{
    resourceGroupLocation: resourceGroupLocation
  }
}

module VM 'vm.bicep' = {
  name: 'VMModule'
  scope: resourceGroup
  params:{
    resourceGroupLocation: resourceGroupLocation
    vmSize: vmSize
    computerName: 'DESKTOP_AZ_104'
    adminUsername: 'Administrator'
    adminPassword: 'Wgr+)i2IkOf2#N'
    networkInterfaceId: VNET.outputs.networkInterfaceId
  }
}
