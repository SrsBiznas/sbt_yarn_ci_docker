# This dockerfile pre-caches some of the tools used for the CI process
# for React + Play stacks
FROM adoptopenjdk/openjdk11

ARG flyway_version

# Snapshot this for the description
RUN java -version

# Ensure flyway is present
COPY flyway-$flyway_version /opt/flyway

# Ensure the RNG in non-blocking during tests
RUN sed -i.bak \
  -e "s/securerandom.source=file:\/dev\/random/securerandom.source=file:\/dev\/urandom/g" \
  -e "s/securerandom.strongAlgorithms=NativePRNGBlocking/securerandom.strongAlgorithms=NativePRNG/g" \
  $JAVA_HOME/conf/security/java.security

# GnuPG is required for adding the alternate bintray source
RUN apt-get update && apt-get install -y gnupg2

# Add sbt repo
RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
RUN apt-get update


# Add yarn repo for the react components
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update

RUN apt-get install sbt yarn -y

# pre-cache some dependencies
RUN sbt --version
