( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b330 - block
    b806 - block
    b710 - block
    b134 - block
    b271 - block
    b91 - block
    b871 - block
    b172 - block
    b546 - block
    b725 - block
    b427 - block
    b128 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b330 )
    ( on b806 b330 )
    ( on b710 b806 )
    ( on b134 b710 )
    ( on b271 b134 )
    ( on b91 b271 )
    ( on b871 b91 )
    ( on b172 b871 )
    ( on b546 b172 )
    ( on b725 b546 )
    ( on b427 b725 )
    ( on b128 b427 )
    ( clear b128 )
  )
  ( :goal
    ( and
      ( clear b330 )
    )
  )
)
