( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b221 - block
    b476 - block
    b457 - block
    b559 - block
    b520 - block
    b91 - block
    b92 - block
    b764 - block
    b983 - block
    b419 - block
    b314 - block
    b39 - block
    b592 - block
    b884 - block
    b556 - block
    b555 - block
    b319 - block
    b539 - block
    b263 - block
    b393 - block
    b666 - block
    b17 - block
    b545 - block
    b905 - block
    b645 - block
    b185 - block
    b78 - block
    b732 - block
    b655 - block
    b124 - block
    b704 - block
    b661 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b221 )
    ( on b476 b221 )
    ( on b457 b476 )
    ( on b559 b457 )
    ( on b520 b559 )
    ( on b91 b520 )
    ( on b92 b91 )
    ( on b764 b92 )
    ( on b983 b764 )
    ( on b419 b983 )
    ( on b314 b419 )
    ( on b39 b314 )
    ( on b592 b39 )
    ( on b884 b592 )
    ( on b556 b884 )
    ( on b555 b556 )
    ( on b319 b555 )
    ( on b539 b319 )
    ( on b263 b539 )
    ( on b393 b263 )
    ( on b666 b393 )
    ( on b17 b666 )
    ( on b545 b17 )
    ( on b905 b545 )
    ( on b645 b905 )
    ( on b185 b645 )
    ( on b78 b185 )
    ( on b732 b78 )
    ( on b655 b732 )
    ( on b124 b655 )
    ( on b704 b124 )
    ( on b661 b704 )
    ( clear b661 )
  )
  ( :goal
    ( and
      ( clear b221 )
    )
  )
)
