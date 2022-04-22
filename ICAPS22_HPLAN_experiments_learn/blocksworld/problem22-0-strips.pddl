( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b364 - block
    b699 - block
    b236 - block
    b310 - block
    b328 - block
    b716 - block
    b311 - block
    b760 - block
    b93 - block
    b12 - block
    b535 - block
    b367 - block
    b808 - block
    b941 - block
    b365 - block
    b748 - block
    b225 - block
    b950 - block
    b910 - block
    b255 - block
    b75 - block
    b732 - block
    b215 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b364 )
    ( on b699 b364 )
    ( on b236 b699 )
    ( on b310 b236 )
    ( on b328 b310 )
    ( on b716 b328 )
    ( on b311 b716 )
    ( on b760 b311 )
    ( on b93 b760 )
    ( on b12 b93 )
    ( on b535 b12 )
    ( on b367 b535 )
    ( on b808 b367 )
    ( on b941 b808 )
    ( on b365 b941 )
    ( on b748 b365 )
    ( on b225 b748 )
    ( on b950 b225 )
    ( on b910 b950 )
    ( on b255 b910 )
    ( on b75 b255 )
    ( on b732 b75 )
    ( on b215 b732 )
    ( clear b215 )
  )
  ( :goal
    ( and
      ( clear b364 )
    )
  )
)
