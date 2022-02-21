( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b670 - block
    b230 - block
    b371 - block
    b710 - block
    b76 - block
    b882 - block
    b58 - block
    b185 - block
    b114 - block
    b581 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b670 )
    ( on b230 b670 )
    ( on b371 b230 )
    ( on b710 b371 )
    ( on b76 b710 )
    ( on b882 b76 )
    ( on b58 b882 )
    ( on b185 b58 )
    ( on b114 b185 )
    ( on b581 b114 )
    ( clear b581 )
  )
  ( :goal
    ( and
      ( clear b670 )
    )
  )
)
