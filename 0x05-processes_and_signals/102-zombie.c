#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

/**
 * infinite_while - Runs an infinite loop.
 *
 * Return: Always 0 (success).
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - Creates five zombie processes.
 *
 * Return: Always 0 (success).
 */
int main(void)
{
	pid_t pid;
	int i;

	for (i = 0; i < 5; i++)
	{
		pid = fork();
		if (pid > 0)  /* Parent process */
		{
			printf("Zombie process created, PID: %d\n", pid);
		}
		else if (pid == 0)  /* Child process */
		{
			exit(0);  /* Child exits immediately, becoming a zombie */
		}
		else
		{
			perror("fork");
			return (1);
		}
	}

	infinite_while();  /* Parent enters infinite loop */

	return (0);
}
