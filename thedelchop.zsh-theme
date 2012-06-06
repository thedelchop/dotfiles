# ------------------------------------------------------------------------
# Joseph C. DelCioppio oh-my-zsh theme
# (Needs Git plugin for current_branch method and RVM plugin for rvm method
# ------------------------------------------------------------------------

BASE_03=$fg_bold[black]
BASE_02=$fg[black]
BASE_01=$fg_bold[green]
BASE_00=$fg_bold[yellow]
BASE_0=$fg_bold[blue]
BASE_1=$fg_bold[cyan]
BASE_2=$fg[white]
BASE_3=$fg_bold[white]

YELLOW=$fg[yellow]
ORANGE=$fg_bold[red]
RED=$fg[red]
MAGENTA=$fg[magenta]
VIOLET=$fg_bold[magenta]
BLUE=$fg[blue]
CYAN=$fg[cyan]
GREEN=$fg[green]

RESET_COLOR=$reset_color

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$RED%}unmerged"
ZSH_THEME_GIT_PROMPT_DELETED=" %{$RED%}deleted"
ZSH_THEME_GIT_PROMPT_RENAMED=" %{$YELLOW%}renamed"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$YELLOW%}modified"
ZSH_THEME_GIT_PROMPT_ADDED=" %{$GREEN%}added"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$WHITE%}untracked"

# Format for git_prompt_ahead()
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$RED%}(!)"

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=""
ZSH_THEME_GIT_PROMPT_SHA_AFTER=""

ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"

# Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%{$GREEN%}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%{$YELLOW%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%{$RED%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$CYAN%}"


# Determine the time since last commit. If branch is clean,
# use a neutral color, otherwise colors will vary according to time.
function git_time_since_commit() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        # Only proceed if there is actually a commit.
        if [[ $(git log 2>&1 > /dev/null | grep -c "^fatal: bad default revision") == 0 ]]; then
            # Get the last commit.
            last_commit=`git log --pretty=format:'%at' -1 2> /dev/null`
            now=`date +%s`
            seconds_since_last_commit=$((now-last_commit))

            # Totals
            MINUTES=$((seconds_since_last_commit / 60))
            HOURS=$((seconds_since_last_commit/3600))

            # Sub-hours and sub-minutes
            DAYS=$((seconds_since_last_commit / 86400))
            SUB_HOURS=$((HOURS % 24))
            SUB_MINUTES=$((MINUTES % 60))

            if [[ -n $(git status -s 2> /dev/null) ]]; then
                if [ "$MINUTES" -gt 30 ]; then
                    COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG"
                elif [ "$MINUTES" -gt 10 ]; then
                    COLOR="$ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM"
                else
                    COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT"
                fi
            else
                COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL"
            fi

            if [ "$HOURS" -gt 24 ]; then
                echo "($COLOR${DAYS}d${SUB_HOURS}h${SUB_MINUTES}m%{$reset_color%})"
            elif [ "$MINUTES" -gt 60 ]; then
                echo "($COLOR${HOURS}h${SUB_MINUTES}m%{$reset_color%})"
            else
                echo "($COLOR${MINUTES}m%{$reset_color%})"
            fi
        else
            COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL"
            echo "($COLOR~)"
        fi
    fi
 }

# Prompt format
PROMPT='
%{$BASE_01%}%n@%{$RESET_COLOR%}%{$BASE_0%}%m%{$RESET_COLOR%} %{$YELLOW%}%~%{$RESET_COLOR%} $(git_prompt_info) $(git_time_since_commit)
%{$BLUE%}>%{$RESET_COLOR%} '
RPROMPT='$(rvm-prompt v p g)'
