param(
    [Parameter(Mandatory=$true)][string]$proj
)

typst compile --root . $proj\main.typ