FROM quay.io/mapstory/maploom-build AS maploom-builder
MAINTAINER Tyler Battle <tbattle@boundlessgeo.com>

FROM bitnami/minideb:jessie
RUN install_packages git

COPY --from=maploom-builder /usr/src/app /maploom

WORKDIR /django-maploom
COPY . .
RUN ./deploy/transform-files.sh /maploom

CMD ./deploy/transform-files.sh /maploom
