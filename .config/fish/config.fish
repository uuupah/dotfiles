if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Source - https://superuser.com/a/944589
# Posted by glenn jackman, modified by community. See post 'Timeline' for change history
# Retrieved 2026-04-12, License - CC BY-SA 4.0
function bind_bang
    switch (commandline -t)[-1]
        case "!"
            commandline -t -- $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end

function bind_dollar
    switch (commandline -t)[-1]
        case "!"
            commandline -f backward-delete-char history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
end

# TODO move this to ~/.config/fish/functions/fish_prompt.fish
function fish_prompt
    set -l last_status $status
    set -l arrow

    if test $last_status -ne 0
        set arrow (set_color red) '>(x> '
    else
        set arrow (set_color green) '>(> '
    end
    
    set -g __fish_git_prompt_showcolorhints yes
    set -g __fish_git_prompt_showdirtystate yes
    set -g __fish_git_prompt_char_dirtystate '+'
    set -g __fish_git_prompt_showuntrackedfiles yes
    set -g __fish_git_prompt_char_untrackedfiles '?'
    set -g __fish_git_prompt_char_upstream_equal
    set -g __fish_git_prompt_showupstream yes

    set -g fish_transient_prompt 1

    # im not 100% certain i want this long term but its really easy to disable by setting the above to 0
    if contains -- --final-rendering $argv
        string join '' -- \n (set_color cyan) (prompt_pwd --full-length-dirs 1) ' ' $arrow (set_color normal)
    else
        string join '' -- \n (set_color cyan) (prompt_pwd --full-length-dirs 3) (set_color normal) (fish_git_prompt) \n $arrow
    end
end

# set other-writable directory to yellow on black
set -x LS_COLORS ":ow=01;33"

# starship init fish | source
set fish_greeting
