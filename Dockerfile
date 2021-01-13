FROM alpine:3.12

# install xetex
RUN apk add --no-cache --upgrade fontconfig openssl make texlive-xetex && \
  # latex package -> xelatex package
  mv /usr/share/texmf-dist/tex/latex/ /usr/share/texmf-dist/tex/xelatex/

# for bibtex
COPY ./src/junsrt.bst /usr/share/texmf-dist/bibtex/bst/base/

# BXjscls
COPY ./src/BXjscls/*.* /usr/share/texmf-dist/tex/xelatex/bxjscls/
COPY ./src/fonts/ /usr/share/texmf-dist/fonts/

# ZXjatype
COPY ./src/zxjatype.sty /usr/share/texmf-dist/tex/xelatex/zxjatype/

# c_thesis.sty
# jlisting.sty
COPY ./src/jlisting.sty /usr/share/texmf-dist/tex/xelatex/listings/

# ulem.sty
COPY ./src/ulem.sty /usr/share/texmf-dist/tex/xelatex/ulem

# here.sty
COPY ./src/here.sty /usr/share/texmf-dist/tex/xelatex/here/

RUN mktexlsr
