# run_main_C42

A small utility to run all the commented main inside a C project from the 42 piscine.

# Installation

1. Put `run_main_42.sh` inside you `~/bin`.
```bash
git clone git@github.com:charlyalizadeh/run_main_C42.git
mv run_main_C42/run_main_42.sh ~/bin/
```
2. Make sure `~/bin` is in your `$PATH`
```bash
export PATH="$PATH:~/bin"
```
3. Close the current terminal and open another one to test this program

# Usage


You should structure your `ft_*.c` file as such:

```c
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_example.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: calizade <calizade@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/09/11 20:12:19 by calizade          #+#    #+#             */
/*   Updated: 2023/09/11 20:12:19 by calizade         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

void	ft_example()
{
	write(1, "Hello 42!", 9);
}

/* Flags used during the compilation (optional)
FLAGS=-lbsd
*/

/*MAIN START

(include all the header used for your main in the comment)

int main(void)
{
	ft_example()
}

MAIN END*/
```

This program assumes that your directory looks like this:

```bash
$ ls -l
ex00/ft_example00.c
ex01/ft_example01.c
...
```

Inside your C project with all you exercices run:
```bash
$ run_main_42.sh # (or ~/bin/run_main_42.sh if bash says 'command not found')
```



The program will uncomment your main, compile all the c file inside each exercice run the output executables.
To check if the main is already decommented (in case of running this program multiple times) a file named `.main_decommented` is created. **DO NOT DELETE IT**.
