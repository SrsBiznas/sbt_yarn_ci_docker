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

    java   | OpenJDK Runtime Environment AdoptOpenJDK (build 11.0.4+11)
    flyway | 5.2.4
    scala  | 2.12.10
    sbt    | 1.3.2
    yarn   | 1.19.0
