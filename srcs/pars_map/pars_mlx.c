/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   pars_mlx.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: amiguez <amiguez@student.42lyon.fr>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/02/24 19:39:03 by amiguez           #+#    #+#             */
/*   Updated: 2023/02/27 15:47:51 by amiguez          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "cub3d.h"

int	pars_mlx(t_data *d)
{
	d->mlx.ptr = mlx_init();
	if (!d->mlx.ptr)
		return (d->err_code = MLX_INIT_FAIL, EXIT_FAILURE);
	d->mlx.win = mlx_new_window(d->mlx.ptr, S_WIDTH, S_LENGHT, "Cub3D");
	if (!d->mlx.win)
		return (d->err_code = MLX_WIN_FAIL, EXIT_FAILURE);
	return (EXIT_SUCCESS);
}