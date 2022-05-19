const guard = {};

export const unsafeThrowImpl = throw_ => a => {
	if (throw_) throw [guard, a];
	return a;
};

export const mkReturnableImpl = throw_ => throw2b => {
	try {
		return throw2b(throw_);
	} catch (b) {
		try {
			if (b[0] === guard) return b[1];
			else throw 0;
		} catch (_) {
			throw b;
		}
	}
};
