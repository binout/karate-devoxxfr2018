#!/bin/bash

curl https://search.maven.org/remotecontent?filepath=com/intuit/karate/karate-core/0.7.0.1/karate-core-0.7.0.1.jar --output karate.jar
java -cp karate.jar com.intuit.karate.ui.App