export const catch_ = thunk => {
	try {
		thunk();
		throw "your function did not throw";
	} catch (e) {
		return String(e)
	}
}
