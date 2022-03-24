( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b348 - block
    b205 - block
    b373 - block
    b889 - block
    b673 - block
    b441 - block
    b591 - block
    b228 - block
    b19 - block
    b391 - block
    b293 - block
    b894 - block
    b965 - block
    b133 - block
    b276 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b348 )
    ( on b205 b348 )
    ( on b373 b205 )
    ( on b889 b373 )
    ( on b673 b889 )
    ( on b441 b673 )
    ( on b591 b441 )
    ( on b228 b591 )
    ( on b19 b228 )
    ( on b391 b19 )
    ( on b293 b391 )
    ( on b894 b293 )
    ( on b965 b894 )
    ( on b133 b965 )
    ( on b276 b133 )
    ( clear b276 )
  )
  ( :goal
    ( and
      ( clear b348 )
    )
  )
)
