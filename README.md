# qt6-static-qml

<p class="callout warning">
n.b. This relates to using **CMAKE** to build a Qt QML application using a **STATIC** build of Qt.
</p>

This is a 'minimal' example of building a Qt6 QML application using **CMAKE** against a **STATIC** Qt build.

This may appear to be obvious to some, but if you've ever tried to build an application using CMAKE against a static Qt5.x build you will know of the world of pain it involves. You have to manually import every QML module and plugin your app uses, as well as the associated libraries, and most of them will not be at all obvious. The solution I came across for Qt5.x was to use [this awesome cmake script](https://github.com/OlivierLDff/QtStaticCMake), which worked well for MacOS and Windows builds, but unfortunately not for Ubuntu or RPi. (see [this issue](https://github.com/OlivierLDff/QtStaticCMake/issues/5) and the subsequent [Qt Bug Report](https://bugreports.qt.io/browse/QTBUG-90906)).

Fortunately Qt6's new build system appears to have solved this issue, and this repository is an example of a minimal reproduction of a working QML application built using a static build of Qt6.3.

The key appears to be to replace your `add_executable` calls with `qt6_add_executable`. I also ended up removing the `.qrc` file by moving the contents to `CMakeLists.txt` and using the `qt6_add_resources` function. It might be possible to continue using the `.qrc` file, but it didn't see to want to work (can't remember why) so I switch to using `qt6_add_resources` as it made sense to keep all the dependencies in one file anyway.

Both `qt6_add_executable` and `qt6_add_resources` are imported by default with the `CORE` Qt component.

Once this is done, you can remove any and all `Q_IMPORT_PLUGIN()` directives and all other nastiness in the form of obscure target link libraries etc.

See the [`CMakeLists.txt`](CMakeLists.txt) file in this repository for the full details.

# build
First obtain a static build of Qt6.3. I built it from source following [the instructions here](https://wiki.qt.io/Building_Qt_6_from_Git), I'm not sure that pre-builds are available for static builds.

Then clone this repo and build it:


```shell
git clone https://github.com/TobyEalden/qt6-static-qml
cd qt6-static-qml
mkdir build
cd build
cmake .. -DCMAKE_PREFIX_PATH=/path/to/your/Qt/static/build
cmake --build .
```

# run
```shell
./minimal
```

