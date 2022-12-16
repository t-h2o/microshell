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

doc: diagram
	asciidoctor README.adoc -o index.html

diagram:
	asciidoctor -r asciidoctor-diagram assets/README.adoc -o assets/index.html
