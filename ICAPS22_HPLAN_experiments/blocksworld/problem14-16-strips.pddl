( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b475 - block
    b888 - block
    b731 - block
    b125 - block
    b670 - block
    b567 - block
    b614 - block
    b76 - block
    b835 - block
    b283 - block
    b211 - block
    b709 - block
    b703 - block
    b754 - block
    b57 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b475 )
    ( on b888 b475 )
    ( on b731 b888 )
    ( on b125 b731 )
    ( on b670 b125 )
    ( on b567 b670 )
    ( on b614 b567 )
    ( on b76 b614 )
    ( on b835 b76 )
    ( on b283 b835 )
    ( on b211 b283 )
    ( on b709 b211 )
    ( on b703 b709 )
    ( on b754 b703 )
    ( on b57 b754 )
    ( clear b57 )
  )
  ( :goal
    ( and
      ( clear b475 )
    )
  )
)
