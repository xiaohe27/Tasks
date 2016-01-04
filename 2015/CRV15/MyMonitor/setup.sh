#Setup java
#if ! type -p javac; then
        rm -f /usr/portage/metadata/timestamp.chk
        emerge --sync
        wget --no-check-certificate --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u40-b26/jdk-8u40-linux-x64.tar.gz"
        mkdir -p /usr/portage/distfiles/
        mv jdk-8u40-linux-x64.tar.gz /usr/portage/distfiles/
        echo ">=dev-java/oracle-jdk-bin-1.8.0.40-r1 Oracle-BCLA-JavaSE" >> /etc/portage/package.license
        emerge oracle-jdk-bin
        java-config --set-system-vm oracle-jdk-bin-1.8
#fi
