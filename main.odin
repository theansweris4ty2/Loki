package Loki

import "core:c"
import "core:fmt"
import stb "vendor:stb/image"

main :: proc() {

	x, y, channels: i32
	img := stb.load(cstring("callofcthulhu.jpg"), &x, &y, &channels, 0)
	fmt.printf("Loaded image with a width of %dpx, height of %dpx, channels of %d", x, y, channels)
	if img == nil {
		fmt.println("Error in loading message")
	}
	stb.image_free(img)
}
