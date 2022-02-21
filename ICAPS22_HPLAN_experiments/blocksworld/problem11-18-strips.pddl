( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b489 - block
    b301 - block
    b161 - block
    b280 - block
    b732 - block
    b707 - block
    b569 - block
    b461 - block
    b587 - block
    b463 - block
    b9 - block
    b990 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b489 )
    ( on b301 b489 )
    ( on b161 b301 )
    ( on b280 b161 )
    ( on b732 b280 )
    ( on b707 b732 )
    ( on b569 b707 )
    ( on b461 b569 )
    ( on b587 b461 )
    ( on b463 b587 )
    ( on b9 b463 )
    ( on b990 b9 )
    ( clear b990 )
  )
  ( :goal
    ( and
      ( clear b489 )
    )
  )
)
