package Loki

import "core:c"
import "core:fmt"
import stb "vendor:stb/image"

main :: proc() {

	x: i32 = 10
	y: i32 = 10
	channels: i32 = 10
	img := stb.load(cstring("callofcthulhu.jpg"), &x, &y, &channels, 0)
	fmt.printf(
		"Loaded image with a width of %dpx, height of %dpx, channels of %d, desired channels of %d",
	)
	stb.image_free(img)
}
