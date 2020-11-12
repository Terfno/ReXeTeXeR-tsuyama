FROM python:alpine3.12

WORKDIR /docs

# install xetex
RUN apk update && \
  apk add openssl make texlive-xetex

# latex package -> xelatex package
RUN mv /usr/share/texmf-dist/tex/latex/ /usr/share/texmf-dist/tex/xelatex/

# for bibtex
ADD ./src/junsrt.bst /usr/share/texmf-dist/bibtex/bst/base/

# jlisting.sty
ADD ./src/jlisting.sty /usr/share/texmf-dist/tex/xelatex/listings/

# ulem.sty
ADD ./src/ulem.sty /usr/share/texmf-dist/tex/xelatex/ulem

# here.sty
ADD ./src/here.sty /usr/share/texmf-dist/tex/xelatex/here/

# BXjscls
ADD ./src/BXjscls/*.cls /usr/share/texmf-dist/tex/xelate/bxjscls/
ADD ./src/BXjscls/*.def /usr/share/texmf-dist/tex/xelate/bxjscls/
ADD ./src/BXjscls/*.sty /usr/share/texmf-dist/tex/xelate/bxjscls/

# ZXjatype
ADD ./src/zxjatype.sty /usr/share/texmf-dist/tex/xelate/zxjatype/

RUN mktexlsr

CMD ["sh"]
