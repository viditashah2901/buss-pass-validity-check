#!/bin/bash
# ============================================================
#  STARTER KIT – L64 Bus Pass Validity Checker
#  Student: VIDITA SHAH  Roll: G44  Div: G
#  Run:  bash setup_buspass.sh
#  It creates ~/linux_project/buspass with folders, sample data and
#  EMPTY script files with TODO comments. You write all the code yourself.
# ============================================================
P="$HOME/linux_project/buspass"
if [ -d "$P" ]; then echo "Folder $P already exists. Rename or delete it first."; exit 1; fi
mkdir -p "$P"/lib "$P"/data "$P"/reports "$P"/backups "$P"/logs
cd "$P" || exit 1

# sample data: data/passes.csv
cat > 'data/passes.csv' <<'KIT_DATA_0'
pass_no,name,route,expiry
BP101,AARAV PATEL,Route-1,2026-11-02
BP102,DIYA SHAH,Route-3,2026-10-28
BP103,KABIR MEHTA,Route-1,2027-01-15
KIT_DATA_0

cat > lib/functions.sh <<'KIT_FUNCS'
#!/bin/bash
# lib/functions.sh – Bus Pass Validity Checker
# Write ALL functions here. main.sh loads this file with: source lib/functions.sh
DATA="data/passes.csv"

LOG="logs/activity.log"

# TODO: log  -> write one line "date time | message" into $LOG
#        hint: date, echo, >>
log() {
    :
}

# TODO: check_data -> if $DATA does not exist, print a message and return 1
#        hint: file test operators (-e, -f, -d)
check_data() {
    :
}

# TODO: show_help -> print how to use ./main.sh, ./main.sh --help, --backup, --cron
show_help() {
    echo "TODO: write the help text"
}

# TODO: view_data -> show the data file with line numbers (or list the folder)
#        hint: cat -n, more, ls -l
view_data() {
    echo "TODO: show the data"
}

# TODO: do_backup -> create backups/data_<date_time>.tar.gz of the data/ folder
#        hint: tar -czf, date +%Y%m%d_%H%M%S, du -h
do_backup() {
    echo "TODO: make a backup"
}

# TODO: view_log -> show the last 15 lines of $LOG
#        hint: tail
view_log() {
    echo "TODO: show the log"
}

# ------------------------------------------------------------
# FEATURE 1: List passes expiring in the next 7 days (date -d)
# Commands you can use: date -d, awk, sed -i, grep, sort, uniq -c
# Hints (see Step 5 of your guide):
#   - Columns in your data file are separated by a comma: pass_no, name, route, expiry.
#   - Ask the user what to search for with read -p.
#   - Search the data file with grep (ignore upper/lower case).
#   - If nothing is found, show a friendly message (check the exit status $?).
#   - Show only the columns that matter (cut or awk).
# ------------------------------------------------------------
feature_1() {
    echo "TODO: List passes expiring in the next 7 days (date -d)"
}

# ------------------------------------------------------------
# FEATURE 2: List expired passes
# Commands you can use: date -d, awk, sed -i, grep, sort, uniq -c
# Hints (see Step 6 of your guide):
#   - Columns in your data file are separated by a comma: pass_no, name, route, expiry.
#   - Ask the user what to search for with read -p.
#   - Search the data file with grep (ignore upper/lower case).
#   - If nothing is found, show a friendly message (check the exit status $?).
#   - Show only the columns that matter (cut or awk).
# ------------------------------------------------------------
feature_2() {
    echo "TODO: List expired passes"
}

# ------------------------------------------------------------
# FEATURE 3: Renew a pass by updating its expiry (sed -i)
# Commands you can use: date -d, awk, sed -i, grep, sort, uniq -c
# Hints (see Step 7 of your guide):
#   - Columns in your data file are separated by a comma: pass_no, name, route, expiry.
#   - Ask for the value that identifies the row (usually pass_no).
#   - First check the row exists (grep). If not, show 'Not found'.
#   - Change or remove only that row with sed -i. Take a backup first, sed -i changes the file directly.
#   - Print the row again so the user sees the change.
# ------------------------------------------------------------
feature_3() {
    echo "TODO: Renew a pass by updating its expiry (sed -i)"
}

