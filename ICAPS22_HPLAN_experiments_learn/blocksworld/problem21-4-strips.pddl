( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b786 - block
    b340 - block
    b367 - block
    b519 - block
    b334 - block
    b628 - block
    b608 - block
    b752 - block
    b140 - block
    b949 - block
    b771 - block
    b530 - block
    b897 - block
    b672 - block
    b763 - block
    b705 - block
    b432 - block
    b570 - block
    b539 - block
    b447 - block
    b91 - block
    b568 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b786 )
    ( on b340 b786 )
    ( on b367 b340 )
    ( on b519 b367 )
    ( on b334 b519 )
    ( on b628 b334 )
    ( on b608 b628 )
    ( on b752 b608 )
    ( on b140 b752 )
    ( on b949 b140 )
    ( on b771 b949 )
    ( on b530 b771 )
    ( on b897 b530 )
    ( on b672 b897 )
    ( on b763 b672 )
    ( on b705 b763 )
    ( on b432 b705 )
    ( on b570 b432 )
    ( on b539 b570 )
    ( on b447 b539 )
    ( on b91 b447 )
    ( on b568 b91 )
    ( clear b568 )
  )
  ( :goal
    ( and
      ( clear b786 )
    )
  )
)
