( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b103 - block
    b739 - block
    b819 - block
    b371 - block
    b660 - block
    b243 - block
    b969 - block
    b445 - block
    b544 - block
    b59 - block
    b683 - block
    b733 - block
    b387 - block
    b778 - block
    b1 - block
    b863 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b103 )
    ( on b739 b103 )
    ( on b819 b739 )
    ( on b371 b819 )
    ( on b660 b371 )
    ( on b243 b660 )
    ( on b969 b243 )
    ( on b445 b969 )
    ( on b544 b445 )
    ( on b59 b544 )
    ( on b683 b59 )
    ( on b733 b683 )
    ( on b387 b733 )
    ( on b778 b387 )
    ( on b1 b778 )
    ( on b863 b1 )
    ( clear b863 )
  )
  ( :goal
    ( and
      ( clear b103 )
    )
  )
)
