#include <ncurses.h>
#include <string.h>

int main(void) {
    const char *msg = "Hello, World!";
    const char *hint = "Press 'q' to quit";
    int row, col;
    int msg_y, msg_x;
    int hint_y, hint_x;

    initscr();
    cbreak();
    noecho();
    keypad(stdscr, TRUE);
    curs_set(0);

    if (has_colors()) {
        start_color();
        init_pair(1, COLOR_CYAN, COLOR_BLACK);
        init_pair(2, COLOR_YELLOW, COLOR_BLACK);
    }

    getmaxyx(stdscr, row, col);
    msg_y = row / 2;
    msg_x = (col - (int)strlen(msg)) / 2;
    hint_y = row - 2;
    hint_x = (col - (int)strlen(hint)) / 2;

    attron(COLOR_PAIR(1) | A_BOLD);
    mvprintw(msg_y, msg_x, "%s", msg);
    attroff(COLOR_PAIR(1) | A_BOLD);

    attron(COLOR_PAIR(2));
    mvprintw(hint_y, hint_x, "%s", hint);
    attroff(COLOR_PAIR(2));

    refresh();

    while (getch() != 'q');

    endwin();
    return 0;
}
