( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b906 - block
    b827 - block
    b91 - block
    b521 - block
    b943 - block
    b999 - block
    b244 - block
    b953 - block
    b61 - block
    b622 - block
    b389 - block
    b12 - block
    b698 - block
    b112 - block
    b786 - block
    b788 - block
    b475 - block
    b280 - block
    b334 - block
    b913 - block
    b870 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b906 )
    ( on b827 b906 )
    ( on b91 b827 )
    ( on b521 b91 )
    ( on b943 b521 )
    ( on b999 b943 )
    ( on b244 b999 )
    ( on b953 b244 )
    ( on b61 b953 )
    ( on b622 b61 )
    ( on b389 b622 )
    ( on b12 b389 )
    ( on b698 b12 )
    ( on b112 b698 )
    ( on b786 b112 )
    ( on b788 b786 )
    ( on b475 b788 )
    ( on b280 b475 )
    ( on b334 b280 )
    ( on b913 b334 )
    ( on b870 b913 )
    ( clear b870 )
  )
  ( :goal
    ( and
      ( clear b906 )
    )
  )
)
