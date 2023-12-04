/obj/item/borg/upgrade/expand
	var/ExpandSize = 200

/obj/item/borg/upgrade/expand/attack_self(mob/user)
	if(src && !user.incapacitated() && in_range(user,src))
		ExpandSize = input(user,"Choose the size of expanding (101-250)","Expander size setting") as null|num
		if(src && ExpandSize && !user.incapacitated() && in_range(user,src))
			sanitize_integer(ExpandSize, 101, 250, 200) //sanitize_integer won't work!
			if(!(101 <= ExpandSize && ExpandSize <= 250) || !isnum(ExpandSize) || ExpandSize == null || ExpandSize <= 0)
				ExpandSize = 200
			if(ExpandSize <= 0)
				ExpandSize = 200
			to_chat(user, "<span class='notice'>Expand set to [ExpandSize] %.</span>")
			return ExpandSize

/obj/item/borg/upgrade/shrink
	var/ShrinkSize = 50

/obj/item/borg/upgrade/shrink/attack_self(mob/user)
	if(src && !user.incapacitated() && in_range(user,src))
		ShrinkSize = input(user,"Choose the size of shrinking (50-99)","Shrinker size setting") as null|num
		if(src && ShrinkSize && !user.incapacitated() && in_range(user,src))
			sanitize_integer(ShrinkSize, 50, 99, 50) //sanitize_integer won't work!
			if(!(50 <= ShrinkSize && ShrinkSize <= 99) || !isnum(ShrinkSize) || ShrinkSize == null || ShrinkSize <= 0)
				ShrinkSize = 50
			if(ShrinkSize <= 0)
				ShrinkSize = 50
			to_chat(user, "<span class='notice'>Shrink set to [ShrinkSize] %.</span>")
			return ShrinkSize
