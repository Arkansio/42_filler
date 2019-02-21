NAME = mgessa.filler

SRCS = main.c 

FLAGS = -Wall \
		-Werror \
		-Wextra

OBJS = $(SRCS:.c=.o)

HEADER = ./

all: $(NAME)

$(NAME): $(OBJS)
	make -C libft
	gcc $(FLAGS) -o $(NAME) $^ -L. libft/libft.a

./%.o: ./%.c
	gcc $(FLAGS) -c $^ -I $(HEADER) -I ./libft/

clean:
	/bin/rm -f $(OBJS)
	make -C libft clean

fclean: clean
	/bin/rm -f $(NAME)
	make -C libft fclean

re: fclean all

.PHONY: all clean re fclean libft