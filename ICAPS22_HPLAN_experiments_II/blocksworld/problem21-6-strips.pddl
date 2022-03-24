( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b601 - block
    b245 - block
    b485 - block
    b481 - block
    b202 - block
    b796 - block
    b401 - block
    b210 - block
    b51 - block
    b703 - block
    b846 - block
    b518 - block
    b206 - block
    b533 - block
    b979 - block
    b487 - block
    b340 - block
    b865 - block
    b541 - block
    b521 - block
    b40 - block
    b84 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b601 )
    ( on b245 b601 )
    ( on b485 b245 )
    ( on b481 b485 )
    ( on b202 b481 )
    ( on b796 b202 )
    ( on b401 b796 )
    ( on b210 b401 )
    ( on b51 b210 )
    ( on b703 b51 )
    ( on b846 b703 )
    ( on b518 b846 )
    ( on b206 b518 )
    ( on b533 b206 )
    ( on b979 b533 )
    ( on b487 b979 )
    ( on b340 b487 )
    ( on b865 b340 )
    ( on b541 b865 )
    ( on b521 b541 )
    ( on b40 b521 )
    ( on b84 b40 )
    ( clear b84 )
  )
  ( :goal
    ( and
      ( clear b601 )
    )
  )
)
