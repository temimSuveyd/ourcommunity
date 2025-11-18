plugins {
    id("com.android.application")
    id("kotlin-android")
    // Flutter Gradle Plugin en son eklenmeli
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.ourcommunity"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.ourcommunity"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true // Eğer paket sayısı fazla ise
    }

    signingConfigs {
        release {
            storeFile file(System.getenv("MY_KEYSTORE"))
            storePassword System.getenv("MY_STORE_PASSWORD")
            keyAlias System.getenv("MY_KEY_ALIAS")
            keyPassword System.getenv("MY_KEY_PASSWORD")
        }
    }

    buildTypes {
        release {
            signingConfig signingConfigs.release
            shrinkResources true
            minifyEnabled true
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
        }
    }
}

flutter {
    source = "../.."
}