#!/bin/bash

# --- Data ---
N_CHUDS=2
# these are the variables the rest of the script is aware of
# they are dynamically populated using a bash hack
CHUD=''              # the ascii art
HORIZONTAL_OFFSET='' # horizontal space until the right side of his head
FREE_LINES=''        # vertical space until the bottom of the speech bubble
# 
CHUD1='⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣀⣀⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣷⣶⣶⣶⣤⣤⣤⣄⡀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣾⣿⠿⠛⠉⠉⠁⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠉⠙⠛⠛⠙⣿⡅⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣸⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡧⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠁⡀⠀⠀⠀⠀⡐⠀⠀⠀⠀⠀⠀⣿⣟⢀⣀⠀⠀⠀
⠀⠀⠀⠀⠀⣿⡇⠀⠀⢶⣤⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣠⣤⡤⠸⡁⠀⡘⠀⠀⠀
⠀⠀⠐⡈⠓⡟⠂⠤⢀⠊⠛⢙⣛⡿⠿⠶⠂⢀⢀⣀⡱⡾⠿⠿⠟⡟⡍⡐⠁⡃⠌⠀⠀⠀⠀
⠀⠀⠀⠈⠢⣁⠀⠀⠸⡀⠈⠘⠙⠐⢹⠈⠨⠀⠀⠐⡄⠀⠁⠊⠛⠁⢸⠀⠀⡏⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠘⡄⠀⠀⠀⠉⠁⠁⠐⠈⠀⠀⠀⠀⠀⡅⠒⠂⠀⠂⠒⠂⠀⠀⠅⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⡂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠁⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠂⠀⠀⠀⠀⠀⠀⠀⠀⢀⠃⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⡈⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠘⡄⠀⠀⠀⠀⠀⠀⠀⠂⠁⠁⠂⠁⠈⠄⠀⠀⠀⠀⠀⠀⡇⠀⠀   /⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢁⠀⠀⠀⠀⠄⠀⠀⢀⡠⢄⣀⣀⠤⣀⠀⠂⡀⠀⠀⢠⠀ ---'\''⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠰⠀⠀⠀⠈⢀⣔⣉⣁⣀⡀⢄⣀⣀⣀⠱⢦⠀⠀⠀⠆⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠣⡀⠀⠔⠉⢆⠀⠀⠀⠀⠀⠀⠀⣀⠤⠋⠐⢄⠎    
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢄⠀⠀⠀⠑⠒⢐⢄⠒⠊⠉⠀⠀⠀⡠⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⢄⠀⠀⠀⠁⠀⠀⠁⠀⢀⠠⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⠤⣀⠀⢀⢀⡠⠂⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀'
HORIZONTAL_OFFSET1=34
FREE_LINES1=11
#
CHUD2='⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣰⣶⣶⣶⣿⣿⣿⣿⣷⣶⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⠿⠛⠛⠻⢿⣿⣿⣿⣿⣿⣿⣿⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⢾⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠈⠉⠉⠉⠻⢿⢿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢠⠏⢸⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠿⢻⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢀⠇⠀⠈⠿⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢀⡞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⡸⠀⠀⠀⠀⠀⠀⠀⠀⡼⠛⠳⣄⡀⠀⠐⢿⣦⡀⠀⠀⠀⢠⠃⠀⣸⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢠⠇⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⠉⣳⠟⠒⠻⣿⣦⡀⠀⡘⠀⢰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢀⠞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠃⢠⣄⡀⠈⠙⢿⡌⠁⠀⡞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⣄⣈⢻⡿⠃⢰⠟⠲⣼⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⡰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⡶⢴⠋⠀⠀⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⡴⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠞⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡴⢟⠒⠀⠀⠀⠀⢰⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠏⠀⠀⠈⠉⣿⠇⠀⢀⡎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠠⣤⣤⣀⢰⠏⠉⠙⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⣠⠴⠢⠦⠽⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣿⣿⣿⣷⡄⣀⡀⠈⠉⠋⢹⠋⠁⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠿⠿⠿⠿⠿⠦⠈⠀⠀⠀⠸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀'
HORIZONTAL_OFFSET2=34
FREE_LINES2=11
#
function setup_random_chud() {
    N=$(expr ${RANDOM} % ${N_CHUDS} + 1)
    CHUD="CHUD${N}"
    CHUD="${!CHUD}"
    HORIZONTAL_OFFSET="HORIZONTAL_OFFSET${N}"
    HORIZONTAL_OFFSET="${!HORIZONTAL_OFFSET}"
    FREE_LINES="FREE_LINES${N}"
    FREE_LINES="${!FREE_LINES}"
}
# --- Code ---

# Cli
function usage() {
    echo "Usage: chudsay <text>"
    echo "       echo 'text' | ./chudsay.sh"
}


# Read piped input if no arguments are passed
if [ $# -eq 0 ]; then
    if [ -t 0 ]; then
        # No stdin either
        usage
        exit 1
    else
        # Read from stdin
        message=$(cat)
    fi
else
    message="$*"
fi

# Get configuration
setup_random_chud

# Format message
IFS=$'\n' read -rd '' -a lines <<<"$message"

max_len=0 # we will be padding each line to the same lenght to aling the border
for line in "${lines[@]}"; do
    [ ${#line} -gt $max_len ] && max_len=${#line}
done

#   top border
message="."$(printf '%.0s`' $(seq 1 $((max_len + 2))))".\n"
#   side borders
for line in "${lines[@]}"; do
    padded_line=$(printf "%-${max_len}s" "$line")
    message+=": $padded_line :\n"
done
#   bottom border
message+="\`"$(printf '%.0s.' $(seq 1 $((max_len + 2))))"\`\n"

message_height=$(expr ${#lines[@]} + 2)

# Normalize chud and message height
if [ $message_height -gt $FREE_LINES ]; then
    pad_chud=""
    n=$((message_height - $FREE_LINES))
    padding=$(printf "%${HORIZONTAL_OFFSET}s")
    for _ in $(seq 1 $n); do
        pad_chud+="${padding}\n"
    done
    CHUD="${pad_chud}${CHUD}"
elif [ $FREE_LINES -gt $message_height ]; then
    n=$(expr $FREE_LINES - $message_height)
    for _ in $(seq 1 $n); do
        message="\n$message"
    done
fi

# Paste next to each other
paste -d '\0' <(echo -e "$CHUD") <(echo -e "$message")
