( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b141 - block
    b742 - block
    b124 - block
    b481 - block
    b453 - block
    b910 - block
    b901 - block
    b472 - block
    b268 - block
    b246 - block
    b98 - block
    b357 - block
    b626 - block
    b37 - block
    b611 - block
    b233 - block
    b26 - block
    b783 - block
    b609 - block
    b160 - block
    b999 - block
    b104 - block
    b112 - block
    b103 - block
    b756 - block
    b650 - block
    b149 - block
    b692 - block
    b959 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b141 )
    ( on b742 b141 )
    ( on b124 b742 )
    ( on b481 b124 )
    ( on b453 b481 )
    ( on b910 b453 )
    ( on b901 b910 )
    ( on b472 b901 )
    ( on b268 b472 )
    ( on b246 b268 )
    ( on b98 b246 )
    ( on b357 b98 )
    ( on b626 b357 )
    ( on b37 b626 )
    ( on b611 b37 )
    ( on b233 b611 )
    ( on b26 b233 )
    ( on b783 b26 )
    ( on b609 b783 )
    ( on b160 b609 )
    ( on b999 b160 )
    ( on b104 b999 )
    ( on b112 b104 )
    ( on b103 b112 )
    ( on b756 b103 )
    ( on b650 b756 )
    ( on b149 b650 )
    ( on b692 b149 )
    ( on b959 b692 )
    ( clear b959 )
  )
  ( :goal
    ( and
      ( clear b141 )
    )
  )
)
