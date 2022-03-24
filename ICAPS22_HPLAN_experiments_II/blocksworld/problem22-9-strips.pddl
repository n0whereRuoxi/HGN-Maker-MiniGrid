( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b896 - block
    b453 - block
    b811 - block
    b854 - block
    b835 - block
    b207 - block
    b421 - block
    b504 - block
    b701 - block
    b584 - block
    b749 - block
    b959 - block
    b780 - block
    b779 - block
    b231 - block
    b691 - block
    b63 - block
    b19 - block
    b416 - block
    b561 - block
    b966 - block
    b355 - block
    b426 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b896 )
    ( on b453 b896 )
    ( on b811 b453 )
    ( on b854 b811 )
    ( on b835 b854 )
    ( on b207 b835 )
    ( on b421 b207 )
    ( on b504 b421 )
    ( on b701 b504 )
    ( on b584 b701 )
    ( on b749 b584 )
    ( on b959 b749 )
    ( on b780 b959 )
    ( on b779 b780 )
    ( on b231 b779 )
    ( on b691 b231 )
    ( on b63 b691 )
    ( on b19 b63 )
    ( on b416 b19 )
    ( on b561 b416 )
    ( on b966 b561 )
    ( on b355 b966 )
    ( on b426 b355 )
    ( clear b426 )
  )
  ( :goal
    ( and
      ( clear b896 )
    )
  )
)
