( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b387 - block
    b231 - block
    b891 - block
    b847 - block
    b766 - block
    b631 - block
    b909 - block
    b402 - block
    b773 - block
    b358 - block
    b246 - block
    b396 - block
    b389 - block
    b244 - block
    b573 - block
    b597 - block
    b45 - block
    b776 - block
    b238 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b387 )
    ( on b231 b387 )
    ( on b891 b231 )
    ( on b847 b891 )
    ( on b766 b847 )
    ( on b631 b766 )
    ( on b909 b631 )
    ( on b402 b909 )
    ( on b773 b402 )
    ( on b358 b773 )
    ( on b246 b358 )
    ( on b396 b246 )
    ( on b389 b396 )
    ( on b244 b389 )
    ( on b573 b244 )
    ( on b597 b573 )
    ( on b45 b597 )
    ( on b776 b45 )
    ( on b238 b776 )
    ( clear b238 )
  )
  ( :goal
    ( and
      ( clear b387 )
    )
  )
)
