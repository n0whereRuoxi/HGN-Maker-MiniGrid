( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b44 - block
    b519 - block
    b313 - block
    b385 - block
    b271 - block
    b180 - block
    b573 - block
    b655 - block
    b212 - block
    b448 - block
    b153 - block
    b513 - block
    b866 - block
    b707 - block
    b18 - block
    b808 - block
    b718 - block
    b269 - block
    b980 - block
    b493 - block
    b43 - block
    b823 - block
    b465 - block
    b930 - block
    b455 - block
    b550 - block
    b133 - block
    b170 - block
    b116 - block
    b29 - block
    b917 - block
    b742 - block
    b200 - block
    b771 - block
    b800 - block
    b904 - block
    b840 - block
    b533 - block
    b117 - block
    b784 - block
    b194 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b44 )
    ( on b519 b44 )
    ( on b313 b519 )
    ( on b385 b313 )
    ( on b271 b385 )
    ( on b180 b271 )
    ( on b573 b180 )
    ( on b655 b573 )
    ( on b212 b655 )
    ( on b448 b212 )
    ( on b153 b448 )
    ( on b513 b153 )
    ( on b866 b513 )
    ( on b707 b866 )
    ( on b18 b707 )
    ( on b808 b18 )
    ( on b718 b808 )
    ( on b269 b718 )
    ( on b980 b269 )
    ( on b493 b980 )
    ( on b43 b493 )
    ( on b823 b43 )
    ( on b465 b823 )
    ( on b930 b465 )
    ( on b455 b930 )
    ( on b550 b455 )
    ( on b133 b550 )
    ( on b170 b133 )
    ( on b116 b170 )
    ( on b29 b116 )
    ( on b917 b29 )
    ( on b742 b917 )
    ( on b200 b742 )
    ( on b771 b200 )
    ( on b800 b771 )
    ( on b904 b800 )
    ( on b840 b904 )
    ( on b533 b840 )
    ( on b117 b533 )
    ( on b784 b117 )
    ( on b194 b784 )
    ( clear b194 )
  )
  ( :goal
    ( and
      ( clear b44 )
    )
  )
)
