git clone git://git.openwrt.org/project/libubox.git
git clone git://git.openwrt.org/project/uci.git
CMAKE_INCLUDE_PATH=../ CMAKE_LIBRARY_PATH=../libubox/ cmake -DUCI_DEBUG=ON -DUCI_DEBUG_TYPECAST=ON .
