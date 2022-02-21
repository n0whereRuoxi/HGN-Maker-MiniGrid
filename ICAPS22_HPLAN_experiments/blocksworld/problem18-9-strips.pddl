( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b847 - block
    b56 - block
    b145 - block
    b114 - block
    b879 - block
    b102 - block
    b323 - block
    b869 - block
    b285 - block
    b701 - block
    b940 - block
    b956 - block
    b512 - block
    b152 - block
    b237 - block
    b392 - block
    b375 - block
    b899 - block
    b908 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b847 )
    ( on b56 b847 )
    ( on b145 b56 )
    ( on b114 b145 )
    ( on b879 b114 )
    ( on b102 b879 )
    ( on b323 b102 )
    ( on b869 b323 )
    ( on b285 b869 )
    ( on b701 b285 )
    ( on b940 b701 )
    ( on b956 b940 )
    ( on b512 b956 )
    ( on b152 b512 )
    ( on b237 b152 )
    ( on b392 b237 )
    ( on b375 b392 )
    ( on b899 b375 )
    ( on b908 b899 )
    ( clear b908 )
  )
  ( :goal
    ( and
      ( clear b847 )
    )
  )
)
