echo off
SETLOCAL ENABLEDELAYEDEXPANSION

for %%I in (.) do set folder=%%~nxI

call set image=%%folder:.api=%%
set image
call :LoCase image

echo folder=%folder%
echo image=%image%


REM set /p image=Image: 

set registry=dockregdev.post.lt/updv
 
echo Begin to build and publish %image% to registry %registry% with docker 
 

set /p version=Version: 

set imageTag=%image%:%version% 

set repository=%registry%/%imageTag% 
 

echo Begin build docker image for repository %repository% 


docker rmi %imageTag%
docker build . -t %imageTag% --build-arg project=%folder%

docker tag %imageTag% %repository% 

echo Press any key to push repository %repository%
pause

docker push %repository% 

pause

echo Press any key to apply yaml

kubectl apply -f %image%.yaml

pause




:LoCase
:: Subroutine to convert a variable VALUE to all lower case.
:: The argument for this subroutine is the variable NAME.
SET %~1=!%~1:A=a!
SET %~1=!%~1:B=b!
SET %~1=!%~1:C=c!
SET %~1=!%~1:D=d!
SET %~1=!%~1:E=e!
SET %~1=!%~1:F=f!
SET %~1=!%~1:G=g!
SET %~1=!%~1:H=h!
SET %~1=!%~1:I=i!
SET %~1=!%~1:J=j!
SET %~1=!%~1:K=k!
SET %~1=!%~1:L=l!
SET %~1=!%~1:M=m!
SET %~1=!%~1:N=n!
SET %~1=!%~1:O=o!
SET %~1=!%~1:P=p!
SET %~1=!%~1:Q=q!
SET %~1=!%~1:R=r!
SET %~1=!%~1:S=s!
SET %~1=!%~1:T=t!
SET %~1=!%~1:U=u!
SET %~1=!%~1:V=v!
SET %~1=!%~1:W=w!
SET %~1=!%~1:X=x!
SET %~1=!%~1:Y=y!
SET %~1=!%~1:Z=z!
GOTO:EOF

