FROM pandoc/latex:latest-ubuntu

RUN tlmgr update --self \
 && tlmgr install \
      collection-latexrecommended \
      collection-langjapanese \
      jlreq \
      luatexja \
      haranoaji \
      haranoaji-extra

WORKDIR /workdir
