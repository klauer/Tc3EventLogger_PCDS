@echo off
echo Starting Typhon...
echo on

"C:/Program Files/Docker/Docker/resources/bin/docker.exe" run ^
        -v "c:\Repos\ads-deploy\tools\:/ads-deploy/tools" ^
        -v "C:\Repos\Tc3EventLogger_ListenerSample\\:/reg/g/pcds/epics/ioc/Tc3EventLogger_ListenerSample" ^
	-e DISPLAY=host.docker.internal:0.0 ^
	-i pcdshub/ads-deploy:latest ^
	"cd '/reg/g/pcds/epics/ioc/Tc3EventLogger_ListenerSample/iocBoot/ioc-Publisher' && pytmc stcmd --template-path /ads-deploy/tools/templates --template typhon_display.py --only-motor """/reg/g/pcds/epics/ioc/Tc3EventLogger_ListenerSample/Tc3EventLogger_ListenerSample.tsproj""" > /tmp/display.py && echo 'Running Typhon...' && python /tmp/display.py; sleep 1"
