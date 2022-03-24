( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b58 - block
    b590 - block
    b891 - block
    b868 - block
    b126 - block
    b770 - block
    b50 - block
    b104 - block
    b744 - block
    b931 - block
    b800 - block
    b256 - block
    b508 - block
    b497 - block
    b394 - block
    b560 - block
    b294 - block
    b837 - block
    b695 - block
    b588 - block
    b473 - block
    b71 - block
    b825 - block
    b974 - block
    b179 - block
    b680 - block
    b16 - block
    b15 - block
    b483 - block
    b356 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b58 )
    ( on b590 b58 )
    ( on b891 b590 )
    ( on b868 b891 )
    ( on b126 b868 )
    ( on b770 b126 )
    ( on b50 b770 )
    ( on b104 b50 )
    ( on b744 b104 )
    ( on b931 b744 )
    ( on b800 b931 )
    ( on b256 b800 )
    ( on b508 b256 )
    ( on b497 b508 )
    ( on b394 b497 )
    ( on b560 b394 )
    ( on b294 b560 )
    ( on b837 b294 )
    ( on b695 b837 )
    ( on b588 b695 )
    ( on b473 b588 )
    ( on b71 b473 )
    ( on b825 b71 )
    ( on b974 b825 )
    ( on b179 b974 )
    ( on b680 b179 )
    ( on b16 b680 )
    ( on b15 b16 )
    ( on b483 b15 )
    ( on b356 b483 )
    ( clear b356 )
  )
  ( :goal
    ( and
      ( clear b58 )
    )
  )
)
