( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b000 - block
    b001 - block
    b002 - block
    b003 - block
    b006 - block
    b007 - block
    b008 - block
    b009 - block
    b010 - block
    b011 - block
  )
  ( :init
    ( on-table b000 )
    ( on b001 b000 )
    ( on b002 b001 )
    ( on b003 b002 )
    ( clear b003 )
    ( on-table b007 )
    ( on b008 b007 )
    ( on b009 b008 )
    ( clear b009 )
    ( on-table b010 )
    ( on b011 b010 )
    ( clear b011 )
    ( hand-empty )
  )
  ( :goal
    ( and
      ( on b006 b000 )
    )
  )
)

