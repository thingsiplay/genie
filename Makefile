.PHONY: all clean compile

all: compile

compile:
	gcc \
		-Wall \
		-Os \
		-Wformat \
		-Wunused-variable \
		-D_FORTIFY_SOURCE=2 \
		-ldl GGGG.c $$(pkg-config gtk+-3.0 glib-2.0 --cflags --libs) \
		-o GGGG \
		-lm \
		-lgmodule-2.0

clean:
	rm -- GGGG
