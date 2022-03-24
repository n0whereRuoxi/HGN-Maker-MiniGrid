( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b410 - block
    b194 - block
    b218 - block
    b625 - block
    b670 - block
    b244 - block
    b102 - block
    b587 - block
    b198 - block
    b377 - block
    b384 - block
    b390 - block
    b639 - block
    b179 - block
    b472 - block
    b75 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b410 )
    ( on b194 b410 )
    ( on b218 b194 )
    ( on b625 b218 )
    ( on b670 b625 )
    ( on b244 b670 )
    ( on b102 b244 )
    ( on b587 b102 )
    ( on b198 b587 )
    ( on b377 b198 )
    ( on b384 b377 )
    ( on b390 b384 )
    ( on b639 b390 )
    ( on b179 b639 )
    ( on b472 b179 )
    ( on b75 b472 )
    ( clear b75 )
  )
  ( :goal
    ( and
      ( clear b410 )
    )
  )
)
