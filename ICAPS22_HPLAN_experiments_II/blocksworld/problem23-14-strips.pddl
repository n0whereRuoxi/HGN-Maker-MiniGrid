( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b136 - block
    b674 - block
    b748 - block
    b92 - block
    b85 - block
    b3 - block
    b713 - block
    b939 - block
    b771 - block
    b364 - block
    b973 - block
    b329 - block
    b256 - block
    b524 - block
    b206 - block
    b981 - block
    b418 - block
    b785 - block
    b808 - block
    b875 - block
    b87 - block
    b445 - block
    b781 - block
    b27 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b136 )
    ( on b674 b136 )
    ( on b748 b674 )
    ( on b92 b748 )
    ( on b85 b92 )
    ( on b3 b85 )
    ( on b713 b3 )
    ( on b939 b713 )
    ( on b771 b939 )
    ( on b364 b771 )
    ( on b973 b364 )
    ( on b329 b973 )
    ( on b256 b329 )
    ( on b524 b256 )
    ( on b206 b524 )
    ( on b981 b206 )
    ( on b418 b981 )
    ( on b785 b418 )
    ( on b808 b785 )
    ( on b875 b808 )
    ( on b87 b875 )
    ( on b445 b87 )
    ( on b781 b445 )
    ( on b27 b781 )
    ( clear b27 )
  )
  ( :goal
    ( and
      ( clear b136 )
    )
  )
)
