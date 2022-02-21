( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b246 - block
    b533 - block
    b457 - block
    b640 - block
    b236 - block
    b779 - block
    b924 - block
    b348 - block
    b296 - block
    b754 - block
    b577 - block
    b176 - block
    b237 - block
    b341 - block
    b942 - block
    b193 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b246 )
    ( on b533 b246 )
    ( on b457 b533 )
    ( on b640 b457 )
    ( on b236 b640 )
    ( on b779 b236 )
    ( on b924 b779 )
    ( on b348 b924 )
    ( on b296 b348 )
    ( on b754 b296 )
    ( on b577 b754 )
    ( on b176 b577 )
    ( on b237 b176 )
    ( on b341 b237 )
    ( on b942 b341 )
    ( on b193 b942 )
    ( clear b193 )
  )
  ( :goal
    ( and
      ( clear b246 )
    )
  )
)
