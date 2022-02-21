( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b945 - block
    b103 - block
    b737 - block
    b470 - block
    b712 - block
    b978 - block
    b164 - block
    b709 - block
    b701 - block
    b950 - block
    b980 - block
    b372 - block
    b586 - block
    b619 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b945 )
    ( on b103 b945 )
    ( on b737 b103 )
    ( on b470 b737 )
    ( on b712 b470 )
    ( on b978 b712 )
    ( on b164 b978 )
    ( on b709 b164 )
    ( on b701 b709 )
    ( on b950 b701 )
    ( on b980 b950 )
    ( on b372 b980 )
    ( on b586 b372 )
    ( on b619 b586 )
    ( clear b619 )
  )
  ( :goal
    ( and
      ( clear b945 )
    )
  )
)
