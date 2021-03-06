/*
 * This file was generated by the Gradle 'init' task.
 *
 * This is a general purpose Gradle build.
 * Learn how to create Gradle builds at https://guides.gradle.org/creating-new-gradle-builds
 */

plugins {
    application
    id("org.jetbrains.kotlin.jvm") version "1.3.72"
}

repositories {
    jcenter()
}

dependencies {
    implementation("org.valiktor:valiktor-core:0.12.0")
    implementation(kotlin("script-runtime"))
    implementation("org.jetbrains.kotlin:kotlin-test")
}

application {
    mainClassName = "day04_01."
}

