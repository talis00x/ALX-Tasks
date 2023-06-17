#!/usr/bin/env bash
set -e

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")/."

# see also ".mailmap" for how email adresses and names are dedulicate

{
    cat <<'EOH'
#this file lists all individual having contributed content to the repository.
#For how it is generated, see 'generate_authors.sh'.
EOH
    echo
    git log --format='%aN <%aE>' | LC_ALL=C.UTF-8 sort -uf
    } > AUTHORS


