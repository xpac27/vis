################################
#
# VIS
#
# authors : Nyvath, YTG, VCogne
# date    : 06/22/10
#
################################

# Open vim in a session related to this repository's current branch
function vis
{
    if [[ "$1" = "" ]]; then
        if [[ "`ls ~/.vim/sessions/ | grep $branch`" = "" ]]; then
            vim -c 'SessionSaveAs '`git_session_name`
        else
            vim -c 'SessionOpen '`git_session_name`
        fi
    else
        git co $1  && vim -c 'SessionOpen '$1
   fi
}

# Get a proper session name for vim
git_session_name()
{
   echo "$(git config remote.origin.url)_$(git branch | grep \* | cut -f 2 -d ' ')"$
}

