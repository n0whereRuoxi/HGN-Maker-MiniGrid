( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b917 - block
    b380 - block
    b483 - block
    b251 - block
    b433 - block
    b837 - block
    b205 - block
    b891 - block
    b34 - block
    b656 - block
    b71 - block
    b903 - block
    b804 - block
    b151 - block
    b571 - block
    b746 - block
    b622 - block
    b952 - block
    b75 - block
    b45 - block
    b350 - block
    b559 - block
    b265 - block
    b212 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b917 )
    ( on b380 b917 )
    ( on b483 b380 )
    ( on b251 b483 )
    ( on b433 b251 )
    ( on b837 b433 )
    ( on b205 b837 )
    ( on b891 b205 )
    ( on b34 b891 )
    ( on b656 b34 )
    ( on b71 b656 )
    ( on b903 b71 )
    ( on b804 b903 )
    ( on b151 b804 )
    ( on b571 b151 )
    ( on b746 b571 )
    ( on b622 b746 )
    ( on b952 b622 )
    ( on b75 b952 )
    ( on b45 b75 )
    ( on b350 b45 )
    ( on b559 b350 )
    ( on b265 b559 )
    ( on b212 b265 )
    ( clear b212 )
  )
  ( :goal
    ( and
      ( clear b917 )
    )
  )
)
