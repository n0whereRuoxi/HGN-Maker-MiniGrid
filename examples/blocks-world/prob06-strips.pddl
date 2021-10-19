( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b000 - block
    b001 - block
    b002 - block
    b003 - block
    b006 - block
    b011 - block
    b010 - block
    b013 - block
    b012 - block
    b014 - block
  )
  ( :init
    ( on-table b000 )
    ( on b001 b000 )
    ( on b002 b001 )
    ( on b003 b002 )
    ( clear b003 )
    ( on-table b006 )
    ( clear b006 )
    ( hand-empty )    
    ( on-table b011 )
    ( on b010 b011 )
    ( on b013 b010 )
    ( clear b013 )
    ( on-table b012 )
    ( on b014 b012 )
    ( clear b014 )
  )
  ( :goal
    ( and
      ( on b006 b000 )
    )
  )
)

