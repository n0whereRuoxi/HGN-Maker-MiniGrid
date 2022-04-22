( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b854 - block
    b458 - block
    b246 - block
    b341 - block
    b758 - block
    b900 - block
    b460 - block
    b933 - block
    b585 - block
    b789 - block
    b145 - block
    b425 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b854 )
    ( on b458 b854 )
    ( on b246 b458 )
    ( on b341 b246 )
    ( on b758 b341 )
    ( on b900 b758 )
    ( on b460 b900 )
    ( on b933 b460 )
    ( on b585 b933 )
    ( on b789 b585 )
    ( on b145 b789 )
    ( on b425 b145 )
    ( clear b425 )
  )
  ( :goal
    ( and
      ( clear b854 )
    )
  )
)
