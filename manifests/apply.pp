#
# @summary
#
#
# @param change_window_set 
#   An array of change_window names to be merged.
#
# @param class_list
#   An array of classes to be applied when within the change_window.
#
define change_window::apply (
  Array $change_window_set,
  Array $class_list,
) {
  #Notify Module version
  notify { 'Version 1.0': }

  # Lookup named schedule
  debug("change_window_set = ${change_window_set}")

  # Set noop() when not "whithin" the change_window
  if  !str2bool(change_window::merge_change_windows($change_window_set)) {
    debug('not in change_window')
    notify { "#{${title}} not in change_windows #{${change_window_set}}, setting noop() mode.": }
    noop()
  } else {
    debug('in change_window')
    notify { "#{${title}} in change_windows #{${change_window_set}}": }
  }

  # Iterate the array of classes
  debug("class_list = ${class_list}")
  $class_list.each |$class_entry| {
    # complex class utilizing a hash structure
    if $class_entry.is_a(Hash) {
      create_resources('class', $class_entry)

      # Simple named class
    } else {
      include $class_entry
    }
  }
}
