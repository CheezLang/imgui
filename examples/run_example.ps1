[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $example
)

&cheezc $example --modules ../vulkan --out bin --int bin --run