commit=$(git show -s --format=%ci | cut -c 1-10)
current=$(date +%F)

assignees="gomamon"

success_title="$current :)"
success_label="o"
success_contents="success!"

fail_title="$current :("
fail_label="x"
fail_contents="fail!"

createFile()
{
  echo "---" >| .github/ISSUE_TEMPLATE.md
  echo "title: $1" >> .github/ISSUE_TEMPLATE.md
  echo "assignees: $assignees" >> .github/ISSUE_TEMPLATE.md
  echo "labels: $2" >> .github/ISSUE_TEMPLATE.md
  echo "---" >> .github/ISSUE_TEMPLATE.md
  echo "$3" >> .github/ISSUE_TEMPLATE.md
}

if [ "$commit" = "$current" ]
then
  createFile "$success_title" "$success_label" "$success_contents"
else
  createFile "$fail_title" "$fail_label" "$fail_contents"
fi
