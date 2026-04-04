package Loki

import "core:c"
import "core:fmt"
import stb "vendor:stb/image"

main :: proc() {

	x, y, channels: i32
	img := stb.load(cstring("callofcthulhu.jpg"), x, y, channels)
	fmt.printf("Loaded image with a width of %dpx, height of %dpx, channels of %")
	stb.free(img)
}
