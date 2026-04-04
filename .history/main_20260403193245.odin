package Loki

import "core:fmt"
import stb "vendor:stb/image"

main :: proc() {

	fmt.println("Hello World")
	img := stb.load_from_memory()
}
