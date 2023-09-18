
#link_libraries(IMGUI SDL3::SDL3)
#target_link_libraries(IMGUI INTERFACE SDL3::SDL3)

#file(GLOB_RECURSE IMGUI_BACKENDS CONFIGURE_DEPENDS "backends/*.h" "backends/*.cpp")
file(GLOB IMGUI_SOURCES CONFIGURE_DEPENDS "*.h" "*.cpp")

add_library(imgui ${IMGUI_SOURCES})


target_include_directories(imgui
        PRIVATE ../SDL/include
)

target_link_libraries(imgui PRIVATE
        SDL3::SDL3
)

#target_sources(IMGUI PUBLIC ${IMGUI_SOURCES})


#add_library(imgui INTERFACE imgui.h)