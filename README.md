# Docker-Jmeter
## JMeter-5.4.1 Image on Docker Hub

- Docker image for [Apache JMeter](http://jmeter.apache.org).
- This image installs the plugin in run time.
- Find an image of this repo on [Docker Hub](https://hub.docker.com/r/pvlele/jmeter).
- Image size - 642 MB
- Base Image - Ubuntu

## To build a new JMeter image

With the script [build.sh](build.sh) you can change JMeter and Plugin version.


### Build Options

To build image locally update below parameters  in  [build.sh](build.sh) <br/> Default values if not passed to [build.sh](build.sh):
- **JMETER_VERSION** - JMeter version, default ``5.4.1``
- **PLUGIN_VERSION** - JMeter Plugin version, default ``1.6`` 
- **CMDRUNNER_VERSION** - CMD Runner version, default ``2.2`` 

To build the image.
  ```
   sh build.sh
   ```

## Running

This image will run jmeter in non-gui mode.

1. git clone https://github.com/pvlele/docker-jmeter.git
2. If your test needs plugins. Update  [plugins.txt](plugins.txt).
3. All the plugins need to be space-separated. See example  [plugins.txt](plugins.txt)
4. If your test does not require plugins, you keep [plugins.txt](plugins.txt) blank.
5. keep your .jmx file in /tests folder. 
6. Update [test.sh](test.sh), if you want to pass JMeter parameters during run time. See example [test.sh](test.sh) 'From line numner 17'
7. Execute [run.sh](run.sh).
  ```
   sh run.sh
   ```
8. See HTML report in  tests/report/index.html and .jtl file in /test directory.

## Credits

Thanks to https://github.com/justb4/docker-jmeter
