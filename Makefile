NAME	=	microshell

CFLAGS	+=	-Wall
CFLAGS	+=	-Wextra
CFLAGS	+=	-Werror

SRCS	=	srcs/main.c

all:
	gcc $(CFLAGS) $(SRCS) -o $(NAME)

site/index.html: diagram
	mkdir -p site/assets
	cp assets/*.svg site/assets/
	asciidoctor README.adoc -o site/index.html

diagram:
	asciidoctor -r asciidoctor-diagram assets/README.adoc -o assets/index.html
