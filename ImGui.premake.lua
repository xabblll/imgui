project "ImGui"
	kind "StaticLib"
	language "C++"
	staticruntime "On"
	
	targetdir ("%{wks.location}/" .. TargetDirBase .. OutputDir .. "%{prj.name}")
    objdir ("%{wks.location}/" .. ObjDirBase .. OutputDir .. "%{prj.name}")

	files
	{
		"imconfig.h",
		"imgui.h",
		"imgui.cpp",
		"imgui_draw.cpp",
		"imgui_internal.h",
		"imgui_widgets.cpp",
		"imstb_rectpack.h",
		"imstb_textedit.h",
		"imstb_truetype.h",
		"imgui_demo.cpp",
		"imgui_tables.cpp",
		"imgui_stdlib.cpp",
		"imgui_stdlib.h",
	}

	filter "system:windows"
		systemversion "latest"
		staticruntime "On"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		staticruntime "On"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
		
	filter { "system:windows", "configurations:Debug" }
        buildoptions "/MTd"
		
    filter { "system:windows", "configurations:Release" }
        buildoptions "/MT"