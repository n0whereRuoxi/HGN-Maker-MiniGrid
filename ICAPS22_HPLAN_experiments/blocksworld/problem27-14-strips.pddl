( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b658 - block
    b169 - block
    b776 - block
    b28 - block
    b85 - block
    b593 - block
    b953 - block
    b837 - block
    b865 - block
    b134 - block
    b334 - block
    b737 - block
    b285 - block
    b435 - block
    b512 - block
    b912 - block
    b366 - block
    b640 - block
    b337 - block
    b927 - block
    b798 - block
    b730 - block
    b904 - block
    b102 - block
    b309 - block
    b469 - block
    b210 - block
    b979 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b658 )
    ( on b169 b658 )
    ( on b776 b169 )
    ( on b28 b776 )
    ( on b85 b28 )
    ( on b593 b85 )
    ( on b953 b593 )
    ( on b837 b953 )
    ( on b865 b837 )
    ( on b134 b865 )
    ( on b334 b134 )
    ( on b737 b334 )
    ( on b285 b737 )
    ( on b435 b285 )
    ( on b512 b435 )
    ( on b912 b512 )
    ( on b366 b912 )
    ( on b640 b366 )
    ( on b337 b640 )
    ( on b927 b337 )
    ( on b798 b927 )
    ( on b730 b798 )
    ( on b904 b730 )
    ( on b102 b904 )
    ( on b309 b102 )
    ( on b469 b309 )
    ( on b210 b469 )
    ( on b979 b210 )
    ( clear b979 )
  )
  ( :goal
    ( and
      ( clear b658 )
    )
  )
)
