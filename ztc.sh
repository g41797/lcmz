mkdir src/c
mkdir src/c/lcm
mkdir src/c/lcm/lcmgen

ls -la src/c/lcm/lcmgen/

zig build

for file in \
  emit_c.c\
  getopt.c\
  lcmgen.c\
  main.c\
  tokenize.c
do
      zig translate-c -lc --verbose-cimport -fno-emit-bin -I /usr/include/glib-2.0 -I /usr/lib64/glib-2.0/include -I /usr/include/glib-2.0/glib -I src/submodules/lcm src/submodules/lcm/lcmgen/$file > src/c/lcm/lcmgen/$file.zig
done

ls -la src/c/lcm/lcmgen/