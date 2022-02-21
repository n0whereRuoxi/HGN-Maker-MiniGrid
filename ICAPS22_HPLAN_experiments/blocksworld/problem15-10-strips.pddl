( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b355 - block
    b267 - block
    b821 - block
    b880 - block
    b54 - block
    b986 - block
    b147 - block
    b378 - block
    b956 - block
    b338 - block
    b155 - block
    b742 - block
    b417 - block
    b740 - block
    b939 - block
    b718 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b355 )
    ( on b267 b355 )
    ( on b821 b267 )
    ( on b880 b821 )
    ( on b54 b880 )
    ( on b986 b54 )
    ( on b147 b986 )
    ( on b378 b147 )
    ( on b956 b378 )
    ( on b338 b956 )
    ( on b155 b338 )
    ( on b742 b155 )
    ( on b417 b742 )
    ( on b740 b417 )
    ( on b939 b740 )
    ( on b718 b939 )
    ( clear b718 )
  )
  ( :goal
    ( and
      ( clear b355 )
    )
  )
)
