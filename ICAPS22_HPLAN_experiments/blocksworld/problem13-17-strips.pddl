( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b339 - block
    b70 - block
    b63 - block
    b688 - block
    b785 - block
    b453 - block
    b888 - block
    b505 - block
    b991 - block
    b164 - block
    b514 - block
    b709 - block
    b309 - block
    b787 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b339 )
    ( on b70 b339 )
    ( on b63 b70 )
    ( on b688 b63 )
    ( on b785 b688 )
    ( on b453 b785 )
    ( on b888 b453 )
    ( on b505 b888 )
    ( on b991 b505 )
    ( on b164 b991 )
    ( on b514 b164 )
    ( on b709 b514 )
    ( on b309 b709 )
    ( on b787 b309 )
    ( clear b787 )
  )
  ( :goal
    ( and
      ( clear b339 )
    )
  )
)
