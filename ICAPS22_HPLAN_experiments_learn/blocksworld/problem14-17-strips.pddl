( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b340 - block
    b453 - block
    b532 - block
    b607 - block
    b814 - block
    b39 - block
    b873 - block
    b693 - block
    b842 - block
    b144 - block
    b266 - block
    b242 - block
    b110 - block
    b297 - block
    b233 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b340 )
    ( on b453 b340 )
    ( on b532 b453 )
    ( on b607 b532 )
    ( on b814 b607 )
    ( on b39 b814 )
    ( on b873 b39 )
    ( on b693 b873 )
    ( on b842 b693 )
    ( on b144 b842 )
    ( on b266 b144 )
    ( on b242 b266 )
    ( on b110 b242 )
    ( on b297 b110 )
    ( on b233 b297 )
    ( clear b233 )
  )
  ( :goal
    ( and
      ( clear b340 )
    )
  )
)
