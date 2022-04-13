@echo off
git reset --hard HEAD
git fetch --all
git pull --all
git checkout main --force
curl https://nvdbapiles-v3.atlas.vegvesen.no/dokumentasjon/openapi/openapi.yaml --output openapi2.yaml
git add openapi.yaml
git commit -m "%Date:~10,4%-%Date:~4,2%-%Date:~7,2%"
git push origin
git checkout fix-errors --force --force
git rebase main
git push origin --force

REM %USERPROFILE%\.nuget\packages\nswag.msbuild\13.15.10\tools\NetCore31\dotnet-nswag.exe openapi2csclient /input:openapi.yaml /className:Client.cs /namespace:NVDB.Client