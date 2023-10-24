project "ImGui"
	kind "StaticLib"
	language "C++"

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
		
		-- "imgui_impl_opengl3.h",
		-- "imgui_impl_opengl3_loader.h",
		-- "imgui_impl_opengl3.cpp",
		
		-- "imgui_impl_sdl3.h",
		-- "imgui_impl_sdl3.cpp",
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"
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