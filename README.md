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

# Building

## Get latest version of flyway

A script has been included (`get_flyway.sh`) for downloading flyway and creating
a new Docker image with the latest packages of other dependencies.

Latest includes:
----------------

    java   | AdoptOpenJDK (build 11.0.7+10)
    flyway | 6.4.1
    sbt    | 1.3.10
    yarn   | 1.22.4
