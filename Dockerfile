FROM vihos/gcloud
MAINTAINER Dmitry Boldak <dbsfbp@gmail.com>

RUN apk add --no-cache \
        --virtual=.build-dependencies \
        g++ gcc build-base gfortran file binutils \
        musl-dev python3-dev cython openblas-dev && \
    apk add bash libstdc++ openblas mariadb-dev freetype-dev libpng-dev && \
    \
    ln -s locale.h /usr/include/xlocale.h && \
    \
#   -- [ LIBRARIES ] --
    pip3 install numpy && \
    pip3 install matplotlib && \
    pip3 install kneed && \
    pip3 install mysqlclient && \
    pip3 install pandas && \
    pip3 install scipy && \
    pip3 install scikit-learn && \
    pip3 install grpcio && \
#   -- [ /LIBRARIES ] --
    \
    rm -r /root/.cache && \
    find /usr/lib/python3.*/ -name 'tests' -exec rm -r '{}' + && \
    find /usr/lib/python3.*/site-packages/ -name '*.so' -print -exec sh -c 'file "{}" | grep -q "not stripped" && strip -s "{}"' \; && \
    \
    rm /usr/include/xlocale.h && \
    \
    apk del .build-dependencies