# sbt_yarn_ci

SBT/JS Continuous Integration Image
===================================

The Gitlab CI process uses docker images in a way that does not mesh
well with the way the boxfuse flyway image is intended to be run.
Due to this reason, a base image with flyway preinstalled is needed.

This image is built on openjdk:latest with the following tools installed:

  * scala
  * sbt
  * yarn
  * flyway

Latest includes:
----------------

    java   | OpenJDK Runtime Environment (build 10.0.2+13-Debian-1)
    flyway | 5.2.1
    scala  | 2.12.7
    sbt    | 1.2.6
    yarn   | 1.12.3

Cached Scala Libraries:
-----------------------

    de.mkammerer           | argon2-jvm         | 2.5
    org.flywaydb           | flyway-play        | 5.0.0
    javax.xml.bind         | jaxb-api           | 2.3.1
    com.typesafe.play      | play               | 2.6.20
    com.typesafe.play      | play-json          | 2.6.10
    com.typesafe.play      | play-slick         | 3.0.3
    org.postgresql         | postgresql         | 42.2.5
    org.scalatestplus.play | scalatestplus-play | 3.1.2
