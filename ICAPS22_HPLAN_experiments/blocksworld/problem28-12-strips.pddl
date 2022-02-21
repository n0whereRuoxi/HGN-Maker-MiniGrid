( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b293 - block
    b775 - block
    b766 - block
    b667 - block
    b834 - block
    b393 - block
    b26 - block
    b908 - block
    b820 - block
    b432 - block
    b549 - block
    b43 - block
    b240 - block
    b122 - block
    b746 - block
    b983 - block
    b246 - block
    b599 - block
    b319 - block
    b795 - block
    b517 - block
    b111 - block
    b386 - block
    b67 - block
    b60 - block
    b855 - block
    b290 - block
    b276 - block
    b146 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b293 )
    ( on b775 b293 )
    ( on b766 b775 )
    ( on b667 b766 )
    ( on b834 b667 )
    ( on b393 b834 )
    ( on b26 b393 )
    ( on b908 b26 )
    ( on b820 b908 )
    ( on b432 b820 )
    ( on b549 b432 )
    ( on b43 b549 )
    ( on b240 b43 )
    ( on b122 b240 )
    ( on b746 b122 )
    ( on b983 b746 )
    ( on b246 b983 )
    ( on b599 b246 )
    ( on b319 b599 )
    ( on b795 b319 )
    ( on b517 b795 )
    ( on b111 b517 )
    ( on b386 b111 )
    ( on b67 b386 )
    ( on b60 b67 )
    ( on b855 b60 )
    ( on b290 b855 )
    ( on b276 b290 )
    ( on b146 b276 )
    ( clear b146 )
  )
  ( :goal
    ( and
      ( clear b293 )
    )
  )
)
