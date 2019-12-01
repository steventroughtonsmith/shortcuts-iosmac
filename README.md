### README

![Shortcuts](https://hccdata.s3.amazonaws.com/gh_shortcuts.jpg "Shortcuts")

### Setting up

1. Fork the `shortcuts-iosmac` project to your GitHub account.
2. Launch Xcode.
3. Make sure your GitHub account has been added into Preferences -> Accounts.
4. Click on "Clone an existing project".
5. Select `shortcuts-iosmac`.
6. Click on Clone.
7. Specify a folder you want to clone the repository into.
8. The `Workflow` app will have `iPhone 11 Pro Max` (or similar) automatically selected.
9. Change that to `My Mac`.
10. Click on Product -> Clean Build Folder.
11. Click on Run.
12. See "Build failed" with two errors. Click on the Red circle with a white exclamation mark in it - you see the following errors:
```
No account for team "2ZDN69KUUV". Add a new account in the Accounts preference pane or verify that your accounts have valid credentials.
No profiles for 'maccatalyst.com.highcaffeinecontent.Workflow' were found: Xcode couldn't find any Mac Catalyst App Development provisioning profiles matching 'maccatalyst.com.highcaffeinecontent.Workflow'.
```
13. Become increasingly confused/discouraged, since this repository is not shared in such a state that it is ready for non-steventhroughtonsmith usage.
14. Gather up your courage and dive in by clicking on `Show the Project Navigator` (CMD-1)
15. Double-click on the Workflow icon (blue, right below the Navigator toolbar).
16. Click on Signing & Capabilities.
17. On the row that says Team, you'll see `Unknown name (2ZDN69KUUV) all in red.` Change that to your own team.
18. Change the `Bundle Identifier` to `org.yourPreferredBundleName.Workflow` (Please remember to change the `org.yourPreferredBundleName` aspect of the Bundle Identifier to your _specific preferred Bundle identifier_.)
19. Enter http://developer.apple.com and click on `Account`, then `Certificates, IDs and Profiles`
20. Click on Profiles and then click on `+`.
21. Select `macOS App Development`. 
22. Pick `org.yourPreferredBundleName.Workflow` and click on Continue.
23. Add your certificates into the profile and click on Continue.
24. Select your computer of choice and click Continue.
25. Type a Provisioning Profile Name (I used `org.yourPreferredBundleName.Workflow`) and click on Generate.
26. Click on Download.
27. Double-click on the Provisioning Profile, and install it, you'll need your computer password to be able to proceed.
28. Return back to Xcode, and see what it says now.
29. Attempt to Run the app.
30. The app now runs, but you get an empty screen.
31. And then you give up.
