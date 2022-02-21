( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b346 - block
    b902 - block
    b450 - block
    b147 - block
    b462 - block
    b123 - block
    b250 - block
    b343 - block
    b696 - block
    b862 - block
    b829 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b346 )
    ( on b902 b346 )
    ( on b450 b902 )
    ( on b147 b450 )
    ( on b462 b147 )
    ( on b123 b462 )
    ( on b250 b123 )
    ( on b343 b250 )
    ( on b696 b343 )
    ( on b862 b696 )
    ( on b829 b862 )
    ( clear b829 )
  )
  ( :goal
    ( and
      ( clear b346 )
    )
  )
)
