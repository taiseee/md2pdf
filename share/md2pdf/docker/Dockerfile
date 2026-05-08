FROM texlive/texlive:latest

RUN apt-get update && apt-get install -y --no-install-recommends wget ca-certificates \
    && PANDOC_VERSION=3.6.4 \
    && ARCH=$(dpkg --print-architecture) \
    && wget -q "https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-1-${ARCH}.deb" -O /tmp/pandoc.deb \
    && dpkg -i /tmp/pandoc.deb \
    && rm /tmp/pandoc.deb \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# pandoc 3.6.4 に欠けている document-metadata.latex partial を追加
# \documentclass より前に展開されるため \PassOptionsToPackage を使用
RUN mkdir -p /root/.local/share/pandoc/templates && \
    cat > /root/.local/share/pandoc/templates/document-metadata.latex << 'EOF'
\PassOptionsToPackage{$if(title-meta)$pdftitle={$title-meta$},$endif$$if(author-meta)$pdfauthor={$author-meta$},$endif$$if(lang)$pdflang={$lang$},$endif$$if(subject)$pdfsubject={$subject$},$endif$$if(keywords)$pdfkeywords={$for(keywords)$$keywords$$sep$, $endfor$},$endif$$if(colorlinks)$colorlinks=true,linkcolor={$if(linkcolor)$$linkcolor$$else$Maroon$endif$},filecolor={$if(filecolor)$$filecolor$$else$Maroon$endif$},citecolor={$if(citecolor)$$citecolor$$else$Blue$endif$},urlcolor={$if(urlcolor)$$urlcolor$$else$Blue$endif$},$else$$if(boxlinks)$$else$hidelinks,$endif$$endif$}{hyperref}
EOF

WORKDIR /workdir
