[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $example
)
&cheezc $example --modules src ../glfw/glfw --out ./examples/bin --int ./examples/bin --run --error-source