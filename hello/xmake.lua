set_group("hello")

for _, x in ipairs(os.files("src/*.cpp")) do 
    target(path.basename(x))
        set_kind("binary")
        add_deps("glad", "stb_image")
        add_includedirs("include")
        set_rundir("$(projectdir)/hello")
        add_files(x)
end
