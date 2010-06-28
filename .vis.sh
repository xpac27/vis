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
    if [[ "$1" = "-f" ]]; then
        session_name=`git_session_name`
        vim -c 'SessionSaveAs '$session_name
    else if [[ "$1" = "" ]]; then
        session_name=`git_session_name`
        if [[ "`ls ~/.vim/sessions/ | grep $session_name`" = "" ]]; then
            vim -c 'SessionSaveAs '$session_name
        else
            vim -c 'SessionOpen '$session_name
        fi
    else
        git co $1  && vim -c 'SessionOpen '$1
   fi
}

# Get a proper session name for vim
git_session_name()
{
   echo "$(git config remote.origin.url | sed 's/\//_/g' | sed 's/\@/_/g' | sed 's/:/_/g' | sed 's/\./_/g')_`git_branch_name`"
}

# Get git branch name
git_branch_name()
{
   git branch | grep \* | cut -f 2 -d ' '
}

