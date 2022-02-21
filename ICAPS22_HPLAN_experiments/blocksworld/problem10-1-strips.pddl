( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b92 - block
    b470 - block
    b45 - block
    b563 - block
    b38 - block
    b831 - block
    b434 - block
    b682 - block
    b262 - block
    b978 - block
    b750 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b92 )
    ( on b470 b92 )
    ( on b45 b470 )
    ( on b563 b45 )
    ( on b38 b563 )
    ( on b831 b38 )
    ( on b434 b831 )
    ( on b682 b434 )
    ( on b262 b682 )
    ( on b978 b262 )
    ( on b750 b978 )
    ( clear b750 )
  )
  ( :goal
    ( and
      ( clear b92 )
    )
  )
)
