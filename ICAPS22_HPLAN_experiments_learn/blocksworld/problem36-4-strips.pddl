( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b649 - block
    b820 - block
    b548 - block
    b15 - block
    b967 - block
    b434 - block
    b86 - block
    b840 - block
    b687 - block
    b24 - block
    b332 - block
    b593 - block
    b722 - block
    b56 - block
    b276 - block
    b976 - block
    b22 - block
    b413 - block
    b284 - block
    b99 - block
    b374 - block
    b790 - block
    b310 - block
    b832 - block
    b754 - block
    b588 - block
    b170 - block
    b482 - block
    b698 - block
    b176 - block
    b594 - block
    b880 - block
    b613 - block
    b564 - block
    b220 - block
    b796 - block
    b138 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b649 )
    ( on b820 b649 )
    ( on b548 b820 )
    ( on b15 b548 )
    ( on b967 b15 )
    ( on b434 b967 )
    ( on b86 b434 )
    ( on b840 b86 )
    ( on b687 b840 )
    ( on b24 b687 )
    ( on b332 b24 )
    ( on b593 b332 )
    ( on b722 b593 )
    ( on b56 b722 )
    ( on b276 b56 )
    ( on b976 b276 )
    ( on b22 b976 )
    ( on b413 b22 )
    ( on b284 b413 )
    ( on b99 b284 )
    ( on b374 b99 )
    ( on b790 b374 )
    ( on b310 b790 )
    ( on b832 b310 )
    ( on b754 b832 )
    ( on b588 b754 )
    ( on b170 b588 )
    ( on b482 b170 )
    ( on b698 b482 )
    ( on b176 b698 )
    ( on b594 b176 )
    ( on b880 b594 )
    ( on b613 b880 )
    ( on b564 b613 )
    ( on b220 b564 )
    ( on b796 b220 )
    ( on b138 b796 )
    ( clear b138 )
  )
  ( :goal
    ( and
      ( clear b649 )
    )
  )
)
