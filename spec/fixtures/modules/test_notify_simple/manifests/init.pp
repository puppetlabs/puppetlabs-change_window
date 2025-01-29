#
# Class: test_notify_simple - creates a notify resource with optionally
#   specified title.
#
# @param mesg
#   The message to be displayed by the notify resource.
#
class test_notify_simple (
  String $mesg = 'test_notify_simple',
) {
  notify { $mesg: }
}
