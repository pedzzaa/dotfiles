#include <stdio.h>
#include <string.h>
#include "../util.h"
#include "../slstatus.h"

const char *
pipe_volume(const char *unused) {
    static char vol[8];
    FILE *cmd = popen("pamixer --get-volume", "r");
    if (cmd == NULL) {
        return NULL;
    }
    if (fgets(vol, sizeof(vol), cmd) != NULL) {
        pclose(cmd);
        vol[strcspn(vol, "\n")] = '\0';
        return bprintf(vol);
    }
    pclose(cmd);
    return NULL;
}
