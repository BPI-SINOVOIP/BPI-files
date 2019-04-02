
make rtd1395_spi_bananapi_defconfig

make CONFIG_CHIP_TYPE=0001

cp -a examples/flash_writer_vm/dvrboot.exe.bin /tftpboot
