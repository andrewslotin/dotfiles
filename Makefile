DIRS := bash emacs fzf git ruby tmux iterm

help:
	@echo "Link all layers: make all"
	@echo "Link single layer: make <layer>\n"
	@echo "Available layers are:"
	@- $(foreach TARGET, $(DIRS), \
		echo " * $(TARGET)" ; \
	)

all: $(DIRS)

$(DIRS):
	stow -t ~ "$@"

.PHONY: $(DIRS) all help
