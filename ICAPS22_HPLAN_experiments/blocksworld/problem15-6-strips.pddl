( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b546 - block
    b763 - block
    b87 - block
    b471 - block
    b674 - block
    b165 - block
    b231 - block
    b628 - block
    b971 - block
    b92 - block
    b159 - block
    b69 - block
    b195 - block
    b700 - block
    b947 - block
    b493 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b546 )
    ( on b763 b546 )
    ( on b87 b763 )
    ( on b471 b87 )
    ( on b674 b471 )
    ( on b165 b674 )
    ( on b231 b165 )
    ( on b628 b231 )
    ( on b971 b628 )
    ( on b92 b971 )
    ( on b159 b92 )
    ( on b69 b159 )
    ( on b195 b69 )
    ( on b700 b195 )
    ( on b947 b700 )
    ( on b493 b947 )
    ( clear b493 )
  )
  ( :goal
    ( and
      ( clear b546 )
    )
  )
)
