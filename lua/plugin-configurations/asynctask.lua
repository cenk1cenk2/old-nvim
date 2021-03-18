vim.g.asyncrun_open = 6
vim.g.asynctasks_extra_config = {'~/.config/nvim/utils/tasks.ini'}

-- Available Variables
-- $(VIM_FILEPATH)    # File name of current buffer with full path.
-- $(VIM_FILENAME)    # File name of current buffer without path.
-- $(VIM_FILEDIR)     # Full path of current buffer without the file name.
-- $(VIM_FILEEXT)     # File extension of current buffer.
-- $(VIM_FILETYPE)    # File type (value of &ft in vim)
-- $(VIM_FILENOEXT)   # File name of current buffer without path and extension.
-- $(VIM_PATHNOEXT)   # Current file name with full path but without extension.
-- $(VIM_CWD)         # Current directory (which :pwd returns).
-- $(VIM_RELDIR)      # File path relativize to current directory.
-- $(VIM_RELNAME)     # File name relativize to current directory.
-- $(VIM_ROOT)        # Project root directory.
-- $(VIM_CWORD)       # Word under cursor.
-- $(VIM_CFILE)       # File name under cursor.
-- $(VIM_CLINE)       # Cursor line number in current buffer
-- $(VIM_GUI)         # has('gui_runnin')?
-- $(VIM_VERSION)     # Value of v:version.
-- $(VIM_COLUMNS)     # Current screen width.
-- $(VIM_LINES)       # Current screen height.
-- $(VIM_SVRNAME)     # Value of v:servername.
-- $(VIM_PRONAME)     # Name of current project root directory
-- $(VIM_DIRNAME)     # Name of current directory
-- $(VIM_INIFILE)     # Full path name of current ini (.tasks) file.
-- $(VIM_INIHOME)     # Where the ini file locates.
