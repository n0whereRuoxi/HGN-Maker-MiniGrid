( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b764 - block
    b147 - block
    b865 - block
    b708 - block
    b891 - block
    b10 - block
    b628 - block
    b262 - block
    b995 - block
    b834 - block
    b180 - block
    b312 - block
    b124 - block
    b239 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b764 )
    ( on b147 b764 )
    ( on b865 b147 )
    ( on b708 b865 )
    ( on b891 b708 )
    ( on b10 b891 )
    ( on b628 b10 )
    ( on b262 b628 )
    ( on b995 b262 )
    ( on b834 b995 )
    ( on b180 b834 )
    ( on b312 b180 )
    ( on b124 b312 )
    ( on b239 b124 )
    ( clear b239 )
  )
  ( :goal
    ( and
      ( clear b764 )
    )
  )
)
