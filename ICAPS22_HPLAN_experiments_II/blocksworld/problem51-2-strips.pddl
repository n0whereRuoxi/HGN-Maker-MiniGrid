( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b790 - block
    b702 - block
    b373 - block
    b918 - block
    b42 - block
    b559 - block
    b178 - block
    b339 - block
    b654 - block
    b631 - block
    b822 - block
    b620 - block
    b809 - block
    b388 - block
    b585 - block
    b417 - block
    b24 - block
    b319 - block
    b308 - block
    b604 - block
    b420 - block
    b958 - block
    b813 - block
    b426 - block
    b263 - block
    b784 - block
    b67 - block
    b64 - block
    b101 - block
    b152 - block
    b998 - block
    b246 - block
    b344 - block
    b19 - block
    b3 - block
    b635 - block
    b590 - block
    b394 - block
    b819 - block
    b603 - block
    b521 - block
    b366 - block
    b821 - block
    b81 - block
    b818 - block
    b317 - block
    b806 - block
    b823 - block
    b645 - block
    b510 - block
    b230 - block
    b390 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b790 )
    ( on b702 b790 )
    ( on b373 b702 )
    ( on b918 b373 )
    ( on b42 b918 )
    ( on b559 b42 )
    ( on b178 b559 )
    ( on b339 b178 )
    ( on b654 b339 )
    ( on b631 b654 )
    ( on b822 b631 )
    ( on b620 b822 )
    ( on b809 b620 )
    ( on b388 b809 )
    ( on b585 b388 )
    ( on b417 b585 )
    ( on b24 b417 )
    ( on b319 b24 )
    ( on b308 b319 )
    ( on b604 b308 )
    ( on b420 b604 )
    ( on b958 b420 )
    ( on b813 b958 )
    ( on b426 b813 )
    ( on b263 b426 )
    ( on b784 b263 )
    ( on b67 b784 )
    ( on b64 b67 )
    ( on b101 b64 )
    ( on b152 b101 )
    ( on b998 b152 )
    ( on b246 b998 )
    ( on b344 b246 )
    ( on b19 b344 )
    ( on b3 b19 )
    ( on b635 b3 )
    ( on b590 b635 )
    ( on b394 b590 )
    ( on b819 b394 )
    ( on b603 b819 )
    ( on b521 b603 )
    ( on b366 b521 )
    ( on b821 b366 )
    ( on b81 b821 )
    ( on b818 b81 )
    ( on b317 b818 )
    ( on b806 b317 )
    ( on b823 b806 )
    ( on b645 b823 )
    ( on b510 b645 )
    ( on b230 b510 )
    ( on b390 b230 )
    ( clear b390 )
  )
  ( :goal
    ( and
      ( clear b790 )
    )
  )
)
