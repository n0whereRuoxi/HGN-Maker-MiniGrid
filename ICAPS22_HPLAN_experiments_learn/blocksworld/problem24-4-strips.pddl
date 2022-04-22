( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b236 - block
    b977 - block
    b119 - block
    b714 - block
    b91 - block
    b241 - block
    b712 - block
    b617 - block
    b249 - block
    b648 - block
    b519 - block
    b530 - block
    b243 - block
    b858 - block
    b245 - block
    b995 - block
    b989 - block
    b958 - block
    b831 - block
    b449 - block
    b605 - block
    b434 - block
    b85 - block
    b846 - block
    b63 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b236 )
    ( on b977 b236 )
    ( on b119 b977 )
    ( on b714 b119 )
    ( on b91 b714 )
    ( on b241 b91 )
    ( on b712 b241 )
    ( on b617 b712 )
    ( on b249 b617 )
    ( on b648 b249 )
    ( on b519 b648 )
    ( on b530 b519 )
    ( on b243 b530 )
    ( on b858 b243 )
    ( on b245 b858 )
    ( on b995 b245 )
    ( on b989 b995 )
    ( on b958 b989 )
    ( on b831 b958 )
    ( on b449 b831 )
    ( on b605 b449 )
    ( on b434 b605 )
    ( on b85 b434 )
    ( on b846 b85 )
    ( on b63 b846 )
    ( clear b63 )
  )
  ( :goal
    ( and
      ( clear b236 )
    )
  )
)
