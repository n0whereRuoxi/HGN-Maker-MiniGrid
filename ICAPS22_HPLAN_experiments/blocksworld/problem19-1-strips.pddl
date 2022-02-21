( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b613 - block
    b638 - block
    b8 - block
    b74 - block
    b420 - block
    b414 - block
    b373 - block
    b557 - block
    b729 - block
    b840 - block
    b892 - block
    b774 - block
    b98 - block
    b763 - block
    b359 - block
    b378 - block
    b36 - block
    b496 - block
    b208 - block
    b731 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b613 )
    ( on b638 b613 )
    ( on b8 b638 )
    ( on b74 b8 )
    ( on b420 b74 )
    ( on b414 b420 )
    ( on b373 b414 )
    ( on b557 b373 )
    ( on b729 b557 )
    ( on b840 b729 )
    ( on b892 b840 )
    ( on b774 b892 )
    ( on b98 b774 )
    ( on b763 b98 )
    ( on b359 b763 )
    ( on b378 b359 )
    ( on b36 b378 )
    ( on b496 b36 )
    ( on b208 b496 )
    ( on b731 b208 )
    ( clear b731 )
  )
  ( :goal
    ( and
      ( clear b613 )
    )
  )
)
