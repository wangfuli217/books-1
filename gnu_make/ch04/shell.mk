# $(shell command)
# stderr can not be saved

stdout := $(shell echo normal message)
stderr := $(shell echo error message 1>&2)
shell-value:
	# $(stdout)
	# $(stderr)
