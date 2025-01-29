#
# Class: test_notify_paramter - creates a notify resource with optionally
#   specified title.
#
# @param mesg
#   The message to be displayed by the notify resource.
class test_notify_parameter (
  String $mesg = 'test_notify_parameter',
) {
  notify { $mesg: }
}
