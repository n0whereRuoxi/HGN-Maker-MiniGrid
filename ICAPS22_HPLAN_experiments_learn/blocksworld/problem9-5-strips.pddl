( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b625 - block
    b889 - block
    b302 - block
    b833 - block
    b828 - block
    b532 - block
    b270 - block
    b798 - block
    b300 - block
    b454 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b625 )
    ( on b889 b625 )
    ( on b302 b889 )
    ( on b833 b302 )
    ( on b828 b833 )
    ( on b532 b828 )
    ( on b270 b532 )
    ( on b798 b270 )
    ( on b300 b798 )
    ( on b454 b300 )
    ( clear b454 )
  )
  ( :goal
    ( and
      ( clear b625 )
    )
  )
)
