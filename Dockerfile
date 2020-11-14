FROM python:alpine3.12

WORKDIR /docs

# install xetex
RUN apk update && \
  apk add openssl make texlive-xetex && \
  # latex package -> xelatex package
  mv /usr/share/texmf-dist/tex/latex/ /usr/share/texmf-dist/tex/xelatex/

# for bibtex
ADD ./src/junsrt.bst /usr/share/texmf-dist/bibtex/bst/base/

# jlisting.sty
ADD ./src/jlisting.sty /usr/share/texmf-dist/tex/xelatex/listings/

# ulem.sty
ADD ./src/ulem.sty /usr/share/texmf-dist/tex/xelatex/ulem

# here.sty
ADD ./src/here.sty /usr/share/texmf-dist/tex/xelatex/here/

# BXjscls
ADD ./src/BXjscls/*.* /usr/share/texmf-dist/tex/xelate/bxjscls/

RUN mktexlsr

CMD ["sh"]
