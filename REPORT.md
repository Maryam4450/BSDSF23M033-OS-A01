**Feature-2: Multi-file Project using Make Utility**  

1.**Linking Rule in the Makefile**  
The rule:  
        $(TARGET): $(OBJECTS)  

**Explanation:**  
1. This rule tells 'make' that the final target (an executable, usually stored in $(TARGET) depends on the compiled object files ($(OBJECTS)).  
2. When any of the object files change, 'make' will re-link them to again build the target.  
3. It means: take all the object files, link them together, and produce the final executable.  

**Difference from linking against a library:**   
1. In this case, the rule directly links object files you compiled in your project.  
2. A rule that links against a library (for example -lm for the math library ) would instead reference external precompiled code that’s already available in the system.  

**Example:**  
$(TARGET): $(OBJECTS)  
    $(CC) $(OBJECTS) -o $(TARGET) -lm  
-lm links the external math library, not just the object files you compiled yourself.  

----

2.**Git Tags**  
=> What is a git tag?  
1. A git tag is a reference to a specific commit in the repository’s history.  
2. It is used to mark important points (like a release version v1.0.0).  
3. Unlike branches, tags don’t move — they stay fixed on the commit they point to.  

=> Why is it useful?  
1. Helps identify stable points in project history (e.g., release versions).  
2. Makes it easy to roll back or rebuild a specific version.  
3. Useful for automation (CI/CD pipelines can deploy based on tags).  

=> Simple tag vs Annotated tag:  
**Simple tag:** Just a name pointing directly to a commit,no extra information.  
*git tag v1.0*  

**Annotated tag:** Stores additional metadata  more permanent and preferred for official releases.  
*git tag -a v1.0 -m 'First release'*

---

3.**GitHub Releases**    
=> Purpose of creating a Release:  
1. A Release on GitHub is a way to package and share a specific version of your project, usually tied to a git tag (like v1.0.0).  
2. Releases are helpful for developers and users because they represent stable snapshots of your project.  


=> Significance of attaching binaries:  
1. Attaching binaries makes it easy for end-users to download and run the program without having to build from source.  
2. Ensures consistency as everyone using the release gets the exact same binary, saves time for non-developers who just want to use the software.  
---





