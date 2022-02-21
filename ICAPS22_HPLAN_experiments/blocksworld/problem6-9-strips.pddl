( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b430 - block
    b873 - block
    b743 - block
    b946 - block
    b562 - block
    b566 - block
    b950 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b430 )
    ( on b873 b430 )
    ( on b743 b873 )
    ( on b946 b743 )
    ( on b562 b946 )
    ( on b566 b562 )
    ( on b950 b566 )
    ( clear b950 )
  )
  ( :goal
    ( and
      ( clear b430 )
    )
  )
)
