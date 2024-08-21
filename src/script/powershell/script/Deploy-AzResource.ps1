# az account set -s 'Stage-DRFIT-VCDM'

$Project = 'myFirstApp'
$Environment = 'stage'
$Location = 'westeurope'
$Version = '0.0.1'

"`nResource group" | Out-Default

$output = az deployment sub create `
    --name "main" `
    --location $Location `
    --template-file "$PSScriptRoot/../../../template/bicep/sub_main.bicep" `
    --parameters `
        project=$Project `
        environment=$Environment `
        location=$Location `
        version=$Version

$output `
| Out-Default