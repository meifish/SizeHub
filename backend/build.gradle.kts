plugins {
    java
    id("org.jetbrains.kotlin.jvm") version "1.4.10"
    kotlin("plugin.serialization") version "1.4.10"
}

apply(plugin = "kotlin")
apply(plugin = "kotlinx-serialization")

tasks.withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile> {
    kotlinOptions.jvmTarget = "1.8"
}

repositories {
    mavenCentral()
    jcenter()
    google()
}

sourceSets {
    main {
        java.srcDir("src/main/kotlin")
    }
}

dependencies {
    val kotlinVersion = "1.4.10"
    implementation(kotlin("gradle-plugin", version = kotlinVersion))
    implementation(kotlin("serialization", version = kotlinVersion))
    implementation("org.jetbrains.kotlinx:kotlinx-serialization-core-jvm:1.0.0")
    implementation("org.jetbrains.kotlinx:kotlinx-serialization-core:1.0.0")
    implementation("io.ktor:ktor-server-core:1.4.1")
    implementation("io.ktor:ktor-server-netty:1.4.1")
    implementation("io.ktor:ktor-websockets:1.4.1")
    implementation("com.google.firebase:firebase-admin:7.0.1")
    implementation("com.google.firebase:firebase-admin:7.0.1")
    implementation("org.jetbrains.kotlinx:kotlinx-serialization-json:1.0.1")
}

java {
    sourceCompatibility = JavaVersion.VERSION_1_8
    targetCompatibility = JavaVersion.VERSION_1_8
}