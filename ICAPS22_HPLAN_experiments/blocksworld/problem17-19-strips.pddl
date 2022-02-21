( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b946 - block
    b333 - block
    b263 - block
    b754 - block
    b158 - block
    b531 - block
    b654 - block
    b888 - block
    b790 - block
    b632 - block
    b100 - block
    b489 - block
    b890 - block
    b706 - block
    b740 - block
    b997 - block
    b994 - block
    b655 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b946 )
    ( on b333 b946 )
    ( on b263 b333 )
    ( on b754 b263 )
    ( on b158 b754 )
    ( on b531 b158 )
    ( on b654 b531 )
    ( on b888 b654 )
    ( on b790 b888 )
    ( on b632 b790 )
    ( on b100 b632 )
    ( on b489 b100 )
    ( on b890 b489 )
    ( on b706 b890 )
    ( on b740 b706 )
    ( on b997 b740 )
    ( on b994 b997 )
    ( on b655 b994 )
    ( clear b655 )
  )
  ( :goal
    ( and
      ( clear b946 )
    )
  )
)
