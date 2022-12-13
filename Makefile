NAME	=	microshell

CFLAGS	+=	-Wall
CFLAGS	+=	-Wextra
CFLAGS	+=	-Werror
CFLAGS	+=	-g

SRCS	=	srcs/main.c

all:
	gcc $(CFLAGS) $(SRCS) -o $(NAME)

db: all
	lldb ./$(NAME)

site/index.html: diagram
	mkdir -p site/assets
	cp assets/*.svg site/assets/
	asciidoctor README.adoc -o site/index.html

diagram:
	asciidoctor -r asciidoctor-diagram assets/README.adoc -o assets/index.html
