exports.catch = thunk => {
	try {
		thunk();
		throw "your function did not throw";
	} catch (e) {
		return String(e)
	}
}
