#compila una apk y guarda en la carpeta f2
mkdir f2

keytool -genkey -v -keystore ccboksa_jks.jks -keyalg RSA -keysize 2048 -validity 10000 -alias ccbolsa2

zipalign -v -p 4 my-app-unsigned.apk my-app-unsigned-aligned.apk

/Users/felipesalazar/Library/Android/sdk/build-tools/29.0.2/zipalign -v  -p 4 /Volumes/NO\ NAME/f2/app-release-unsigned.apk ccbolsa2-aligned.apk

cd f2

/Users/felipesalazar/Library/Android/sdk/build-tools/29.0.2/apksigner sign --ks /Volumes/NO\ NAME/f2/ccboksa_jks.jks --out formulario-offline-release.apk /Volumes/NO\ NAME/f2/ccbolsa2-aligned.apk 

/Users/felipesalazar/Library/Android/sdk/build-tools/29.0.2/apksigner verify /Volumes/NO\ NAME/f2/formulario-offline-release.apk 

#para eliminar el meta-inf
zip -d foo.apk META-INF/*
