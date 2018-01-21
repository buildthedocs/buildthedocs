#!/bin/sh

set -e # Exit with nonzero exit code if anything fails

scriptdir=$(dirname $0)

. "${scriptdir}/travis_utils.sh"
. "${scriptdir}/ansi_color.sh"
#disable_color

echo "travis_fold:start:config"
travis_time_start
. ${scriptdir}/config.sh
travis_time_finish
echo "travis_fold:end:config"

#>
# Pull requests and commits to other branches shouldn't try to deploy, just build to verify
# -o "$TRAVIS_BRANCH" != "$SOURCE_BRANCH"
if [ "$TRAVIS_PULL_REQUEST" != "false" ]; then
    printf "\nSkipping pages deploy\n"
    exit 0
fi

#SOURCE_BRANCH="builders"
#TARGET_BRANCH="gh-pages"
#REPO=`git config remote.origin.url`

printf "\n$ANSI_DARKCYAN[BTD - deploy] Clone '$BTD_TARGET_URL:$BTD_TARGET_BRANCH/$BTD_TARGET_DIR' to 'out' and clean existing contents$ANSI_NOCOLOR\n"
git clone -b "$BTD_TARGET_BRANCH" "$BTD_TARGET_URL" out

OUTDIR="out"
if [ "$BTD_TARGET_DIR" = "" ]; then
  OUTDIR="out/$BTD_TARGET_DIR"
fi
rm -rf "$OUTDIR"/**/* || exit 0

cp -r "$BTD_OUTPUT_DIR/html"/. "$OUTDIR"
cd out

git config user.name "Travis CI @ BTD"
git config user.email "travis@buildthedocs.btd"

printf "\n$ANSI_DARKCYAN[BTD - deploy] Add .nojekyll$ANSI_NOCOLOR\n"
#https://help.github.com/articles/files-that-start-with-an-underscore-are-missing/
touch .nojekyll

printf "\n$ANSI_DARKCYAN[BTD - deploy] Add changes$ANSI_NOCOLOR\n"
git add .
# If there are no changes to the compiled out (e.g. this is a README update) then just bail.
if [ $(git status --porcelain | wc -l) -lt 1 ]; then
    echo "No changes to the output on this push; exiting."
    exit 0
fi
git commit -am "BTD deploy: `git rev-parse --verify HEAD`"

printf "\n$ANSI_DARKCYAN[BTD - deploy] Get the deploy key $ANSI_NOCOLOR\n"
# by using Travis's stored variables to decrypt deploy_key.enc
eval `ssh-agent -s`
openssl aes-256-cbc -K $encrypted_0198ee37cbd2_key -iv $encrypted_0198ee37cbd2_iv -in ../"$BTD_DEPLOY_KEY" -d | ssh-add -

printf "\n$ANSI_DARKCYAN[BTD - deploy] Push to $BTD_TARGET_BRANCH $ANSI_NOCOLOR\n"
# Now that we're all set up, we can push.
git push `echo "$BTD_TARGET_URL" | sed -e 's/https:\/\/github.com\//git@github.com:/g'` $TARGET_BRANCH
#<
