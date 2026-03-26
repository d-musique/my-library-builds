
foreach(arch IN ITEMS x86 x64 arm64)
  file(WRITE "triplets/${arch}-windows-hybrid.cmake"
    "set(VCPKG_TARGET_ARCHITECTURE ${arch})
set(VCPKG_CRT_LINKAGE static)
set(VCPKG_LIBRARY_LINKAGE dynamic)
")
endforeach()

foreach(arch IN ITEMS x64 arm64)
  set(name "${arch}")
  if (name STREQUAL "x64")
    set(name "x86_64")
  endif()
  file(WRITE "triplets/${arch}-osx-dynamic.cmake"
    "set(VCPKG_TARGET_ARCHITECTURE ${arch})
set(VCPKG_CMAKE_SYSTEM_NAME Darwin)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE dynamic)
set(VCPKG_MACOSX_RPATH ON)
set(VCPKG_CMAKE_CONFIGURE_OPTIONS -DCMAKE_OSX_ARCHITECTURES=${name})
")
endforeach()
