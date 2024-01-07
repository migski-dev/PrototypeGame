# General Practices

 - **Method Down, Signal Up**
	 - Use Methods to communicate data to descendant Nodes in the Scene Tree, and use Signals to communicate data to ancestor Nodes up the Scene Tree.
 - **Creating Scenes**
	 - Try to maintain focused, singular-purpose Scenes with loose coupling to other parts of the codebase in order to improve reusability and maintainability. (Single Responsibility Principle).
	 - Try to have Objects only interact with themselves. Instead of having Object A modify Object B, have Object B react to Object A. (Encapsulation).   
 - **Scenes vs Scripts**
	 - If one wishes to create a basic tool that is going to be re-used in several different projects and which people of all skill levels will likely use (including those who don't label themselves as "programmers"), then chances are that it should probably be a script, likely one with a custom name/icon.
	 - If one wishes to create a concept that is particular to their game, then it should always be a scene. Scenes are easier to track/edit and provide more security than scripts.
 - **Singletons**
	 - To ensure Scenes only have one instance, you can autoload nodes at the root of the project, allowing you to access methods or data to be reused globally.
	 - Autoloaded nodes are not freed when you change the scene from code with `SceneTree.change_scene_to_file`.
 - **Managers** 
	 - Try to use Manager scenes to handle the behavior of multiple instances of the same Object. 
	 
# Style Guide

 - Use **snake_case** for folder, file names and variable names.
 - Use  **PascalCase**  for node names, as this matches built-in node casing.

## Create files and folders

![enter image description here](https://i.imgur.com/dxYiYTk.png)

 - **resources** - used to store resource files.
 - **scenes** - used as a parent folder to group all the scene files. 
	 - **auto_load** - any scenes that are autoloaded (Singletons).
	 - **component** - any functionality that is to be reused across multiple classes.
	 - **game_object** - any objects that can be interacted with in the main scene.
	 - **main** - the main scene.
	 - **manager** - any scenes that handle the behavior of multiple instances of the same class. 
	 - **ui** - any scenes that handle the user interface.

