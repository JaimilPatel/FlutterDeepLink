# Flutter DeepLink
# Branch Io Link Generation and Listen In Flutter.
<br>
<b>Initial Setup For Branch Io For Both Platforms :- </b><br> 
<b>Visit :</b> https://medium.com/@jaimil.dev8819/branch-io-link-generation-and-listen-in-flutter-2e96c0de07fa
<hr>
<b>You will get below message in IDE's terminal after successful configuration.</b>
<br>
------------------- Initiating Branch integration verification --------------------------- ...

1. Verifying Branch instance creation ... Passed<br>
2. Checking Branch keys ... Passed<br>
3. Verifying application package name ... Passed<br>
4. Checking Android Manifest for URI based deep link config ... Passed<br>
5. Verifying URI based deep link config with Branch dash board. ... Passed<br>
6. Verifying intent for receiving URI scheme. ... Passed<br>
7. Checking AndroidManifest for AppLink config. ... Passed<br>
8. Verifying any supported custom link domains. ... Passed<br>
9. Verifying default link domains integrations. ... Passed<br>
10. Verifying alternate link domains integrations. ... Passed Passed<br>
<br>
Successfully completed Branch integration validation. Everything looks good!<br>

Great! Comment out the 'validateSDKIntegration' line in your app. Next check your deep link routing.<br>
Append '?bnc_validate=true' to any of your app's Branch links and click it on your mobile device (not the Simulator!) to start the test.<br>
For instance, to validate a link like:<br>
<b>https://.app.link/N123456j12</b><br>
click on:<br>
<b>https://.app.link/N123456j12?bnc_validate=true</b><br>

<hr>
<b>You can see whole configuration in below images and video.</b>
<br>
1.  Home Screen<br>
2.  After clicking on centered button, branch io link will generate. You can see in the toast as well.<br>
3.  You will get generated branch io link through mail (need to use backend for sending mail).<br>
4.  After clicking on link which you have received in mail, you wil redirect to your app, then listener listen branch io link and get data from it. You can see in the text as well     in red colored font.<br>
<br>
<p float="left">
<img src="https://user-images.githubusercontent.com/52445432/96335568-2a41e600-1097-11eb-95b3-219dcd62ce71.jpeg" width="200" height="400" />
<img src="https://user-images.githubusercontent.com/52445432/96335579-4ba2d200-1097-11eb-9172-f050df8450eb.jpeg" width="200" height="400" />
<img src="https://user-images.githubusercontent.com/52445432/96335583-5a898480-1097-11eb-807d-434698ecb62a.jpeg" width="200" height="400" />
<img src="https://user-images.githubusercontent.com/52445432/96335591-6aa16400-1097-11eb-9a90-d2c7eac27851.jpeg" width="200" height="400" />
</p>
<hr>
<b>Full Video</b>
<br>
<img src="https://user-images.githubusercontent.com/52445432/96335615-96bce500-1097-11eb-91d2-cdfdaa114f00.gif" width="200" height="400" />

For more info : jaimil.dev8819@gmail.com

 Firebase Url shortner Api so helfpul for Referal Would like to Update it android SDK 31.
