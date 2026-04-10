Get-ChildItem -Directory | ForEach-Object {
    typst compile --root . .\$_\main.typ
}