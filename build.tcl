# Vivado Build Script for Systolic Array Demo
# Run: vivado -mode batch -source build.tcl

# Create project
create_project systolic_demo ./vivado_proj -part xc7a100tcsg324-1

# Add source files
add_files -norecurse {
    processing_element.v
    systolic_array.v
    top.v
}

# Add constraints file
add_files -norecurse {constraints.xdc}

# Set top module
set_property top top [current_fileset]

# Synthesis
launch_runs synth_1
wait_on_run synth_1

# Implementation
launch_runs impl_1
wait_on_run impl_1

# Generate bitstream
launch_runs impl_1 -step write_bitstream
wait_on_run impl_1

puts "Build complete! Bitstream generated at:"
puts "[get_property DIRECTORY [current_run]]/systolic_demo.bit"
