/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strtok.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dopereir <dopereir@student.42porto.com>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/29 19:34:28 by dopereir          #+#    #+#             */
/*   Updated: 2025/06/04 22:28:39 by dopereir         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strtok(char *str, char *sep)
{
	static char	*base = NULL;
	static char	*cursor = NULL;
	char		*token;

	if (str != NULL)
	{
		if (base != NULL)
			free(base);
		base = ft_strdup(str);
		cursor = base;
	}
	if (cursor == NULL)
		return (NULL);
	cursor += ft_strspn(cursor, sep);
	if (*cursor == '\0')
	{
		free(base);
		base = NULL;
		cursor = NULL;
		return (NULL);
	}
	token = cursor;
	cursor = cursor + ft_strcspn(cursor, sep);
	if (*cursor != '\0')
	{
		*cursor = '\0';
		cursor++;
	}
	return (token);
}
