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
    flyway | 5.1.4
    scala  | 2.12.6
    sbt    | 1.2.1
    yarn   | 1.9.4
