target("stb_image")
  set_kind("static")
  add_files("src/*.cpp")
  add_includedirs("include", { public = true })