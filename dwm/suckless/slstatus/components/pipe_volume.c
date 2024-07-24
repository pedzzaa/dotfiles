#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include "../util.h"
#include "../slstatus.h"

const char *
pipe_volume(const char *unused) {
    char vol[8];
    char buffer[6];
    FILE *cmd = popen("pamixer --get-mute", "r");

    if (cmd == NULL) {
        return bprintf("NULL");
    }

    if (fgets(buffer, sizeof(buffer), cmd) == NULL) {
        pclose(cmd);
        return bprintf("Error reading state");
    }

    pclose(cmd);
    buffer[strcspn(buffer, "\n")] = '\0';

    if(strcmp(buffer, "true") == 0) {
        return bprintf("🔇");
    }

    cmd = popen("pamixer --get-volume", "r");

    if(fgets(vol, sizeof(vol), cmd) == NULL){
        pclose(cmd);
        return bprintf("Error reading level");
    }

    pclose(cmd);
    vol[strcspn(vol, "\n")] = '\0';
    return bprintf("🔊 %s%%", vol);
}
