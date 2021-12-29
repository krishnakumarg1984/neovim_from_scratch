-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local status_ok, todo_comments = pcall(require, "todo-comments")
if not status_ok then
  return
end

todo_comments.setup({})
