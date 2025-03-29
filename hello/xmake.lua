for _, x in ipairs(os.files("*.cpp")) do 
    target(path.basename(x))
        set_kind("binary")
        add_deps("glad")
        add_files(x)
end

target("myshader")
    set_kind("binary")
    add_deps("glad")
    add_includedirs("myshader")
    add_files("myshader/main.cpp")
    after_build(function (target) 
        os.cp(path.join("myshader/resource", "shader.*"), target:targetdir())
    end)
    on_clean(function (target) 
        os.rm(path.join(target:targetdir(), "shader.*"))
        os.rm(target:targetfile())
    end)