# Machine Learning Python 3 GCloud Docker image

This image is based on [Alpine Linux 3.10 Python 3.7 image](https://hub.docker.com/r/vihos/gcloud). It contains Python 3, Python 2 and several GCloud components installed.

Python libraries:
* numpy
* matplotlib
* kneed
* mysqlclient
* pandas
* scipy
* scikit-learn
* grpcio

Usage Example
-------------

```bash
$ docker run --rm vihos/gcloud-ml gcloud components list
```

Once you have run this command you will get printed full list of components installed to GCloud SDK! Or use it interactivelly:

```bash
$ docker run -it --rm vihos/gcloud-ml /bin/sh
```
