

workspace "LearnGL"
    architecture "x86_64"
    configurations { "Debug", "Release" }
    startproject "Learn01"

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
include("glad");

project "Learn01"
    location "Learn01"
    kind "ConsoleApp"
    language "C++"

    includedirs{"%{wks.location}/glad/include","%{wks.location}/glfw/include","%{wks.location}/commonCode"}
   

    links{"Glad.lib","glfw3"}
    libdirs{"%{wks.location}/glad/bin/" .. outputdir .. "/glad", "%{wks.location}/glfw/lib"}    
    files { "%{prj.location}/**.h",
            "%{prj.location}/**.cpp",
            "%{wks.location}/commonCode/**.h",
            "%{wks.location}/commonCode/**.cpp",
            "%{prj.location}/shader/**.*",}
    configuration "Debug"
        debugdir "%{wks.location}/%{prj.location}/bin/debug"
    filter { "configurations:Debug" }
        defines { "DEBUG" }
        symbols "On"

    filter { "configurations:Release" }
        defines { "NDEBUG" }
        optimize "On"

