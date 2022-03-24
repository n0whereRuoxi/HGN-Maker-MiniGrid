( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b147 - block
    b660 - block
    b410 - block
    b193 - block
    b884 - block
    b308 - block
    b821 - block
    b255 - block
    b340 - block
    b257 - block
    b258 - block
    b330 - block
    b989 - block
    b422 - block
    b814 - block
    b306 - block
    b848 - block
    b309 - block
    b536 - block
    b519 - block
    b783 - block
    b311 - block
    b995 - block
    b750 - block
    b810 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b147 )
    ( on b660 b147 )
    ( on b410 b660 )
    ( on b193 b410 )
    ( on b884 b193 )
    ( on b308 b884 )
    ( on b821 b308 )
    ( on b255 b821 )
    ( on b340 b255 )
    ( on b257 b340 )
    ( on b258 b257 )
    ( on b330 b258 )
    ( on b989 b330 )
    ( on b422 b989 )
    ( on b814 b422 )
    ( on b306 b814 )
    ( on b848 b306 )
    ( on b309 b848 )
    ( on b536 b309 )
    ( on b519 b536 )
    ( on b783 b519 )
    ( on b311 b783 )
    ( on b995 b311 )
    ( on b750 b995 )
    ( on b810 b750 )
    ( clear b810 )
  )
  ( :goal
    ( and
      ( clear b147 )
    )
  )
)
