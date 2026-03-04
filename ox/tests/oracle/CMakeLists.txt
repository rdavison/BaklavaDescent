cmake_minimum_required(VERSION 3.11)
project(c_oracle LANGUAGES CXX)

add_library(c_oracle STATIC c_oracle.cpp c_oracle_gameseg.cpp c_oracle_fvi.cpp c_oracle_curves.cpp c_oracle_collide.cpp)
target_include_directories(c_oracle PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
# Needed so c_oracle.cpp can include repo headers like fix/fix.h.
target_include_directories(c_oracle PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../../..)
target_compile_features(c_oracle PRIVATE cxx_std_14)
