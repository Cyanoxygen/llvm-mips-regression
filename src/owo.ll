define i128 @owo() {
start:
	%_dst = alloca i128, align 8
	%n = alloca i64, align 8
	store i64 1, ptr %n, align 8
	; %2 = n;
	%_2 = load i64, ptr %n, align 8, !noundef !1
	; %0 = %2 * 51;
	%0 = mul i64 %_2, 51
	store i64 %0, ptr %n, align 8
	%_6 = load i64, ptr %n, align 8, !noundef !1
	; Zero extend (i64)51 to (i128)51
	%1 = zext i64 %_6 to i128
	; %1 = %_6 mod 128
	%2 = and i128 %1, 127
	; %3 = 0x12481248124812481248124812481248 << n (n = 51)
	; This will produce a malformed value, as the bits shifted out from
	; lower 64 bits are not added to the upper 64 bits.
	; The malformed value is 0x92400000000000009240000000000000.
	%3 = shl i128 24300320091401419226498713096523616840, %2
	store i128 %3, ptr %_dst, align 8
	ret i128 %3
}

!1 = !{}
