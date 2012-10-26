
#########################
## Add the dependencies
#########################

include_directories (.)
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DDEBUG")

execute_process(COMMAND R CMD config --cppflags OUTPUT_VARIABLE RCPP OUTPUT_STRIP_TRAILING_WHITESPACE)
MESSAGE("Output of R CMD --cflags: ${RCPP}")
add_definitions(${RCPP})


execute_process(COMMAND R CMD config --ldflags OUTPUT_VARIABLE RLIB OUTPUT_STRIP_TRAILING_WHITESPACE)
MESSAGE("Output of R CMD --libs: ${RLIB}")


include(FindThreads)
find_package(Threads REQUIRED)
add_definitions(${Threads_INCLUDE_DIR})

include(FindZLIB)
find_package(ZLIB REQUIRED)
include_directories(${ZLIB_INCLUDE_DIR})
link_libraries( ${ZLIB_LIBRARIES} )

include(FindProtobuf)
find_package(Protobuf REQUIRED)
include_directories(${PROTOBUF_INCLUDE_DIR})
link_libraries( ${PROTOBUF_LIBRARY} )

IF(CMAKE_SYSTEM_NAME STREQUAL Linux)
  IF(DEFINED ENV{JAVA_HOME})
    message("... found JAVA_HOME")
  ELSE()
    message("... could not find JAVA_HOME (or empty) environment variable. You will most likely need to set this. Proceeding anyway")
  ENDIF()
ENDIF()

include(FindJava)
find_package(Java REQUIRED)

include(FindJNI)
find_package(JNI REQUIRED)
include_directories(${JNI_INCLUDE_DIRS})
link_libraries(${JAVA_JVM_LIBRARY})

## Build Components
add_library(rhipebridge SHARED engine.cc io.cc misc.cc)
# add_executable(rhipebridge engine.c)
target_link_libraries(rhipebridge ${RLIB})
