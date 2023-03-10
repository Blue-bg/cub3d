/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putwall.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: loumarti <loumarti@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/03/01 10:09:24 by loumarti          #+#    #+#             */
/*   Updated: 2023/03/10 14:54:07 by loumarti         ###   ########lyon.fr   */
/*                                                                            */
/* ************************************************************************** */

#include "cub3d.h"

void	ft_putwall(t_data *d)
{
	int	x;

	x = 0;
	while (x < S_WIDTH)
	{
		cast_a_ray(d, x, false);
		x++;
	}
}
