set_project("LearnOpenGL")

add_rules("mode.debug", "mode.release")


includes("3rd/*/xmake.lua")

add_requires("glfw", "glm", "assimp")
add_packages("glfw", "glm", "assimp")

add_includedirs("include")
set_rundir("$(projectdir)")

for _, x in ipairs(os.files("src/*/*.cpp")) do 
    target(path.basename(x))
        set_kind("binary")
        add_deps("glad", "stb_image")
        set_group(path.basename(path.directory(path.absolute(x))))
        add_files(x)
end
