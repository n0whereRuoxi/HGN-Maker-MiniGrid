( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b672 - block
    b424 - block
    b619 - block
    b776 - block
    b325 - block
    b255 - block
    b822 - block
    b806 - block
    b818 - block
    b575 - block
    b367 - block
    b251 - block
    b419 - block
    b812 - block
    b113 - block
    b726 - block
    b190 - block
    b357 - block
    b431 - block
    b395 - block
    b150 - block
    b439 - block
    b41 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b672 )
    ( on b424 b672 )
    ( on b619 b424 )
    ( on b776 b619 )
    ( on b325 b776 )
    ( on b255 b325 )
    ( on b822 b255 )
    ( on b806 b822 )
    ( on b818 b806 )
    ( on b575 b818 )
    ( on b367 b575 )
    ( on b251 b367 )
    ( on b419 b251 )
    ( on b812 b419 )
    ( on b113 b812 )
    ( on b726 b113 )
    ( on b190 b726 )
    ( on b357 b190 )
    ( on b431 b357 )
    ( on b395 b431 )
    ( on b150 b395 )
    ( on b439 b150 )
    ( on b41 b439 )
    ( clear b41 )
  )
  ( :goal
    ( and
      ( clear b672 )
    )
  )
)
