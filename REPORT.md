1. **Linking Rule in the Makefile**<br>
The rule:<br>
        $(TARGET): $(OBJECTS)<br>

**Explanation:**
1. This rule tells 'make' that the final target (an executable, usually stored in $(TARGET) depends on the compiled object files ($(OBJECTS)).<br>
2. When any of the object files change, 'make' will re-link them to again build the target.<br>
3. It means: take all the object files, link them together, and produce the final executable.<br>

**Difference from linking against a library:** <br>
1. In this case, the rule directly links object files you compiled in your project.<br>
2. A rule that links against a library (for example -lm for the math library ) would instead reference external precompiled code that’s already available in the system.<br>

**Example:**<br>
$(TARGET): $(OBJECTS)<br>
    $(CC) $(OBJECTS) -o $(TARGET) -lm<br>
-lm links the external math library, not just the object files you compiled yourself.<br>
----

2.**Git Tags**<br>
=> What is a git tag?<br>
1. A git tag is a reference to a specific commit in the repository’s history.<br>
2. It is used to mark important points (like a release version v1.0.0).<br>
3. Unlike branches, tags don’t move — they stay fixed on the commit they point to.<br>

=> Why is it useful?<br>
1. Helps identify stable points in project history (e.g., release versions).<br>
2. Makes it easy to roll back or rebuild a specific version.<br>
3. Useful for automation (CI/CD pipelines can deploy based on tags).<br>

=> Simple tag vs Annotated tag:<br>
**Simple tag:** Just a name pointing directly to a commit,no extra information.<br>
*git tag v1.0*<br>

**Annotated tag:** Stores additional metadata (tagger name, date, message, and can be signed), more permanent and preferred for official releases. <br>
*git tag -a v1.0 -m 'First release'* <br>
----

3. **GitHub Releases**<br>
   
=> Purpose of creating a Release:<br>
1. A Release on GitHub is a way to package and share a specific version of your project, usually tied to a git tag (like v1.0.0).<br>
2. Releases are helpful for developers and users because they represent stable snapshots of your project.<br>


=> Significance of attaching binaries:<br>
1. Attaching binaries makes it easy for end-users to download and run the program without having to build from source.<br>
2. Ensures consistency as everyone using the release gets the exact same binary, saves time for non-developers who just want to use the software.<br>
---


