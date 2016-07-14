a crappy multi-valued dictionary

where each Association is like

- key -> value or
- key -> a collection of values


here's an article
https://en.wikipedia.org/wiki/Multivalued_function

To install it do

```Smalltalk
Metacello new
   baseline: 'MultiValuedDictionary';
   repository: 'github://vonbecmann/multi-valued-dictionary/repository';
   load.
```




