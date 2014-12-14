## IRB Styles & Customization
## ==========================

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

# IRB.conf[:PROMPT_MODE] = :SIMPLE

module CustomPrompt
  def self.apply!
    IRB.conf[:PROMPT][:PSYCHO] = {
      :PROMPT_I => "\033[0;94mruby >> \033[0;97m",
      :PROMPT_C => "\033[0;94mruby >> \033[0;97m",
      :PROMPT_S => "\033[0;94mruby ?> \033[0;97m",
      :RETURN   => "\033[1;97m=>\033[0m %.2048s\n"   
    }

    IRB.conf[:PROMPT_MODE] = :PSYCHO
  end
end

CustomPrompt.apply!
