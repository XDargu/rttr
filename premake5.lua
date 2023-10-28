project "rttr"
    kind "StaticLib"
    language "C++"
    staticruntime "off"
    
    outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	  objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "src/rttr/**.h",
        "src/rttr/**.h.in",
        "src/rttr/**.cpp"
    }

    includedirs
    {
        "%{IncludeDirs.rttr}"
    }

    defines 
    {
    }

    filter "system:windows"
        systemversion "latest"
    
    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"
    
    filter "configurations:Release"
        runtime "Release"
        optimize "on"
        
    filter "configurations:Dist"
          runtime "Release"
          optimize "on"
