docker-machine start default
docker-machine ip
@FOR /f "tokens=*" %%i IN ('docker-machine.exe env default') DO @%%i
call docker-share mount -m default --transient
call docker-compose up -d