# pretty_git.zsh

# Enable or disable this plugin
PROMPT_GEOMETRY_GIT_STASHES=${PROMPT_GEOMETRY_GIT_STASHES:-false}
# Plugin options
GEOMETRY_COLOR_GIT_STASHES=${GEOMETRY_COLOR_GIT_STASHES:-"yellow"}
GEOMETRY_SYMBOL_GIT_STASHES=${GEOMETRY_SYMBOL_GIT_STASHES:-"📌"}

GEOMETRY_GIT_STASHES=$(prompt_geometry_colorize $GEOMETRY_COLOR_GIT_STASHES $GEOMETRY_SYMBOL_GIT_STASHES)


geometry_prompt_git_stashes_setup() {}


geometry_prompt_git_stashes_check() {
  # Do nothing if we're not in a repository
  [ -d $PWD/.git ] || return 1
}


geometry_prompt_git_stashes_render() {
  git rev-parse --quiet --verify refs/stash >/dev/null && echo $GEOMETRY_GIT_STASHES
}

geometry_plugin_register git_stashes
