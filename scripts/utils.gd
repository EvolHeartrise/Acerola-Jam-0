class_name Utils
extends Node

func wait_for_all_signals(signals: Array[Signal]) -> void:
	var all_signals_fired: Signal = Signal()
	var signals_done: int = 0
	var signal_callback: Callable = func():
		signals_done += 1
		if signals_done == signals.size():
			all_signals_fired.emit()
	for given_signal: Signal in signals:
		given_signal.connect(signal_callback)
	await all_signals_fired
	for given_signal: Signal in signals:
		given_signal.disconnect(signal_callback)
	
