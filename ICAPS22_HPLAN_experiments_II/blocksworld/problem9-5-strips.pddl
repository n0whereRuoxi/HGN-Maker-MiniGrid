( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b557 - block
    b259 - block
    b369 - block
    b215 - block
    b204 - block
    b876 - block
    b920 - block
    b869 - block
    b203 - block
    b749 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b557 )
    ( on b259 b557 )
    ( on b369 b259 )
    ( on b215 b369 )
    ( on b204 b215 )
    ( on b876 b204 )
    ( on b920 b876 )
    ( on b869 b920 )
    ( on b203 b869 )
    ( on b749 b203 )
    ( clear b749 )
  )
  ( :goal
    ( and
      ( clear b557 )
    )
  )
)
