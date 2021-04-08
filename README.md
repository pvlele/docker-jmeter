# Docker-Jmeter
## JMeter-5.4.1 Image on Docker Hub

- Docker image for [Apache JMeter](http://jmeter.apache.org).
- This image installs plugin in run time.
- Find Images of this repo on [Docker Hub](https://hub.docker.com/r/justb4/jmeter).
- Image size - 642 MB
- Base Image - Ubuntu

## To build new jmeter image

With the script [build.sh](build.sh) you can change JMeter and Plugin version.


### Build Options

To build image locally update below parameters  in  [build.sh](build.sh) 
Default values if not passed to [build.sh](build.sh):
- **JMETER_VERSION** - JMeter version, default ``5.4.1``
- **PLUGIN_VERSION** - JMeter Plugin version, default ``1.6`` 
- **CMDRUNNER_VERSION** - CMD Runner version, default ``2.2`` 

To build image.
  ```
   sh build.sh
   ```

## Running

This image will run jmeter in non-gui mode.

1. git clone 
2. If your test needs plugin. Update  [plugins.txt](plugins.txt).
3. All the plugins need to be space seperated.
4. If your test does not require plugins, you keep [plugins.txt](plugins.txt) blank.
5. keep you .jmx file in /tests folder.
6. Update [test.sh](test.sh), if you want to pass jmeter parameters during run time.
7. Execute [run.sh](run.sh).
  ```
   sh run.sh
   ```
8. See HTML report in  tests/report/index.html and .jtl file in /test directory.

## Credits

Thanks to https://github.com/justb4/docker-jmeter
