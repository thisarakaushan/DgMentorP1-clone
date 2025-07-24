plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
   
    id("com.google.gms.google-services")
}

android {
    namespace = "com.example.dgmentorp1_clone"
    compileSdk = 35
    ndkVersion = "27.0.12077973"

    compileOptions {
         // Flag to enable support for the new language APIs
        // For AGP 4.1+
        isCoreLibraryDesugaringEnabled = true

        // Sets Java compatibility to Java 8
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }

    kotlinOptions {
        jvmTarget = "1.8"
    }

    defaultConfig {
        applicationId = "com.example.dgmentorp1_clone"

        minSdk = 23
        targetSdk = 35
        versionCode = flutter.versionCode
        versionName = flutter.versionName

        // Required when setting minSdkVersion to 20 or lower
        multiDexEnabled = true

    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

dependencies {
  // Import the Firebase BoM
  implementation(platform("com.google.firebase:firebase-bom:34.0.0"))
  implementation("com.google.firebase:firebase-analytics")

  // For AGP 7.4+
  coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}

flutter {
    source = "../.."
}
