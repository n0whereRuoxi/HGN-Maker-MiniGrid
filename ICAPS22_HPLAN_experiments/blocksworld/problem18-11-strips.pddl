( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b60 - block
    b610 - block
    b775 - block
    b855 - block
    b537 - block
    b182 - block
    b340 - block
    b490 - block
    b215 - block
    b845 - block
    b575 - block
    b879 - block
    b171 - block
    b25 - block
    b170 - block
    b175 - block
    b374 - block
    b458 - block
    b789 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b60 )
    ( on b610 b60 )
    ( on b775 b610 )
    ( on b855 b775 )
    ( on b537 b855 )
    ( on b182 b537 )
    ( on b340 b182 )
    ( on b490 b340 )
    ( on b215 b490 )
    ( on b845 b215 )
    ( on b575 b845 )
    ( on b879 b575 )
    ( on b171 b879 )
    ( on b25 b171 )
    ( on b170 b25 )
    ( on b175 b170 )
    ( on b374 b175 )
    ( on b458 b374 )
    ( on b789 b458 )
    ( clear b789 )
  )
  ( :goal
    ( and
      ( clear b60 )
    )
  )
)
