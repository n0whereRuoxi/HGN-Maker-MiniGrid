( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b778 - block
    b788 - block
    b193 - block
    b32 - block
    b28 - block
    b891 - block
    b676 - block
    b47 - block
    b25 - block
    b228 - block
    b622 - block
    b324 - block
    b628 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b778 )
    ( on b788 b778 )
    ( on b193 b788 )
    ( on b32 b193 )
    ( on b28 b32 )
    ( on b891 b28 )
    ( on b676 b891 )
    ( on b47 b676 )
    ( on b25 b47 )
    ( on b228 b25 )
    ( on b622 b228 )
    ( on b324 b622 )
    ( on b628 b324 )
    ( clear b628 )
  )
  ( :goal
    ( and
      ( clear b778 )
    )
  )
)
