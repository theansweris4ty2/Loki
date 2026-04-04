package Loki

import "core:c"
import "core:fmt"
import stb "vendor:stb/image"

main :: proc() {

	x, y, img := stb.load(cstring("callofcthulhu.jpg"))
	fmt.printf("Loaded image with a width of %dpx, height of %dpx, channels of %")
	stb.free(img)
}
