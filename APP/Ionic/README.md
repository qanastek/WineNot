# Ionic Installation Instructions

* Open a Powershell command prompt
* Install Ionic: `npm install -g @ionic/cli`
* Add `C:\Users\yanis\AppData\Roaming\npm\` to the Windows PATH
* Restart Windows
* Enjoy

# If policies issues during the installation

* Open a Powershell as Administrator an enter this command `Set-ExecutionPolicy RemoteSigned`

# After Clonning Instructions

* Install dependencies: `sudo npm i`
* Build Angular: `sudo npm run build`
* Run
  * `ionic serve`
  * OLD: `ionic cordova run android --livereload --external`
  * NEW: `ionic capacitor run android --livereload --external`
