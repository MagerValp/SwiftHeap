Opt     | Obj-C   | Swift
:------ | -------:| -----:
-O0     | 0.836   | 5249
-O1     | 0.757   | 5182
-O2     | 0.756   | 5181
-O3     | 0.774   | 5197
-Os     | 0.770   | 5021
-Ofast  | 0.774   | 5089


Implementation          | Time    | Note
:---------------------- | -------:|:-----------------
Obj-C NSMutableArray    |  0.009  | 
Swift Array             |  0.254  | 
Swift Array             | 54.981  | (Heap class subclassed from NSObject)
