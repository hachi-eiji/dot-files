if defined?(PryByebug)
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
  Pry.commands.alias_command 'c', 'continue'
  # Hit Enter to repeat last command
  Pry::Commands.command /^$/, "repeat last command" do
    pry_instance.run_command Pry.history.to_a.last
  end
end
