#include <stdio.h>
#include <string.h>
#include "../slstatus.h"
#include "../util.h"

#define MAX_BRIGHT 255

const char *
brightness(const char *unused) {
    static char bright[9];
    int current_state;
    FILE *file = fopen("/sys/class/backlight/amdgpu_bl1/brightness", "r");

    if (file == NULL) {
        return NULL;
    }

    if(fscanf(file, "%i", &current_state) != 1) {
        fclose(file);
        return NULL;
    }
    
    fclose(file);
    int brightness_percentage = (current_state * 100) / MAX_BRIGHT;
    snprintf(bright, sizeof(bright), "%i", brightness_percentage);

    return bprintf(bright);
}