# ------------------------------------------------------------
# FEATURE 4: Show number of passes per route
# Commands you can use: date -d, awk, sed -i, grep, sort, uniq -c
# Hints (see Step 8 of your guide):
#   - Columns in your data file are separated by a comma: pass_no, name, route, expiry.
#   - Remove the header line first (tail).
#   - Take only the column you need (cut with the right delimiter).
#   - Group and count with sort and uniq -c, or sort by a number column with sort -t and -k.
#   - Show only the top results with head.
# ------------------------------------------------------------
feature_4() {
    echo "TODO: Show number of passes per route"
}

# ------------------------------------------------------------
# FEATURE 5: Search a pass by name or number
# Commands you can use: date -d, awk, sed -i, grep, sort, uniq -c
# Hints (see Step 9 of your guide):
#   - Columns in your data file are separated by a comma: pass_no, name, route, expiry.
#   - Ask the user what to search for with read -p.
#   - Search the data file with grep (ignore upper/lower case).
#   - If nothing is found, show a friendly message (check the exit status $?).
#   - Show only the columns that matter (cut or awk).
# ------------------------------------------------------------
feature_5() {
    echo "TODO: Search a pass by name or number"
}

# ------------------------------------------------------------
# CRON TASK: Every day at 7 AM, write passes expiring in 7 days to reports/expiring.txt
# This runs when crontab calls:  ./main.sh --cron
# Write the output into reports/ or a file, and log it.
# ------------------------------------------------------------
cron_task() {
    echo "TODO: Every day at 7 AM, write passes expiring in 7 days to reports/expiring.txt"
}
KIT_FUNCS

cat > main.sh <<'KIT_MAIN'
#!/bin/bash
# main.sh – L64 Bus Pass Validity Checker
# YOUR TASK: build the menu program in this file (Step 3 of your guide).
cd "$(dirname "$0")" || exit 1
source lib/functions.sh

# TODO 1: command-line arguments (use $1 and case...esac)
#   ./main.sh --help    -> call show_help, then exit
#   ./main.sh --backup  -> call do_backup, then exit
#   ./main.sh --cron    -> call cron_task, then exit

# TODO 2: menu (use a while loop + read + case...esac)
#   Show a title, then these options, read the choice and call the function:
#     1) List passes expiring in the next 7 days (date -d)
#     2) List expired passes
#     3) Renew a pass by updating its expiry (sed -i)
#     4) Show number of passes per route
#     5) Search a pass by name or number
#     6) View data            -> view_data
#     7) Backup data          -> do_backup
#     8) View activity log    -> view_log
#     0) Exit                 -> say bye and stop the loop (break)
#   Any other choice -> print "Invalid choice"

echo "Menu not built yet. Open main.sh and complete TODO 1 and TODO 2."
KIT_MAIN

cat > README.md <<'KIT_README'
# L64 – Bus Pass Validity Checker

**Student:** VIDITA SHAH | **Roll:** G44 | **Division:** G | **Enrollment:** 24004501210391

## Problem
Build a bus-pass register that warns about passes expiring soon and supports renewal.

## Who will use it
College transport office.

## Folder structure
(explain what each file and folder is for)

## Features
1. List passes expiring in the next 7 days (date -d)
2. List expired passes
3. Renew a pass by updating its expiry (sed -i)
4. Show number of passes per route
5. Search a pass by name or number

## How to run
(write the commands to run your project)

## My crontab line and what it means
(write your crontab line and explain the 5 time fields)

## Commands I used and why
(list the commands and where you used them)

## What I learned
(write 3-5 lines)
KIT_README

chmod +x main.sh
echo
echo "Starter kit ready!  Folder: $P"
ls -R "$P"
echo
echo "Next:  cd ~/linux_project/buspass  and follow your project guide."
