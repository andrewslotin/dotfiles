DIRS := bash fzf git ruby tmux

help:
	@echo "Link all layers: make all"
	@echo "Link single layer: make <layer>\n"
	@echo "Available layers are:"
	@- $(foreach TARGET, $(DIRS), \
		echo " * $(TARGET)" ; \
	)

all: $(DIRS)

$(DIRS):
	@echo "Linking $@"
	@stow -t ~ "$@"

.PHONY: $(DIRS) all help
