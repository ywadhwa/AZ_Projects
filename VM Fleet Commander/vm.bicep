param vmSize string
param resourceGroupLocation string
param computerName string
param adminUsername string
@secure()
param adminPassword string
param vmcount int = 2
param networkInterfaceId string


resource windowsVM 'Microsoft.Compute/virtualMachines@2020-12-01' = [for i in range(0,vmcount):{
  name: 'vm${i}'
  location: resourceGroupLocation
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    osProfile: {
      computerName: computerName
      adminUsername: adminUsername
      adminPassword: adminPassword
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2012-R2-Datacenter'
        version: 'latest'
      }
      osDisk: {
        name: 'name'
        caching: 'ReadWrite'
        createOption: 'FromImage'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterfaceId
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
        storageUri:  'storageUri'
      }
    }
  }
}]

