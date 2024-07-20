#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#define CMD_BUFFER_SIZE 256

void get_current_layout(char *layout, int size) {
    FILE *fp;
    char cmd[CMD_BUFFER_SIZE];
    snprintf(cmd, sizeof(cmd), "setxkbmap -query | grep layout | awk '{print $2}'");

    fp = popen(cmd, "r");
    if (fp == NULL) {
        perror("popen");
        exit(EXIT_FAILURE);
    }

    if (fgets(layout, size, fp) != NULL) {
        layout[strcspn(layout, "\n")] = '\0';
    }

    pclose(fp);
}

void set_layout(const char *layout) {
    char cmd[CMD_BUFFER_SIZE];
    snprintf(cmd, sizeof(cmd), "setxkbmap %s", layout);
    system(cmd);
}

int main(void) {
    char current_layout[32];
    get_current_layout(current_layout, sizeof(current_layout));

    if (strcmp(current_layout, "us") == 0) {
        set_layout("me");
    } else if (strcmp(current_layout, "me") == 0) {
        set_layout("us");
    }

    return 0;
}
