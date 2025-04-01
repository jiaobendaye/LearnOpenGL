set_project("LearnOpenGL")


includes("3rd/*/xmake.lua")

add_requires("glfw", "glm")
add_packages("glfw", "glm")

includes("hello")