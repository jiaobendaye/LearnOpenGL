set_project("LearnOpenGL")


includes("3rd/*/xmake.lua")

add_requires("glfw", "glm")
add_packages("glfw", "glm")

add_includedirs("include")
set_rundir("$(projectdir)")

includes("src/*/xmake.lua")