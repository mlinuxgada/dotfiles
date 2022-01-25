
#cd /usr/src && make -j5 buildworld && make -j5 buildkernel && make installkernel && make installworld && make upgrade
cd /usr/src && make -j5 build-all && make install-all && sync
