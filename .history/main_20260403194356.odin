package Loki

import "core:c"
import "core:fmt"
import stb "vendor:stb/image"

main :: proc() {

	x, y, channels, desired_channels: i32
	img := stb.load(cstring("callofcthulhu.jpg"), x, y, channels, desired_channels)
	fmt.printf(
		"Loaded image with a width of %dpx, height of %dpx, channels of %d, desired channels of %d",
	)
	stb.image_free(img)
}
