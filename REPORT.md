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

1. **Compare Makefile Part 2 vs Part 3**
=> Part 2 (multi-file):
1. Directly compiles multiple .c files into .o object files.
2. Links these .o files together with the main program to build the executable.

=> Part 3 (Static library build):  
1. First compiles .c files into .o files.
2. Then archives these .o files into a static library (lib/libmyutils.a) using ar.
3. The main program links against this library instead of linking all .o files individually.

=> Key Difference:  
Part 2 links object files directly.
Part 3 links via a static library (.a), making the build modular and scalable.

---
2. **Purpose of the ar Command and ranlib**  
=> ar command:
Used to create static libraries (.a files) from object files.This bundles multiple .o files into one library.
=> ranlib command:
1. Generates an index (symbol table) inside the static library.
2. This index allows the linker to quickly find which object file contains a required symbol.
3. On some systems, ar rcs already does this, but ranlib is often run to ensure portability.

---
3.**Symbols in nm client_static and Static Linking**  
We did not see the symbol mystrlen as an unresolved external.Instead, the function code is already included (inlined) into the final executable during the linking process.
=>
What this tells us:  
1. Static linking copies function code from the library into the final executable. 
2. This makes the executable self-contained (it doesn’t need the library at runtime).
3. The downside is larger executable size, but the advantage is independence from external library files.

---

