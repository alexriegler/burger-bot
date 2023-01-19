# Parent project does not export its library target, so this CML implicitly
# depends on being added from it, i.e. the testing is done only from the build
# tree and is not feasible from an install location

project(burger-botTests LANGUAGES CXX)

# ---- Dependencies ----

find_package(Catch2 REQUIRED)
include(Catch)

# ---- Tests ----

add_executable(burger-bot_test source/burger-bot_test.cpp)
target_link_libraries(
    burger-bot_test PRIVATE
    burger-bot_lib
    Catch2::Catch2WithMain
)
target_compile_features(burger-bot_test PRIVATE cxx_std_17)

catch_discover_tests(burger-bot_test)

# ---- End-of-file commands ----

add_folders(Test)
