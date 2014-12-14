## Custom Methods
## ==============

# Copy Text to clipboard
def copy(str)
  IO.popen('pbcopy', 'w') { |f| f << str.to_s }
end

# Copy Entire IRB History
def copy_history
  history = Readline::HISTORY.entries
  index = history.rindex("exit") || -1
  content = history[(index+1)..-2].join("\n")
  puts content
  copy content
end

# Paste from Clipboard
def paste
  `pbpaste`
end