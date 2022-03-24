( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b209 - block
    b192 - block
    b969 - block
    b573 - block
    b831 - block
    b675 - block
    b228 - block
    b490 - block
    b889 - block
    b420 - block
    b645 - block
    b328 - block
    b1 - block
    b147 - block
    b109 - block
    b43 - block
    b941 - block
    b58 - block
    b73 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b209 )
    ( on b192 b209 )
    ( on b969 b192 )
    ( on b573 b969 )
    ( on b831 b573 )
    ( on b675 b831 )
    ( on b228 b675 )
    ( on b490 b228 )
    ( on b889 b490 )
    ( on b420 b889 )
    ( on b645 b420 )
    ( on b328 b645 )
    ( on b1 b328 )
    ( on b147 b1 )
    ( on b109 b147 )
    ( on b43 b109 )
    ( on b941 b43 )
    ( on b58 b941 )
    ( on b73 b58 )
    ( clear b73 )
  )
  ( :tasks
    ( Make-18Pile b192 b969 b573 b831 b675 b228 b490 b889 b420 b645 b328 b1 b147 b109 b43 b941 b58 b73 )
  )
)
