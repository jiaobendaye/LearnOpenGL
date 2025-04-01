set_group("hello")

for _, x in ipairs(os.files("src/*.cpp")) do 
    target(path.basename(x))
        set_kind("binary")
        add_deps("glad", "stb_image")
        add_includedirs("include")
        add_files(x)
end


target("resources")
    set_kind("phony")
    for _, x in ipairs(os.files("src/*.cpp")) do 
        add_deps(path.basename(x))
    end
    after_build(function (target) 
        os.cp(path.join("$(projectdir)/hello/resources/shaders", "*"), target:targetdir())
        os.cp(path.join("$(projectdir)/hello/resources/textures", "*"), target:targetdir())
    end)
    after_clean(function (target) 
        os.rm(path.join(target:targetdir(), "*"))
    end)
