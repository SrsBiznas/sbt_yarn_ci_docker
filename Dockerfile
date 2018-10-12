# This dockerfile pre-caches some of the tools used for the CI process
# for React + Play stacks

FROM openjdk:latest

# Snapshot this for the description
RUN java -version

# Ensure flyway is present
COPY flyway-* /opt/flyway

# Add sbt repo
RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
RUN apt-get update


# Add yarn repo for the react components
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update

RUN apt-get install sbt yarn -y

# Useful for caching the baseline scala dependencies
COPY cached_deps.sbt /build.sbt
RUN sbt sbtVersion
# This will force both the compile deps and the test deps
RUN sbt test
RUN rm -f build.sbt
RUN yarn --version
