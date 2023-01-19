cmake_minimum_required(VERSION 3.14)

include(cmake/prelude.cmake)

project(
    burger-bot
    VERSION 0.1.0
    DESCRIPTION "Short description"
    HOMEPAGE_URL "https://example.com/"
    LANGUAGES CXX
)

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Declare library ----

add_library(
    burger-bot_lib OBJECT
    source/lib.cpp
)

target_include_directories(
    burger-bot_lib ${warning_guard}
    PUBLIC
    "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/source>"
)

target_compile_features(burger-bot_lib PUBLIC cxx_std_17)

find_package(fmt REQUIRED)
target_link_libraries(burger-bot_lib PRIVATE fmt::fmt)

# ---- Declare executable ----

add_executable(burger-bot_exe source/main.cpp)
add_executable(burger-bot::exe ALIAS burger-bot_exe)

set_property(TARGET burger-bot_exe PROPERTY OUTPUT_NAME burger-bot)

target_compile_features(burger-bot_exe PRIVATE cxx_std_17)

target_link_libraries(burger-bot_exe PRIVATE burger-bot_lib)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT burger-bot_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of burger-bot"
  )
endif()

include(cmake/dev-mode.cmake)
