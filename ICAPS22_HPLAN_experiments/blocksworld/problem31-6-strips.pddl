( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b457 - block
    b49 - block
    b958 - block
    b820 - block
    b493 - block
    b604 - block
    b204 - block
    b433 - block
    b32 - block
    b263 - block
    b963 - block
    b765 - block
    b189 - block
    b303 - block
    b206 - block
    b174 - block
    b253 - block
    b447 - block
    b703 - block
    b512 - block
    b980 - block
    b122 - block
    b412 - block
    b673 - block
    b340 - block
    b564 - block
    b862 - block
    b698 - block
    b708 - block
    b742 - block
    b132 - block
    b636 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b457 )
    ( on b49 b457 )
    ( on b958 b49 )
    ( on b820 b958 )
    ( on b493 b820 )
    ( on b604 b493 )
    ( on b204 b604 )
    ( on b433 b204 )
    ( on b32 b433 )
    ( on b263 b32 )
    ( on b963 b263 )
    ( on b765 b963 )
    ( on b189 b765 )
    ( on b303 b189 )
    ( on b206 b303 )
    ( on b174 b206 )
    ( on b253 b174 )
    ( on b447 b253 )
    ( on b703 b447 )
    ( on b512 b703 )
    ( on b980 b512 )
    ( on b122 b980 )
    ( on b412 b122 )
    ( on b673 b412 )
    ( on b340 b673 )
    ( on b564 b340 )
    ( on b862 b564 )
    ( on b698 b862 )
    ( on b708 b698 )
    ( on b742 b708 )
    ( on b132 b742 )
    ( on b636 b132 )
    ( clear b636 )
  )
  ( :goal
    ( and
      ( clear b457 )
    )
  )
)
