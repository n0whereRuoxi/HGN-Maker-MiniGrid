( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b836 - block
    b939 - block
    b905 - block
    b780 - block
    b149 - block
    b411 - block
    b280 - block
    b144 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b836 )
    ( on b939 b836 )
    ( on b905 b939 )
    ( on b780 b905 )
    ( on b149 b780 )
    ( on b411 b149 )
    ( on b280 b411 )
    ( on b144 b280 )
    ( clear b144 )
  )
  ( :goal
    ( and
      ( clear b836 )
    )
  )
)
