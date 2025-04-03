set_group("light")

for _, x in ipairs(os.files("*.cpp")) do 
    target(path.basename(x))
        set_kind("binary")
        add_deps("glad", "stb_image")
        add_files(x)
end
