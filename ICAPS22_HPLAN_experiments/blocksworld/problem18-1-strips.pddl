( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b520 - block
    b347 - block
    b68 - block
    b177 - block
    b408 - block
    b452 - block
    b292 - block
    b255 - block
    b696 - block
    b400 - block
    b141 - block
    b529 - block
    b486 - block
    b643 - block
    b737 - block
    b345 - block
    b645 - block
    b463 - block
    b702 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b520 )
    ( on b347 b520 )
    ( on b68 b347 )
    ( on b177 b68 )
    ( on b408 b177 )
    ( on b452 b408 )
    ( on b292 b452 )
    ( on b255 b292 )
    ( on b696 b255 )
    ( on b400 b696 )
    ( on b141 b400 )
    ( on b529 b141 )
    ( on b486 b529 )
    ( on b643 b486 )
    ( on b737 b643 )
    ( on b345 b737 )
    ( on b645 b345 )
    ( on b463 b645 )
    ( on b702 b463 )
    ( clear b702 )
  )
  ( :goal
    ( and
      ( clear b520 )
    )
  )
)
