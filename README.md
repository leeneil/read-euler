read-euler
==========

Read Euler angles from a LST file generated by EMAN2

## Example
```
[pn, fn, euler] = read_euler_from_lst('orientation-center.3.0.lst')
```
or
```
[pn, fn, euler] = read_euler_from_lst('orientation-center.2.lst')
```

where `pn` is the particle no., `fn` is the file no. (if applies) and `euler` is a Nx3 matrix that records the Euler angles.
