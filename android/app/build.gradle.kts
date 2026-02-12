plugins {
    id("com.android.application")
    id("kotlin-android")
    // لازم يكون بعد الـ Android و Kotlin plugins
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}

android {
    namespace = "com.example.astro"

    // ✅ الحل للمشكلة: حدّد SDK 36 بدل flutter.compileSdkVersion
    compileSdk = 36

    // إصدار الـ NDK (خليه زي ما هو لو بيشتغل معاك تمام)
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.astro"
        minSdk = 23          // الحد الأدنى للإصدار
        targetSdk = 36       // ✅ من الأفضل توحيد targetSdk مع compileSdk
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {

            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

dependencies {
    // ✅ حزمة Firebase الرئيسية
    implementation(platform("com.google.firebase:firebase-bom:34.2.0"))

    // Firebase Analytics
    implementation("com.google.firebase:firebase-analytics")

    // لو تستخدم Firebase Authentication
    implementation("com.google.firebase:firebase-auth")

    // لو تستخدم Cloud Firestore
    implementation("com.google.firebase:firebase-firestore")
}

flutter {
    source = "../.."
}
