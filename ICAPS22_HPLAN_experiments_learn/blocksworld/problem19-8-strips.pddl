( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b604 - block
    b826 - block
    b303 - block
    b93 - block
    b16 - block
    b602 - block
    b203 - block
    b593 - block
    b807 - block
    b362 - block
    b351 - block
    b269 - block
    b96 - block
    b193 - block
    b793 - block
    b273 - block
    b825 - block
    b530 - block
    b92 - block
    b962 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b604 )
    ( on b826 b604 )
    ( on b303 b826 )
    ( on b93 b303 )
    ( on b16 b93 )
    ( on b602 b16 )
    ( on b203 b602 )
    ( on b593 b203 )
    ( on b807 b593 )
    ( on b362 b807 )
    ( on b351 b362 )
    ( on b269 b351 )
    ( on b96 b269 )
    ( on b193 b96 )
    ( on b793 b193 )
    ( on b273 b793 )
    ( on b825 b273 )
    ( on b530 b825 )
    ( on b92 b530 )
    ( on b962 b92 )
    ( clear b962 )
  )
  ( :goal
    ( and
      ( clear b604 )
    )
  )
)
