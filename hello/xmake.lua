set_group("hello")

for _, x in ipairs(os.files("src/*.cpp")) do 
    target(path.basename(x))
        set_kind("binary")
        add_deps("glad", "stb_image")
        add_includedirs("include")
        set_rundir("$(projectdir)/hello")
        add_files(x)
end


target("resources")
    set_kind("phony")
    set_default(false)
    on_build(function (target) 
        if (not os.isdir(target:targetdir())) then
            os.mkdir(target:targetdir())
        end
        os.cp(path.join("$(projectdir)/hello/resources/shaders", "*"), target:targetdir())
        os.cp(path.join("$(projectdir)/hello/resources/textures", "*"), target:targetdir())
    end)
    after_clean(function (target) 
        os.rm(path.join(target:targetdir(), "*"))
    end)
