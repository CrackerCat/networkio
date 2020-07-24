if(${CMAKE_SYSTEM_NAME} STREQUAL "Emscripten")
	set(ARCH_TARGET wasm)
	add_definitions(-DEMSCRIPTEN)
	message(STATUS "Detected Architecture Target: WebAssembly")
elseif(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
	set(ARCH_TARGET linux64)
	add_definitions(-DLINUX -DPOSIX)
	message(STATUS "Detected Architecture Target: Linux")
elseif(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
	set(ARCH_TARGET osx32)
	set(CMAKE_MACOSX_RPATH 0)
	add_definitions(-DOSX -DMAC -DPOSIX)
	message(STATUS "Detected Architecture Target: OSX")
elseif(${CMAKE_SYSTEM_NAME} MATCHES "Windows")
	set(ARCH_TARGET win${PLATFORM})
	add_definitions(-D_WIN32 -DWINDOWS)
	set(WINDOWS_PATH_SUFFIXES win${PLATFORM} Win${PLATFORM} x${PLATFORM})
	message(STATUS "Detected Architecture Target: Windows")
endif()

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
	add_definitions(-D__x86_64__)
elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
	add_definitions(-D__i386__)
endif()