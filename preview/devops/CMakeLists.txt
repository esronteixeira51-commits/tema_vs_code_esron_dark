# ======================================
# CMake Language Semantic Preview
# CMake 3.28+
# ======================================


# ---------- Project Definition ----------

cmake_minimum_required(
    VERSION 3.20
)


project(
    AgentOS
    VERSION 1.0
    LANGUAGES CXX
)



# ---------- Variables ----------

set(
    APP_NAME
    "AgentOS"
)


set(
    BUILD_MODE
    "Release"
)



# ---------- Options ----------

option(
    ENABLE_TESTS
    "Enable tests"
    ON
)



# ---------- Compiler Settings ----------

set(
    CMAKE_CXX_STANDARD
    23
)


set(
    CMAKE_CXX_STANDARD_REQUIRED
    ON
)



# ---------- Source Files ----------

set(
    SOURCES

    main.cpp

    engine.cpp

    agent.cpp
)



# ---------- Executable ----------

add_executable(

    ${APP_NAME}

    ${SOURCES}

)



# ---------- Include Directories ----------

target_include_directories(

    ${APP_NAME}

    PRIVATE

    include

)



# ---------- Libraries ----------

find_package(

    Threads

    REQUIRED

)



target_link_libraries(

    ${APP_NAME}

    PRIVATE

    Threads::Threads

)



# ---------- Conditions ----------

if(
    ENABLE_TESTS
)

    enable_testing()


    add_subdirectory(
        tests
    )


endif()



# ---------- Functions ----------

function(
    show_message
    TEXT
)

    message(
        STATUS
        ${TEXT}
    )

endfunction()



show_message(
    "Building AgentOS"
)



# ---------- Custom Target ----------

add_custom_target(

    clean_all

    COMMAND

    ${CMAKE_COMMAND}

    -E

    echo

    "Cleaning project"

)



# ---------- Install ----------

install(

    TARGETS

    ${APP_NAME}

    DESTINATION

    bin

)