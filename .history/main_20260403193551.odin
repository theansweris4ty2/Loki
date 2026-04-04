package Loki

import "core:c"
import "core:fmt"
import stb "vendor:stb/image"

main :: proc() {

	fmt.println("Hello World")
	img := stb.load(cstring("callofcthulhu.jpg"))
}
