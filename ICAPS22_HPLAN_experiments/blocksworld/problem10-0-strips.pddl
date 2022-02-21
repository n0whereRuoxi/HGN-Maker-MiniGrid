( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b341 - block
    b54 - block
    b265 - block
    b802 - block
    b650 - block
    b770 - block
    b781 - block
    b404 - block
    b549 - block
    b291 - block
    b559 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b341 )
    ( on b54 b341 )
    ( on b265 b54 )
    ( on b802 b265 )
    ( on b650 b802 )
    ( on b770 b650 )
    ( on b781 b770 )
    ( on b404 b781 )
    ( on b549 b404 )
    ( on b291 b549 )
    ( on b559 b291 )
    ( clear b559 )
  )
  ( :goal
    ( and
      ( clear b341 )
    )
  )
)
