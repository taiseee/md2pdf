PREFIX ?= $(HOME)/.local

install:
	install -d $(PREFIX)/bin $(PREFIX)/share/md2pdf $(PREFIX)/share/md2pdf/docker
	install -m 755 bin/md2pdf $(PREFIX)/bin/md2pdf
	install -m 755 share/md2pdf/ensure-image.sh $(PREFIX)/share/md2pdf/ensure-image.sh
	install -m 644 share/md2pdf/docker/Dockerfile $(PREFIX)/share/md2pdf/docker/Dockerfile
	@echo "[OK] md2pdf installed to $(PREFIX)/bin/md2pdf"

uninstall:
	rm -f $(PREFIX)/bin/md2pdf
	rm -rf $(PREFIX)/share/md2pdf
	@echo "[OK] md2pdf uninstalled"

.PHONY: install uninstall
