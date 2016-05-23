settings {
	statusFile = "/tmp/lsyncd.stat",
	nodaemon = true,
}

sync {
	default.rsync,
	source="/src",
	target="/target",
}
