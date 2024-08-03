# unknown-Packer
An Packer for the Rodrigos engine projected to be extreamlly 
easy to use, for use, just follow these steps 

## Linux

### 1: Instalation 

### 2: Creating a Project 
For start a project with everything configured, just type:
```shel 
./packer.out create_project asteroids
```

### 3: Runing
For Runing , just type: 
```shel 
./packer.out run
```


### 4: Building 
For pack the project to final user, type 
```shel 
./packer.out build
```

### Listing Avaialbe Projects 
For Listing all projects, just type 

```shel 
./packer.out list_examples
```
### Getting Help
For Getting help,just type: 
```shel 
./packer.out help
```




#### Building from scracth

If you want to build the packer from scracth, just ttype: 
```shel
cd src && gcc build/main.c && ./a.out
```
note that you must be on linux  and have an **gcc** and  **x86_64-w64-mingw32-gcc** compiler 
for these
The system its based on the [Symbiotic Lua](https://github.com/OUIsolutions/Symbiotic-Lua) lua template, for a better understandinfg , read  the docs overthere.
