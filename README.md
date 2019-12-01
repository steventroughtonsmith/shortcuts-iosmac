### README

![Shortcuts](https://hccdata.s3.amazonaws.com/gh_shortcuts.jpg "Shortcuts")

### Setting up

1. Clone the repository to a folder of your choice.
2. Launch Xcode.
3. Navigate to the `shortcuts-iosmac` folder and press Open.
4. Change Building platform from iPhone to Mac.
5. Click on Run.
6. See "Build failed".
7. Click on the error displayer, and see the following errors:
```
No account for team "2ZDN69KUUV". Add a new account in the Accounts preference pane or verify that your accounts have valid credentials.
No profiles for 'maccatalyst.com.highcaffeinecontent.Workflow' were found: Xcode couldn't find any Mac Catalyst App Development provisioning profiles matching 'maccatalyst.com.highcaffeinecontent.Workflow'.
```
8. Become increasingly confused/discouraged, since this repository is not shared in such a state that it is ready for non-steventhroughtonsmith usage.
9. Gather up courage and dive in.
10. Click on "Show the Project Navigator"
11. Click on Workflow (blue icon, right below the Navigator toolbar).
12. In the center of Xcode, you will now be in the `General` tab. 
13. The `Bundle Identifier` states `com.highcaffeinecontent.Workflow`. Change that to `org.yourPreferredBundleName.Workflow` (Please remember to change the `org.yourPreferredBundleName` aspect of the Bundle Identifier to your _specific preferred Bundle identifier_.)
14. Click on Run.
15. See "Build failed" again. Two errors. They are as follows:
```
No account for team "2ZDN69KUUV". Add a new account in the Accounts preference pane or verify that your accounts have valid credentials.
No profiles for 'maccatalyst.org.yourPreferredBundleName.Workflow' were found: Xcode couldn't find any Mac Catalyst App Development provisioning profiles matching 'maccatalyst.org.yourPreferredBundleName.Workflow'.
```
16. Click on "Show the Project Navigator", then click on the `Signing & Capabilities` tab. 
17. You now see "Team: Unknown name 2ZDN69KUUV" in red (!)
18. You also see, below, the following three warnings: "No account for team 2ZDN69KUUV", "No profiles for org.yourPreferredBundleName.workflow were found" and "No profiles for 'maccatalyst.org.yourPreferredBundleName.workflow' were found.
19. Change the steventhroughtonsmith team to your team.
20. The three errors are still there, but at least you are on your team.
21. Go to `Build Settings`
22. Change the `Code Signing Identity` (all four of them) into your specific Apple Development name + account number.
23. Press Run.
24. See "Build failed" again, but with only one error, which reads as follows:
```
Workflow has conflicting provisioning settings. Workflow is automatically signed, but code signing identity Apple Development: (yourname) (your Account Number) has been manually specified. Set the code signing identity value to "Apple Development" in the build settings editor, or switch to manual signing in the Signing & Capabilities editor.
```
25. Go back to `Build Settings`, click on `All` and type in `Team` into the search bar.
26. Set the Team to your team again.




