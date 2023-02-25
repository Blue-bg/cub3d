# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amiguez <amiguez@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/07 09:17:51 by amiguez           #+#    #+#              #
#    Updated: 2023/02/25 20:03:49 by amiguez          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME := cub3d

# ############################################################################ #
DIR_SRCS	:= srcs
DIR_OBJS	:= .objs
DIR_INCS	:= includes
DIR_LIBFT	:= libft
DIR_MLX		:= mlx_linux
# ############################################################################ #
LST_SRCS	:=	main.c\
				debug.c
LST_OBJS	:=	$(LST_SRCS:.c=.o)
LST_INCS	:=	cub3d.h\
				debug.h\
				pars_cub.h

PARS	:=		error.c\
				pars.c\
				pars_file.c\
				pars_content.c\
				pars_content_utiles.c\
				pars_map.c\
				pars_mlx.c

DIR_PARS	:=	pars_map
LST_PARS	:=	$(addprefix $(DIR_PARS)/,$(PARS))
SRC_PARS	:=	$(addprefix $(DIR_SRCS)/,$(LST_PARS))
OBJ_PARS	:=	$(addprefix $(DIR_OBJS)/,$(LST_PARS:.c=.o))

LST_MLX		:=	libmlx.a
LST_LIBFT	:=	libft.a
# ############################################################################ #
SRCS		:=	$(addprefix $(DIR_SRCS)/,$(LST_SRCS)) $(SRC_PARS)
OBJS		:=	$(addprefix $(DIR_OBJS)/,$(LST_OBJS)) $(OBJ_PARS)
INCS		:=	$(addprefix $(DIR_INCS)/,$(LST_INCS))
LIBFT		:=	$(addprefix $(DIR_LIBFT)/,$(LST_LIBFT))
MLX			:=	$(addprefix $(DIR_MLX)/,$(LST_MLX))
# DEPH		:=	$(OBJS:=.o=.d)
# -include $(DEPH)
# ############################################################################ #
CC			:=	gcc
CFLAGS		:=	-Wall -Wextra -g3 -Werror #-fsanitize=address
# ############################################################################ #
# **************************************************************************** #
ERASE	:=	\033[2K\r
GREY	:=	\033[30m
RED		:=	\033[31m
GREEN	:=	\033[32m
YELLOW	:=	\033[33m
BLUE	:=	\033[34m
PINK	:=	\033[35m
CYAN	:=	\033[36m
WHITE	:=	\033[37m
BOLD	:=	\033[1m
UNDER	:=	\033[4m
SUR		:=	\033[7m
END		:=	\033[0m
# **************************************************************************** #
# ############################################################################ #
all : $(NAME)

$(NAME) : $(OBJS) Makefile $(INCS) $(LIBFT) | $(MLX)
	$(CC) $(CFLAGS) $(OBJS) $(LIBFT) -I$(DIR_INCS) -I$(DIR_MLX) -o $@ $(MLX) -lX11 -lXext
#-lmlx -framework OpenGL -framework AppKit

$(DIR_OBJS)/%.o: $(DIR_SRCS)/%.c $(INCS) Makefile | $(DIR_LIBFT) $(DIR_OBJS)
	$(CC) $(CFLAGS) -c $< -o $@ -I$(DIR_INCS) -MMD

$(DIR_OBJS) :
	mkdir -p $(DIR_OBJS)
	mkdir -p $(DIR_OBJS)/$(DIR_PARS)

$(DIR_LIBFT) :
	make -sC $(DIR_LIBFT)

$(MLX) :
	make -sC $(DIR_MLX)

clean :
	rm -rf $(DIR_OBJS)
	make -sC $(DIR_LIBFT) clean
	make -sC $(DIR_MLX) clean

fclean :
	rm -f $(NAME)
	rm -rf $(DIR_OBJS)
	make -sC $(DIR_LIBFT) fclean

re : fclean all

.PHONY : all clean fclean re $(DIR_LIBFT)
# .SILENT :