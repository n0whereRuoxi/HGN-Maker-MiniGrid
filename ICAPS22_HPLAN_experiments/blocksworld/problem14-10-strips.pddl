( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b151 - block
    b925 - block
    b271 - block
    b183 - block
    b487 - block
    b215 - block
    b937 - block
    b811 - block
    b389 - block
    b712 - block
    b951 - block
    b742 - block
    b305 - block
    b529 - block
    b767 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b151 )
    ( on b925 b151 )
    ( on b271 b925 )
    ( on b183 b271 )
    ( on b487 b183 )
    ( on b215 b487 )
    ( on b937 b215 )
    ( on b811 b937 )
    ( on b389 b811 )
    ( on b712 b389 )
    ( on b951 b712 )
    ( on b742 b951 )
    ( on b305 b742 )
    ( on b529 b305 )
    ( on b767 b529 )
    ( clear b767 )
  )
  ( :goal
    ( and
      ( clear b151 )
    )
  )
)
