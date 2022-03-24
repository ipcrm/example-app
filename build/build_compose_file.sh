count=10
for i in 1.8:2.17.0 1.11:2.17.0 1.8:2.16.0 1.11:2.16.0 1.8:2.15.0 1.11:2.15.0 1.8:2.14.1 1.11:2.14.1 1.8:2.13.1 1.11:2.13.1 1.8:2.12.1 1.11:2.12.1 1.8:2.11.2 1.11:2.11.2 1.8:2.10.0 1.11:2.10.0 1.8:2.9.1 1.11:2.9.1 1.8:2.8.2 1.11:2.8.2 1.8:2.7 1.11:2.7 1.8:2.6.2 1.11:2.6.2 1.8:2.5 1.11:2.5 1.8:2.4.1 1.11:2.4.1 1.8:2.3 1.11:2.3 1.8:2.2 1.11:2.2 1.8:2.1 1.11:2.1 1.8:2.0.2 1.11:2.0.2 1.8:2.0-rc2 1.11:2.0-rc2 1.8:2.0-beta9 1.11:2.0-beta9
do
  SOURCECOMPAT=$(echo $i | cut -d ':' -f 1)
  LOG4JVERSION=$(echo $i| cut -d ':' -f 2)
  PREFACE=80
  if [ $count -gt 99 ]; then
    PREFACE=8
  fi

  DOCKERFILE="build/Dockerfile11.app"
  if [ $SOURCECOMPAT == "1.8" ]; then
    DOCKERFILE="build/Dockerfile8.app"
  fi

  echo "
  log4j_${SOURCECOMPAT}_${LOG4JVERSION}:
    build:
      context: ./
      dockerfile: ${DOCKERFILE}
      args:
        SOURCE_COMPAT: \"${SOURCECOMPAT}\"
        LOG4J_VERSION: \"${LOG4JVERSION}\"
    stdin_open: true
    volumes:
      - .:/root
    tty: true
    ports:
      - \"${PREFACE}${count}:8080\""
  let count=count+1
done



