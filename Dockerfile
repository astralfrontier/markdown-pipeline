FROM node:17-slim

ENV APP_ROOT=/to
ENV PANDOC_VERSION=2.17.1.1

WORKDIR ${APP_ROOT}
RUN apt-get update && apt-get install -y wget unzip
RUN wget https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-linux-amd64.tar.gz && \
    tar -zxvf pandoc-${PANDOC_VERSION}-linux-amd64.tar.gz pandoc-${PANDOC_VERSION}/bin/pandoc && \
    mv pandoc-${PANDOC_VERSION}/bin/pandoc ${APP_ROOT}/ && \
    rm -rfv pandoc-${PANDOC_VERSION} pandoc-${PANDOC_VERSION}-linux-amd64.tar.gz
WORKDIR ${APP_ROOT}/context
RUN wget http://lmtx.pragma-ade.nl/install-lmtx/context-linux-64.zip && \
    unzip context-linux-64.zip && \
    sh install.sh && \
    rm context-linux-64.zip
ADD profiles/* ${APP_ROOT}/context/tex/texmf-context/colors/icc/profiles/
RUN echo 'export PATH=${APP_ROOT}/context/tex/texmf-linux-64/bin:${APP_ROOT}:$PATH' >> ~/.bashrc && \
    echo 'export PATH=${APP_ROOT}/context/tex/texmf-linux-64/bin:${APP_ROOT}:$PATH' >> ~/.zshenv && \
    echo 'export PATH=${APP_ROOT}/context/tex/texmf-linux-64/bin:${APP_ROOT}:$PATH' >> ~/.profile && \
    echo 'set path = ($path ${APP_ROOT}/context/tex/texmf-linux-64/bin ${APP_ROOT})' >> ~/.cshrc
WORKDIR ${APP_ROOT}
