( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b800 - block
    b203 - block
    b159 - block
    b462 - block
    b926 - block
    b516 - block
    b920 - block
    b535 - block
    b824 - block
    b600 - block
    b361 - block
    b830 - block
    b42 - block
    b463 - block
    b422 - block
    b871 - block
    b313 - block
    b594 - block
    b883 - block
    b89 - block
    b939 - block
    b401 - block
    b960 - block
    b240 - block
    b478 - block
    b593 - block
    b256 - block
    b930 - block
    b721 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b800 )
    ( on b203 b800 )
    ( on b159 b203 )
    ( on b462 b159 )
    ( on b926 b462 )
    ( on b516 b926 )
    ( on b920 b516 )
    ( on b535 b920 )
    ( on b824 b535 )
    ( on b600 b824 )
    ( on b361 b600 )
    ( on b830 b361 )
    ( on b42 b830 )
    ( on b463 b42 )
    ( on b422 b463 )
    ( on b871 b422 )
    ( on b313 b871 )
    ( on b594 b313 )
    ( on b883 b594 )
    ( on b89 b883 )
    ( on b939 b89 )
    ( on b401 b939 )
    ( on b960 b401 )
    ( on b240 b960 )
    ( on b478 b240 )
    ( on b593 b478 )
    ( on b256 b593 )
    ( on b930 b256 )
    ( on b721 b930 )
    ( clear b721 )
  )
  ( :goal
    ( and
      ( clear b800 )
    )
  )
)
