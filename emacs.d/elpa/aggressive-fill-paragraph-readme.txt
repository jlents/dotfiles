An emacs minor-mode for keeping paragraphs filled in both comments and prose.

Each time a space is inserted the current paragraph is refilled.

M-space can be used to only insert a space (chosen because the behaviour
of space with this mode is enabled is very similar to `just-one-space`,
which is ususally bound to M-space).

Some special behaviour is implemented in a few major modes where the
default fill-paragraph behaviour would affect code as well as comments.
