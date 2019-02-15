# Sometimes it's a README fix, or something like that - which isn't relevant for
# including in a project's CHANGELOG for example
declared_trivial = github.pr_title.include? "#trivial"

# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
warn("PR is classed as Work in Progress") if github.pr_title.include? "[WIP]"

# Warn when there is a big PR
warn("Big PR") if git.lines_of_code > 500

modified_files = git.modified_files + git.added_files

has_app_changes = !modified_files.grep("/TriforkSwiftExtensions/TriforkSwiftExtensions/").empty?
has_test_changes = !modified_files.grep("/TriforkSwiftExtensions/TriforkSwiftExtensions/").empty?
has_docs_changes = modified_files.grep('/docs/').empty?
# merging_against_correct_branch = git.branch_for_base == 'branch'

if has_app_changes && !has_docs_changes 
    warn("Please generate new docs files by running `bundle exec jazzy`")
end

if has_app_changes && !has_test_changes 
    warn("There are changes to sources files, but not the test files?")
end

