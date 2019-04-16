FROM fedora:latest
RUN dnf -y install git gpg perl perl-Getopt-Long perl-Digest-MD5 perl-Log-Log4perl perl-YAML-Tiny perl-Unicode-LineBreak tar wget fontconfig vim ghostscript which && \
    cd /usr/local/src && \
    curl -sL http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz | tar zxf - && \
    mv install-tl-20* install-tl && \
    cd install-tl && \
    echo "selected_scheme scheme-full" > profile && \
    ./install-tl -profile profile
ENV PATH /usr/local/texlive/2018/bin/x86_64-linux:$PATH
CMD ["tlmgr", "--version"]
