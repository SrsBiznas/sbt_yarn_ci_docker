scalaVersion := "2.12.7"

libraryDependencies ++= Seq(
  "org.scalatestplus.play" %% "scalatestplus-play" % "3.1.2" % Test,
  "com.typesafe.play" %% "play" % "2.6.20",
  "de.mkammerer" % "argon2-jvm" % "2.5",
  "com.typesafe.play" %% "play-slick" % "3.0.3",
  "org.flywaydb" %% "flyway-play" % "5.0.0",
  "org.postgresql" % "postgresql" % "42.2.5",
  "javax.xml.bind" % "jaxb-api" % "2.3.1",
  "com.typesafe.play" %% "play-json" % "2.6.10"
)
