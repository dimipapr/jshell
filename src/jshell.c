#include <stdio.h>
#include <stdlib.h>
#include <readline/readline.h>
#include <readline/history.h>

#define ARGUMENT_BUFFER_SIZE 1024

#define RESET       "\033[0m"
#define RED         "\033[30m"

#define TOKEN_DELIMETER " \t\r\n"

void jshell_loop(void);
char **split_line(char *line);
//int execute(char **args);

int main(int argc, char ** argv)
{
    //Load Config Files
    //Run Command Loop
    jshell_loop();
    //Perform SHutdown/ Cleanup
    
    return EXIT_SUCCESS;
}

void jshell_loop(void)
{
    char *line;
    char **args;
    int status=1;
    char *prompt = "> ";

    do{
        line = readline(prompt);
        args = splitline(line);
        //status = execute(args);

        printf("%s\n",line);
        free(line);
    }while(status);
}

char **split_line(char *line)
{
    int buffer_size = ARGUMENT_BUFFER_SIZE;
    int position = 0;
    char **tokens = malloc(buffer_size*sizeof(char*));
    char *token;

    if (!tokens) 
    {
        fprintf(stderr,"%sjshell: Allocation errors%s\n",RED,RESET);
        exit(EXIT_FAILURE);
        token = strtok(line, TOKEN_DELIMETER);
    }
}

// int execute(char **args)
// {
    
// }