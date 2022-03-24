( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b647 - block
    b768 - block
    b55 - block
    b317 - block
    b333 - block
    b370 - block
    b215 - block
    b285 - block
    b676 - block
    b914 - block
    b26 - block
    b555 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b647 )
    ( on b768 b647 )
    ( on b55 b768 )
    ( on b317 b55 )
    ( on b333 b317 )
    ( on b370 b333 )
    ( on b215 b370 )
    ( on b285 b215 )
    ( on b676 b285 )
    ( on b914 b676 )
    ( on b26 b914 )
    ( on b555 b26 )
    ( clear b555 )
  )
  ( :goal
    ( and
      ( clear b647 )
    )
  )
)
