( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b31 - block
    b241 - block
    b743 - block
    b956 - block
    b769 - block
    b975 - block
    b835 - block
    b53 - block
    b318 - block
    b301 - block
    b236 - block
    b386 - block
    b411 - block
    b175 - block
    b355 - block
    b813 - block
    b414 - block
    b683 - block
    b620 - block
    b671 - block
    b755 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b31 )
    ( on b241 b31 )
    ( on b743 b241 )
    ( on b956 b743 )
    ( on b769 b956 )
    ( on b975 b769 )
    ( on b835 b975 )
    ( on b53 b835 )
    ( on b318 b53 )
    ( on b301 b318 )
    ( on b236 b301 )
    ( on b386 b236 )
    ( on b411 b386 )
    ( on b175 b411 )
    ( on b355 b175 )
    ( on b813 b355 )
    ( on b414 b813 )
    ( on b683 b414 )
    ( on b620 b683 )
    ( on b671 b620 )
    ( on b755 b671 )
    ( clear b755 )
  )
  ( :goal
    ( and
      ( clear b31 )
    )
  )
)
