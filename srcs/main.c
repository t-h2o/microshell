#include	<stdio.h>
#include	<string.h>
#include	<unistd.h>
#include	<sys/wait.h>

typedef struct s_command {
	char	*bin;
	char	**args;
}	t_command;

static void	print_command(t_command *cmd)
{
	int	index;

	printf("Bin: %s\n", cmd->bin);
	index = 0;
	while (cmd->args[index])
	{
		printf("args[%d]: %s\n", index, cmd->args[index]);
		++index;
	}
}

static int	execute_command(t_command *cmd, char **envp)
{
	int	pid;

	pid = fork();

	if (pid == 0)
	{
		if (execve(cmd->bin, cmd->args, envp) == -1)
			printf("error\n");
	}
	else
		waitpid(pid, 0, 0);

	return 0;
}

static void	find_command(char ***arguments, t_command *cmd)
{
	int	index;

	cmd->bin = **arguments;
	cmd->args = *arguments;
	index = 0;
	while ((*arguments)[index] && strcmp((*arguments)[index], ";"))
		++index;
	if ((*arguments)[index] == 0)
	{
		*arguments = &((*arguments)[index]);
	}
	else
	{
		(*arguments)[index] = 0;
		*arguments = &((*arguments)[index + 1]);
	}
}

static int	microshell(char **arguments, char **envp)
{
	t_command	cmd;

	while (*arguments)
	{
		find_command(&arguments, &cmd);
		print_command(&cmd);
		execute_command(&cmd, envp);
	}

	return 0;
}

int	main(int argc, char **argv, char **envp)
{
	printf("Microshell\n");

	if (argc == 1)
		return 0;

	++argv;

	return microshell(argv, envp);
}