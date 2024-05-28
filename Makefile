# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dopereir <dopereir@student.42porto.com>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/10 20:59:32 by dopereir          #+#    #+#              #
#    Updated: 2024/05/27 18:56:02 by dopereir         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


NAME = libft.a

Sources = ft_isalpha.c ft_isdigit.c ft_isalnum.c ft_isascii.c ft_isprint.c \
ft_strlen.c ft_memset.c ft_bzero.c ft_memcpy.c ft_memmove.c ft_strlcpy.c \
ft_strlcat.c ft_toupper.c ft_tolower.c ft_strchr.c ft_strrchr.c \
ft_strncmp.c ft_memchr.c ft_memcmp.c ft_strnstr.c ft_atoi.c ft_calloc.c \
ft_strdup.c ft_substr.c ft_strjoin.c ft_strtrim.c ft_split.c \
ft_itoa.c ft_strmapi.c ft_striteri.c ft_putchar_fd.c ft_putstr_fd.c \
ft_putendl_fd.c ft_putnbr_fd.c \

Bonus = ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c \
ft_lstadd_back.c ft_lstdelone.c ft_lstclear.c ft_lstiter.c ft_lstmap.c \

Flags = -Wall -Wextra -Werror

Compiler = cc $(Flags) -c

mylib = ar rc $(NAME)

ranlib = ranlib $(NAME)

remove = rm -f

O_FILES = $(Sources:.c=.o)
O_BONUS = $(Bonus:.c=.o)

all: $(NAME)

$(NAME): $(O_FILES)
	$(mylib) $(O_FILES)
	$(ranlib)
	
$(O_FILES): %.o:%.c
	$(Compiler) -o $@ $<
	
bonus: $(O_BONUS)
	$(mylib) $(O_BONUS)
	$(ranlib)
	
$(O_BONUS): %.o: %.c
	$(Compiler) -o $@ $<

clean:
	$(remove) $(O_FILES) $(O_BONUS)

fclean:	clean
	$(remove) $(NAME)

re:	fclean	all

.PHONY: clean fclean re bonus

