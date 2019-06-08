# Auto Pull of git repositories

The `repos_update.sh` is a bash script which allows the user to configure an environment variable `$REPOROOT` where all repositories will be saved in. If this variable is not set, it asks the user to define it.

Then it defines an git alias - `git up` - which will be used instead of `git pull`
> `git up` is alias for `git remote update -p; git merge --ff-only @{u}`
> 
> `git up` downloads all the remote commits, ensures that any deleted branches on `origin\` are also deleted local and will perform a "fast-forward" merge - which will fail in case you have uncomitted changes localy.

Finally, repo by repo it performs `git up`. If there are uncommitted changes then you shall get a message similar to: _fatal: Not possible to fast-forward, aborting._

> chmod -x ./repos_update.sh # make it executable

> ./repos_update.sh