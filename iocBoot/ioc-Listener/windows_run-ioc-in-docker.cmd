@echo off
echo Your development environment Net ID is: 172.21.148.141.1.1
echo.
echo You must fully exit TwinCAT for this IOC to work.
echo Please close TwinCAT now and
pause
echo on

"C:/Program Files/Docker/Docker/resources/bin/docker.exe" run ^
        -v "c:\Repos\ads-deploy\tools\:/ads-deploy/tools" ^
        -v "C:\Repos\Tc3EventLogger_ListenerSample\\:/reg/g/pcds/epics/ioc/Tc3EventLogger_ListenerSample" ^
	-e DISPLAY=host.docker.internal:0.0 ^
	-i pcdshub/ads-deploy:latest ^
        "make -C ${ADS_IOC_PATH}/iocBoot/templates && cd '/reg/g/pcds/epics/ioc/Tc3EventLogger_ListenerSample/iocBoot/ioc-Listener' && ./st.cmd; echo 'IOC exited.'; sleep 1"
pause
