local git_conflict_status_ok, git_conflict = pcall(require, 'git-conflict')
if not git_conflict_status_ok then
	return
end
