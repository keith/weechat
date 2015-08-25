# Stupid simple script for OS X that uses the terminal-notifier script to
# send notifications via Notification Center. It has literally 0 configuration.

def weechat_init
  Weechat.register(
    "terminal_notifier",
    "Blake Williams",
    "0.2",
    "BSD",
    "Use terminal-notifier for highlights",
    "",
    ""
  )

  Weechat.hook_signal("weechat_pv", "show_highlight", "")
  Weechat.hook_signal("weechat_highlight", "show_highlight", "")

  Weechat::WEECHAT_RC_OK
end

def show_highlight(data, signal, message)
  message.gsub!(/\t/, ': ')
  message.gsub!(/"/, '\"')
  message.gsub!(/`/, '\`')
  message.chomp!

  # if find_executable 'terminal-notifier'
    `terminal-notifier -message "#{message}" -title "WeeChat" -sound "Hero"`
  # end

  Weechat::WEECHAT_RC_OK
end
