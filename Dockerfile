FROM alpine:3.8

WORKDIR /docs

# install xetex
RUN apk --no-cache add openssl make texlive-xetex && \
  # latex package -> xelatex package
  mv /usr/share/texmf-dist/tex/latex/ /usr/share/texmf-dist/tex/xelatex/

# for bibtex
ADD ./src/junsrt.bst /usr/share/texmf-dist/bibtex/bst/base/

# BXjscls
ADD ./src/BXjscls/*.* /usr/share/texmf-dist/tex/xelate/bxjscls/

# c_thesis.sty
# jlisting.sty
ADD ./src/jlisting.sty /usr/share/texmf-dist/tex/xelatex/listings/

# ulem.sty
ADD ./src/ulem.sty /usr/share/texmf-dist/tex/xelatex/ulem

# here.sty
ADD ./src/here.sty /usr/share/texmf-dist/tex/xelatex/here/

RUN mktexlsr

CMD ["sh"]
