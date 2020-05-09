IMAGE_VERSION=$1

FLYWAY_VERSION=$2

# Get the version of flyway
wget -qO- https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$FLYWAY_VERSION/flyway-commandline-$FLYWAY_VERSION-linux-x64.tar.gz | tar xz

IMAGE_NAME=srsbiznas/sbt_yarn_ci:$IMAGE_VERSION

# Build the docker image
docker build  --build-arg flyway_version=$FLYWAY_VERSION --rm -t $IMAGE_NAME .

DOCKER_RUN="docker run --rm $IMAGE_NAME"

echo
echo --== Versions ==--
echo

JDK_VERSION=$($DOCKER_RUN java --version | tail -n 2 | sed 's/^[^(]*(\([^)]*\)).*/\1/g'| head -n 1)
# echo BANNER: $JDK_BANNER
# JDK_VERSION=$(echo $JDK_BANNER | tail -n 2 | head -n 1)
echo JDK Version: $JDK_VERSION

SBT_VERSION=$($DOCKER_RUN sbt --version | tail -n 1 | sed 's/^sbt script version: //g')
echo "sbt Version: $SBT_VERSION"

echo Yarn Version: $($DOCKER_RUN yarn --version)

echo Flyway Version: $($DOCKER_RUN /opt/flyway/flyway -v | sed 's/^Flyway Community Edition \(.*\) by Redgate/\1/g')
