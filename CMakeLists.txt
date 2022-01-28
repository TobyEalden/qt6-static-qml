cmake_minimum_required(VERSION 3.21)

project(minimal VERSION 0.1.0 LANGUAGES CXX)

find_package(Qt6 COMPONENTS
    Core
    Qml
    REQUIRED
    )

qt6_add_executable(${PROJECT_NAME} src/main.cpp)

qt6_add_resources(
    ${PROJECT_NAME}
    "RESOURCES"
    PREFIX
    "/"
    BASE
    "src"
    FILES
    src/AppWindow.qml
    src/qtquickcontrols2.conf
)

set_target_properties(${PROJECT_NAME} PROPERTIES AUTORCC TRUE)
set_target_properties(${PROJECT_NAME} PROPERTIES AUTOMOC TRUE)

target_link_libraries(
    ${PROJECT_NAME}
    PRIVATE
    Qt6::Core
    Qt6::Qml
)
